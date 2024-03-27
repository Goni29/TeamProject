<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>

<style>
	.border {
        border: 1px solid #dee2e6;
    }
    .border table {
        margin-bottom: 0;
    }
    .border th, .border td {
        border: 1px solid #dee2e6;
    }
    .border thead th {
        border-bottom-width: 2px;
    }
    .page-size {
        width: 100vw;
    }
</style>

<body>
	<div id="wrapper">
	    <%@ include file="../sidebar.jsp"%>
	    <div id="content-wrapper" class="d-flex flex-column page-size">       
	        <%@ include file="../topbar.jsp"%>
	        
	        <span class="titletext" hidden="hidden">상품 조회현황 페이지</span>
	        <div class="container-fluid p-5 text-center">
	            <h1>상품 조회현황 페이지</h1>
	        </div>
	        
	        <div class="container mt-5">
	            <div class="row content">
	                <div class="col">
	                    <div class="d-flex justify-content-between">
	                        <div class="flex-fill">
	                            <label><input type="checkbox" name="filter" value="gender">성별 &nbsp;</label>
	                            <label><input type="checkbox" name="filter" value="locale">지역 &nbsp;</label>
	                            <label><input type="checkbox" name="filter" value="age">연령 &nbsp;</label>
	                        </div>
	                    </div>
	                    <c:if test="${sList == null}">
	                        <script>
	                            alert("잘못된 요청입니다");
	                        </script>
	                    </c:if>
	                    
	                    <div class="border">
	                        <div class="gender" hidden="hidden">
	                            <table class="table table-striped table-hover">
	                                <thead>
	                                    <tr class="gender common-class" hidden="hidden">
	                                        <th>카테고리</th>
	                                        <th>조회수</th>
	                                        <th>남성</th>
	                                        <th>여성</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:forEach var="s" items="${sList}">
	                                        <tr class="gender common-class" hidden="hidden">
	                                            <td>${s.PCATEGORY}</td>
	                                            <td>${s.PCATEGORY_COUNT}</td>
	                                            <td>${s.male}</td>
	                                            <td>${s.female}</td>
	                                        </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </table>
	                            <canvas id="genderChart"></canvas>
	                        </div>
	                        
	                        <div class="locale" hidden="hidden">
	                            <table class="table table-striped table-hover">
	                                <thead>
	                                    <tr class="locale common-class">
	                                        <th>검색어</th>
	                                        <th>검색 회수</th>
	                                        <th>서울</th>
	                                        <th>인천</th>
	                                        <th>부산</th>
	                                        <th>대구</th>
	                                        <th>광주</th>
	                                        <th>대전</th>
	                                        <th>울산</th>
	                                        <th>경기</th>
	                                        <th>강원</th>
	                                        <th>충북</th>
	                                        <th>충남</th>
	                                        <th>전북</th>
	                                        <th>전남</th>
	                                        <th>경북</th>
	                                        <th>경남</th>
	                                        <th>제주</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:forEach var="s" items="${sList}">
	                                        <tr class="locale common-class" hidden="hidden">
	                                            <td>${s.PCATEGORY}</td>
	                                            <td>${s.PCATEGORY_COUNT}</td>
	                                            <td>${s.seoul}</td>
	                                            <td>${s.incheon}</td>
	                                            <td>${s.busan}</td>
	                                            <td>${s.daegu}</td>
	                                            <td>${s.gwangju}</td>
	                                            <td>${s.daejeon}</td>
	                                            <td>${s.ulsan}</td>
	                                            <td>${s.gyeonggi}</td>
	                                            <td>${s.gangwon}</td>
	                                            <td>${s.chungbuk}</td>
												<td>${s.chungnam}</td>
												<td>${s.jeonbuk}</td>
												<td>${s.jeonnam}</td>
												<td>${s.gyeongbuk}</td>
												<td>${s.gyeongnam}</td>
												<td>${s.JEJU}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<canvas id="localeChart"></canvas>
							</div>
				
							<div class="age" hidden="hidden">
								<table class="table table-striped table-hover">
									<thead>
										<tr class="age common-class" hidden="hidden">
											<th>검색어</th>
											<th>검색 회수</th>
											<th>10대 이하</th>
											<th>20대</th>
											<th>30대</th>
											<th>40대</th>
											<th>50대</th>
											<th>60대 이상</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="s" items="${sList}">
											<tr class="age common-class" hidden="hidden">
												<td>${s.PCATEGORY}</td>
												<td>${s.PCATEGORY_COUNT}</td>
												<td>${s.teens}</td>
												<td>${s.twenties}</td>
												<td>${s.thirties}</td>
												<td>${s.forties}</td>
												<td>${s.fifties}</td>
												<td>${s.above}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<canvas id="ageChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button onclick="exportToExcel()">엑셀로 내보내기</button>
	</div>
<script>
   $(document).ready(function(){
     $('input[type="checkbox"][name="filter"]').change(function() {
       // 변경된 부분: 가시 유무를 설정할 대상을 좀 더 구체화하여 직계 자식인 div 엘리먼트만 선택합니다.
       $('.border > div').attr('hidden', true);

       $('input[type="checkbox"][name="filter"]:checked').each(function() {
         const value = $(this).val();
         // 변경된 부분: 선택된 필터에 해당하는 클래스를 가진 div 엘리먼트에 hidden 속성을 제거하여 보이도록 합니다.
         $('.' + value).removeAttr('hidden');
       });
     });
   });
   
// 데이터 초기화
   var categories = []; // 카테고리 이름
   var maleCounts = [], femaleCounts = []; // 성별 데이터
   // 연령대별 데이터 배열 초기화
   var teensCounts = [], twentiesCounts = [], thirtiesCounts = [], fortiesCounts = [], fiftiesCounts = [], sixtiesCounts = [];
   // 지역별 데이터 배열 초기화
   var seoulCounts = [], busanCounts = [], incheonCounts = [], daeguCounts = [], gwangjuCounts = [], daejeonCounts = [], ulsanCounts = [], gyeonggiCounts = [], gangwonCounts = [], chungbukCounts = [], chungnamCounts = [], jeonbukCounts = [], jeonnamCounts = [], gyeongbukCounts = [], gyeongnamCounts = [], jejuCounts = [];

   <c:forEach items="${sList}" var="s">
       categories.push("${s.PCATEGORY}");
       maleCounts.push(${s.male});
       femaleCounts.push(${s.female});
       teensCounts.push(${s.teens});
       twentiesCounts.push(${s.twenties});
       thirtiesCounts.push(${s.thirties});
       fortiesCounts.push(${s.forties});
       fiftiesCounts.push(${s.fifties});
       sixtiesCounts.push(${s.above});
       seoulCounts.push(${s.seoul});
       busanCounts.push(${s.busan});
       incheonCounts.push(${s.incheon});
       daeguCounts.push(${s.daegu});
       gwangjuCounts.push(${s.gwangju});
       daejeonCounts.push(${s.daejeon});
       ulsanCounts.push(${s.ulsan});
       gyeonggiCounts.push(${s.gyeonggi});
       gangwonCounts.push(${s.gangwon});
       chungbukCounts.push(${s.chungbuk});
       chungnamCounts.push(${s.chungnam});
       jeonbukCounts.push(${s.jeonbuk});
       jeonnamCounts.push(${s.jeonnam});
       gyeongbukCounts.push(${s.gyeongbuk});
       gyeongnamCounts.push(${s.gyeongnam});
       jejuCounts.push(${s.JEJU});
   </c:forEach>

   // 성별 차트 생성
   var genderCtx = document.getElementById('genderChart').getContext('2d');
   var genderChart = new Chart(genderCtx, {
       type: 'bar',
       data: {
           labels: categories,
           datasets: [{
                   label: '남성',
                   data: maleCounts,
                   backgroundColor: 'rgba(54, 162, 235, 0.2)',
                   borderColor: 'rgba(54, 162, 235, 1)',
                   borderWidth: 1
               },
               {
                   label: '여성',
                   data: femaleCounts,
                   backgroundColor: 'rgba(255, 99, 132, 0.2)',
                   borderColor: 'rgba(255, 99, 132, 1)',
                   borderWidth: 1
               }
           ]
       },
       options: {
           scales: {
               y: {
                   beginAtZero: true
               }
           }
       }
   });

   // 연령대별 차트 생성
   var ageCtx = document.getElementById('ageChart').getContext('2d');
   var ageChart = new Chart(ageCtx, {
       type: 'bar',
       data: {
           labels: categories,
           datasets: [
               {
                   label: '10대 이하',
                   data: teensCounts,
                   backgroundColor: 'rgba(255, 206, 86, 0.2)',
                   borderColor: 'rgba(255, 206, 86, 1)',
                   borderWidth: 1
               },
               {
                   label: '20대',
                   data: twentiesCounts,
                   backgroundColor: 'rgba(75, 192, 192, 0.2)',
                   borderColor: 'rgba(75,192, 192, 1)',
                   borderWidth: 1
               },
               {
               label: '30대',
               data: thirtiesCounts,
               backgroundColor: 'rgba(153, 102, 255, 0.2)',
               borderColor: 'rgba(153, 102, 255, 1)',
               borderWidth: 1
               },
               {
               label: '40대',
               data: fortiesCounts,
               backgroundColor: 'rgba(255, 159, 64, 0.2)',
               borderColor: 'rgba(255, 159, 64, 1)',
               borderWidth: 1
               },
               {
               label: '50대',
               data: fiftiesCounts,
               backgroundColor: 'rgba(54, 162, 235, 0.2)',
               borderColor: 'rgba(54, 162, 235, 1)',
               borderWidth: 1
               },
               {
               label: '60대 이상',
               data: sixtiesCounts,
               backgroundColor: 'rgba(255, 99, 132, 0.2)',
               borderColor: 'rgba(255, 99, 132, 1)',
               borderWidth: 1
               }
               ]
               },
               options: {
               scales: {
               y: {
               beginAtZero: true
               }
               }
               }
               });

               // 지역별 차트 생성
               var localeCtx = document.getElementById('localeChart').getContext('2d');
               var localeChart = new Chart(localeCtx, {
               type: 'bar',
               data: {
               labels: categories,
               datasets: [{
               label: '서울',
               data: seoulCounts,
               backgroundColor: 'rgba(255, 205, 86, 0.2)',
               borderColor: 'rgba(255, 205, 86, 1)',
               borderWidth: 1
               },
               {
               label: '부산',
               data: busanCounts,
               backgroundColor: 'rgba(75, 192, 192, 0.2)',
               borderColor: 'rgba(75, 192, 192, 1)',
               borderWidth: 1
               },
               {
               label: '인천',
               data: incheonCounts,
               backgroundColor: 'rgba(153, 102, 255, 0.2)',
               borderColor: 'rgba(153, 102, 255, 1)',
               borderWidth: 1
               },
               {
               label: '대구',
               data: daeguCounts,
               backgroundColor: 'rgba(255, 159, 64, 0.2)',
               borderColor: 'rgba(255, 159, 64, 1)',
               borderWidth: 1
               },
               {
                   label: '광주',
                   data: gwangjuCounts,
                   backgroundColor: 'rgba(255, 99, 132, 0.2)',
                   borderColor: 'rgba(255, 99, 132, 1)',
                   borderWidth: 1
               },
               {
                   label: '대전',
                   data: daejeonCounts,
                   backgroundColor: 'rgba(54, 162, 235, 0.2)',
                   borderColor: 'rgba(54, 162, 235, 1)',
                   borderWidth: 1
               },
               {
                   label: '울산',
                   data: ulsanCounts,
                   backgroundColor: 'rgba(255, 206, 86, 0.2)',
                   borderColor: 'rgba(255, 206, 86, 1)',
                   borderWidth: 1
               },
               {
                   label: '경기',
                   data: gyeonggiCounts,
                   backgroundColor: 'rgba(75, 192, 192, 0.2)',
                   borderColor: 'rgba(75, 192, 192, 1)',
                   borderWidth: 1
               },
               {
                   label: '강원',
                   data: gangwonCounts,
                   backgroundColor: 'rgba(153, 102, 255, 0.2)',
                   borderColor: 'rgba(153, 102, 255, 1)',
                   borderWidth: 1
               },
               {
                   label: '충북',
                   data: chungbukCounts,
                   backgroundColor: 'rgba(255, 159, 64, 0.2)',
                   borderColor: 'rgba(255, 159, 64, 1)',
                   borderWidth: 1
               },
               {
                   label: '충남',
                   data: chungnamCounts,
                   backgroundColor: 'rgba(255, 99, 132, 0.2)',
                   borderColor: 'rgba(255, 99, 132, 1)',
                   borderWidth: 1
               },
               {
                   label: '전북',
                   data: jeonbukCounts,
                   backgroundColor: 'rgba(54, 162, 235, 0.2)',
                   borderColor: 'rgba(54, 162, 235, 1)',
                   borderWidth: 1
               },
               {
                   label: '전남',
                   data: jeonnamCounts,
                   backgroundColor: 'rgba(255, 206, 86, 0.2)',
                   borderColor: 'rgba(255, 206, 86, 1)',
                   borderWidth: 1
               },
               {
                   label: '경북',
                   data: gyeongbukCounts,
                   backgroundColor: 'rgba(75, 192, 192, 0.2)',
                   borderColor: 'rgba(75, 192, 192, 1)',
                   borderWidth: 1
               },
               {
                   label: '경남',
                   data: gyeongnamCounts,
                   backgroundColor: 'rgba(153, 102, 255, 0.2)',
                   borderColor: 'rgba(153, 102, 255, 1)',
                   borderWidth: 1
               },
               {
                   label: '제주',
                   data: jejuCounts,
                   backgroundColor: 'rgba(255, 159, 64, 0.2)',
                   borderColor: 'rgba(255, 159, 64, 1)',
                   borderWidth: 1
               }]
           },
           options: {
               scales: {
                   y: {
                       beginAtZero: true
                   }
               }
           }
       });
               
               var dataList = [];

               <%-- sList 데이터를 JavaScript 배열로 변환 --%>
               <c:forEach items="${sList}" var="s">
                   dataList.push({
                       category: "${s.PCATEGORY}",
                       count: ${s.PCATEGORY_COUNT},
                       male: ${s.male},
                       female: ${s.female},
                       teens: ${s.teens},
                       twenties: ${s.twenties},
                       thirties: ${s.thirties},
                       forties: ${s.forties},
                       fifties: ${s.fifties},
                       sixtiesAndAbove: ${s.above},
                       seoul: ${s.seoul},
                       busan: ${s.busan},
                       incheon: ${s.incheon},
                       daegu: ${s.daegu},
                       gwangju: ${s.gwangju},
                       daejeon: ${s.daejeon},
                       ulsan: ${s.ulsan},
                       gyeonggi: ${s.gyeonggi},
                       gangwon: ${s.gangwon},
                       chungbuk: ${s.chungbuk},
                       chungnam: ${s.chungnam},
                       jeonbuk: ${s.jeonbuk},
                       jeonnam: ${s.jeonnam},
                       gyeongbuk: ${s.gyeongbuk},
                       gyeongnam: ${s.gyeongnam},
                       jeju: ${s.JEJU}
                   });
               </c:forEach>

               function exportToExcel() {
                   var wb = XLSX.utils.book_new(); // 새 워크북 생성
                   var ws_name = "상품 조회현황";
                   
                   // 첫 행에 들어갈 헤더 정보
                   var ws_data = [
                       ["카테고리", "조회수", "남성", "여성", "10대 이하", "20대", "30대", "40대", "50대", "60대 이상", "서울", "부산", "인천", "대구", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주"]
                   ];
                   
                   // dataList의 각 항목을 엑셀 시트 데이터에 추가
                   dataList.forEach(function(item) {
                       ws_data.push([item.category, item.count, item.male, item.female, item.teens, item.twenties, item.thirties, item.forties, item.fifties, item.above, item.seoul, item.busan, item.incheon, item.daegu, item.gwangju, item.daejeon, item.ulsan, item.gyeonggi, item.gangwon, item.chungbuk, item.chungnam, item.jeonbuk, item.jeonnam, item.gyeongbuk, item.gyeongnam, item.jeju]);
                   });

                   var ws = XLSX.utils.aoa_to_sheet(ws_data);
                   XLSX.utils.book_append_sheet(wb, ws, ws_name);
                   XLSX.writeFile(wb, "product_statistics.xlsx");
               }
</script>
<%@include file="../footer.jsp"%>

</body>