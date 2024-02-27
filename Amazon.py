import requests
from bs4 import BeautifulSoup
import time
from selenium.webdriver.support import expected_conditions as EC
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.keys import Keys
from collections import OrderedDict
from datetime import date
from selenium.common.exceptions import NoSuchElementException
import pandas as pd
import cx_Oracle
import openpyxl
import re
import time
import os
import sys
import urllib.request
import json

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029110 Safari/537.3'
}

response = requests.get('https://www.amazon.com/', headers=headers)
options = Options()
options.add_argument('--start-maximized')
options.add_experimental_option("detach", True)
options.add_experimental_option("excludeSwitches", ["enable-logging"])
driver = webdriver.Chrome(options=options)
initial_input = sys.argv[1]
driver.get('https://www.amazon.com/')

searched = False  # 검색을 수행했는지 여부를 저장하는 변수

while not searched:
    try:
        amazon2 = driver.find_element(By.XPATH, '//*[@id="nav-bb-search"]')
        amazon2.click()
        ActionChains(driver).send_keys_to_element(amazon2, initial_input).perform()
        ActionChains(driver).send_keys(Keys.ENTER).perform()
        html = driver.page_source
        soup = BeautifulSoup(html, 'html.parser')
        searched = True  # 검색을 수행했다는 것을 표시
    except NoSuchElementException:
        pass

    try:
        cl = driver.find_element(By.XPATH, '//*[@id="twotabsearchtextbox"]')
        cl.click()
        ActionChains(driver).send_keys_to_element(cl, initial_input).perform()
        ActionChains(driver).send_keys(Keys.ENTER).perform()
        time.sleep(1)
        html = driver.page_source
        soup = BeautifulSoup(html, 'html.parser')
        searched = True  # 검색을 수행했다는 것을 표시
    except NoSuchElementException:
        pass

products = soup.select('.sg-col-inner')

product_dict = OrderedDict()
product_count = 0

while product_count < 50 :
    results_url = driver.current_url  # 결과 페이지 URL 저장
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')

    products = soup.select('.sg-col-inner')

    for product in products :
        is_sponsored = product.select_one('span.puis-sponsored-label-text, a.puis-label-popover.puis-sponsored-label-text')
        if is_sponsored:
            continue

        name = product.select_one('.a-size-medium.a-color-base.a-text-normal, .a-size-base-plus.a-color-base.a-text-normal')
        price = product.select_one('.a-offscreen')
        delivery = product.select_one('[data-cy="delivery-recipe"]')
        link = product.select_one('.a-link-normal.a-text-normal')
        image = product.select_one('.s-image')

        if name and price and link:
            name_text = name.text.strip()
            price_text = price.text.strip()
            price_text = price_text.replace('$', '')
            delivery_text = delivery.text.strip() if delivery else '배송 정보 없음'
            link_url = "https://www.amazon.com" + link['href']
            image_url = image['src']
            delivery_fee = re.search(r'(?<=\$)[0-9.]+', delivery_text)

            if delivery_fee:
                shipping_fee_text = delivery_fee.group()
                # delivery_text = delivery_text.replace(shipping_fee_text, '').strip()
            else:
                driver.get(link_url)
                time.sleep(1)
                detail_html = driver.page_source
                detail_soup = BeautifulSoup(detail_html, 'html.parser')
                shipping_fee = detail_soup.select_one('.a-color-secondary.a-size-base')
                if shipping_fee:
                    match = re.search(r'(?<=\$)[0-9.]+', shipping_fee.text)
                    shipping_fee_text = match.group() if match else '배송비 정보 없음'
                else:
                    shipping_fee_text = '배송비 정보 없음'
                driver.get(results_url)  # 결과 페이지로 돌아가기
                time.sleep(1)  # 페이지 로딩 대기

            product_info = (name_text, price_text, delivery_text, link_url, image_url, shipping_fee_text)
            product_dict[product_info] = None
            product_count += 1

            if product_count >= 50 :
                break

    if product_count < 50 :
        try:
            next_page_link = driver.find_element(By.CLASS_NAME, 's-pagination-item.s-pagination-next')
            if "s-pagination-disabled" not in next_page_link.get_attribute("class"):
                # 'Next' 버튼이 활성화된 경우
                next_page_link.click()
                time.sleep(2)  # 페이지 로딩 대기
            else:
                raise Exception  # 'Next' 버튼이 비활성화된 경우 예외 발생
        except Exception:
            print("더 이상 수집할 상품 정보가 없습니다.")
            break  # 다음 페이지 버튼이 없는 경우 루프 종료


for product_info in product_dict.keys():
    print(f"제품명: {product_info[0]}, 가격: {product_info[1]}, 배송정보: {product_info[2]}, 상품 URL: {product_info[3]}, 이미지 URL: {product_info[4]}, 배송비 : {product_info[5]}")

# 엑셀 파일 생성 및 열기
wb = openpyxl.Workbook()

# # 기존에 생성된 시트 개수 확인
# sheet_count = len(wb.sheetnames)

# 새 시트 생성
sheet = wb.active

sheet.append(['제품명', '가격', '배송비', '배송정보', '이미지URL', '페이지URL'])

# 엑셀 데이터 파일 쓰기
for idx, product_info in enumerate(product_dict.keys(), start=2):
    sheet[f'A{idx}'] = product_info[0]  # 제품명
    sheet[f'B{idx}'] = product_info[1]  # 가격
    sheet[f'C{idx}'] = product_info[5]  # 배송비
    sheet[f'D{idx}'] = product_info[2]  # 배송정보
    sheet[f'E{idx}'] = product_info[4]  # 이미지 URL
    sheet[f'F{idx}'] = product_info[3]  # 제품 URL

today = date.today()

filename = f"Amazon_{initial_input}_{today}.xlsx"

wb.save('backup_' + filename)

def get_exchange_rate():
    url = "https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_USDKRW"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')

    exchange_rate = soup.select_one('p.no_today').text
    exchange_rate = float(exchange_rate.replace(',', '').replace('원', ''))  # 콤마 제거 후 실수형으로 변환
    return exchange_rate

exchange_rate = get_exchange_rate()
print(f"현재 원/달러 환율: {exchange_rate}")

# 입력받은 검색어를 공백 단위로 구분
search_words = initial_input.split()

# 숫자와 문자가 함께 있는 단어를 찾아서, 숫자만 분리
additional_words = [re.findall(r'\d+', word) for word in search_words if re.search(r'\d', word) and re.search(r'[A-Za-z]', word)]
additional_words = [word for sublist in additional_words for word in sublist]  # Flatten the list

# 분리된 숫자를 검색어 리스트에 추가
search_words.extend(additional_words)

# 엑셀 파일 불러오기
df = pd.read_excel('backup_' + filename)

# 필터링된 데이터를 담을 DataFrame 생성
filtered_df = pd.DataFrame()

for word in search_words:
    # 상품명에 검색어 중 하나라도 포함되어 있으면 DataFrame에 저장
    temp_df = df[df['제품명'].str.contains(word, na=False)]  # na=False는 '제품명' 열에 NaN 값이 있을 경우를 대비
    filtered_df = pd.concat([filtered_df, temp_df])

# 중복된 행 제거
filtered_df = filtered_df.drop_duplicates()

# 가격 정보를 숫자로 변환
filtered_df['가격'] = pd.to_numeric(filtered_df['가격'], errors='coerce')

sorted_filtered_df = filtered_df.sort_index()
# 첫 번째 상품의 가격 가져오기
first_product_price = sorted_filtered_df.iloc[0]['가격']

# 첫 번째 상품의 가격의 +-50% 범위 계산
lower_bound = first_product_price * 0.5
upper_bound = first_product_price * 1.5

# 첫 번째 상품의 가격의 +-50% 범위 내의 제품만 필터링
final_filtered_df = filtered_df[(filtered_df['가격'] >= lower_bound) & (filtered_df['가격'] <= upper_bound)]

# 최종 필터링된 데이터를 엑셀에 저장
final_filtered_df.to_excel(filename, index=False)

# 'Amazon' 시트 불러오기
df_amazon = pd.read_excel(filename, sheet_name='Sheet1')

client_id = "4HmSmgPqoAkXAiFPF7UD" # 개발자센터에서 발급받은 Client ID 값
client_secret = "84N5AHSlf7" # 개발자센터에서 발급받은 Client Secret 값
encText = urllib.parse.quote(initial_input)
data = "source=en&target=ko&text=" + encText
url = "https://openapi.naver.com/v1/papago/n2mt"
request = urllib.request.Request(url)
request.add_header("X-Naver-Client-Id",client_id)
request.add_header("X-Naver-Client-Secret",client_secret)
response = urllib.request.urlopen(request, data=data.encode("utf-8"))
rescode = response.getcode()
if(rescode==200):
    response_body = response.read()
    print(response_body.decode('utf-8'))
else:
    print("Error Code:" + rescode)

# response_body를 딕셔너리로 변환
response_body_json = json.loads(response_body.decode('utf-8'))

# 'translatedText'의 값을 얻음
translated_text = response_body_json['message']['result']['translatedText']

# 입력받은 검색어를 공백 단위로 구분
search_words = initial_input.split()

# 숫자와 문자가 함께 있는 단어를 찾아서, 숫자만 분리
additional_words = [re.findall(r'\d+', word) for word in search_words if re.search(r'\d', word) and re.search(r'[A-Za-z]', word)]
additional_words = [word for sublist in additional_words for word in sublist]  # Flatten the list

keywords = search_words + additional_words + [translated_text]

filtered_df = df_amazon[df_amazon['제품명'].apply(lambda x: any(keyword.lower() in x.lower() for keyword in keywords))]

def convert_to_krw(value):
    # 값이 숫자로 변환 가능한지 확인
    try:
        value = float(value)
        return int(value * exchange_rate)
    except ValueError:  # 숫자로 변환 불가능한 경우
        return value  # 원래의 값을 그대로 반환
    
filtered_df['가격'] = filtered_df['가격'] * exchange_rate
filtered_df['가격'] = filtered_df['가격'].astype(int)
filtered_df['배송비'] = filtered_df['배송비'].apply(convert_to_krw)

# '배송비' 열에서 '배송비 정보 없음'이라는 값을 가진 행 제거
filtered_df = filtered_df[filtered_df['배송비'] != '배송비 정보 없음']

# 'Amazon' 시트에 저장
with pd.ExcelWriter(filename) as writer:
    filtered_df.to_excel(writer, sheet_name='Sheet1', index=False)

# 1. 필터링된 데이터가 있는 엑셀 파일을 DataFrame으로 불러오기
df = pd.read_excel(filename)

# 2. Oracle DB에 연결
con = cx_Oracle.connect("lucle", "lucle", "192.168.0.118:1521/xe", encoding="UTF-8")

# 3. Cursor 객체 생성
cursor = con.cursor()

# 4. DataFrame의 각 행을 DB에 입력
for idx, row in df.iterrows():
    # 각 행의 데이터를 추출
    product_name = row['제품명']
    product_market = 'Amazon'
    product_URL = row['페이지URL']
    product_img_URL = row['이미지URL']
    product_won = row['가격']
    product_delivery = row['배송정보']
    product_delivery_fee = row['배송비']
    product_keyword = "Logitech G102"
    product_visible = 1
    product_groupbuying = 1
    product_description = '마우스 / 광 / DPI+5버튼 / 연결 방식: 유선 / USB / 8000DPI / 가속도 30G / RGB라이트 / 게이밍 마우스 / 소프트웨어 지원 / 116.6mm / 62.1mm / 38.2mm / 85g / 2m / 2년 보증'
    category_large = 1
    category_medium = 1
    category_small = 2
    # SQL INSERT 문
    sql_insert = "INSERT INTO LUCLE.MARKET (NUM, PRODUCTNAME, MARKETNAME, URL, IMGURL, WON, DELIVERY, DELIVERYFEE, KEYWORD, VISIBLE, GROUPBUYING, DESCRIPTION) VALUES (seq_market.nextval, :1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11)"
    cursor.execute(sql_insert, (product_name, product_market, product_URL, product_img_URL, product_won, product_delivery, product_delivery_fee, product_keyword, product_visible, product_groupbuying, product_description))
    sql_insert2 = "INSERT INTO LUCLE.CATEGORY (LARGE, MEDIUM, SMALL, NUM) VALUES (:1, :2, :3, seq_market.currval)"
    cursor.execute(sql_insert2, (category_large, category_medium, category_small))

# 5. 변경 사항을 DB에 커밋
con.commit()

# 6. Cursor와 Connection 종료
cursor.close()
con.close()
