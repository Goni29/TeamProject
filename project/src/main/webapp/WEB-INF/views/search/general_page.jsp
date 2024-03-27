<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<div id="content-general" class="row content">
	<div class="col">
		<div class="d-flex justify-content-between">
			<div class="flex-fill">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sortTime"
						id="searchSort1" value="1" checked="checked"> <label
						class="form-check-label" for="searchSort1">24시간</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sortTime"
						id="searchSort2" value="7"> <label
						class="form-check-label" for="searchSort2">일주일</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sortTime"
						id="searchSort3" value="30"> <label
						class="form-check-label" for="searchSort3">한 달</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sortTime"
						id="searchSort4" value="36500"> <label
						class="form-check-label" for="searchSort4">전체 기간</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sort" id="sort2"
						value="male"> <label class="form-check-label" for="sort2">남성</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sort" id="sort3"
						value="female"> <label class="form-check-label"
						for="sort3">여성</label>
				</div>
			</div>

			<div class="flex-fill">
				<label><input type="checkbox" name="filter" value="gender">성별
					&nbsp;</label> <label><input type="checkbox" name="filter"
					value="locale">지역 &nbsp;</label> <label><input
					type="checkbox" name="filter" value="age">연령 &nbsp;</label>
			</div>
		</div>

		<c:if test="${sList == null}">
			<script>
                    alert("잘못된 요청입니다");
                </script>
		</c:if>

		<div class="border">
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

			<table class="table table-striped table-hover">
				<thead>
					<tr class="locale common-class" hidden="hidden">
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
		</div>

		<!-- 성별 차트 -->
		<canvas id="genderChart"></canvas>
		<!-- 연령대별 차트 -->
		<canvas id="ageChart"></canvas>
		<!-- 지역별 차트 -->
		<canvas id="localeChart"></canvas>


		<script>
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
            </script>

	</div>
</div>
</html>