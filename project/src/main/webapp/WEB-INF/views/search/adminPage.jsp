<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../topbar.jsp"%>
<span class="titletext" hidden="hidden">상품 검색 이력</span>
<body>
	<div class="container-fluid p-5 bg-dark text-white text-center">
		<h1>상품 검색 이력</h1>
	</div>

	<div class="container mt-5">
		<div class="row">
			<div class="col">
				<div class="container">
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
				</div>
				<div class="container">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="sort"
							id="sort1" value="searchCount" checked="checked"> <label
							class="form-check-label" for="sort1">검색 회수</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="sort"
							id="sort2" value="male"> <label class="form-check-label"
							for="sort2">남성</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="sort"
							id="sort3" value="female"> <label
							class="form-check-label" for="sort3">여성</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="sort"
							id="sort4" value="gyeonggi"> <label
							class="form-check-label" for="sort4">경기</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="sort"
							id="sort5" value="seoul"> <label
							class="form-check-label" for="sort5">서울</label>
					</div>
				</div>

				<!-- 주소창의 패러미터에 로그인한 아이디와 다른 아이디가 입력되었을 경우 뒤로 돌려보냄. 이 판정은 컨트롤러에서 함.-->
				<c:if test="${sList == null}">
					<script>
						alert("잘못된 요청입니다");
					</script>
				</c:if>

				<!-- 게시글 목록 테이블 -->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>검색어</th>
							<th>검색 회수</th>
							<th>20대</th>
							<th>30대</th>
							<th>남성</th>
							<th>여성</th>
							<th>경기도</th>
							<th>서울</th>
						</tr>
					</thead>

					<tbody id="keywordRanking">
						<!-- 게시글 목록 반복 출력 -->
						<c:forEach var="s" items="${sList}">
							<tr>
								<td><a
									href="/market/search?keyword=${s.searchWord}&type=11st&type=ama&type=amaJp&type=ebay"
									target="_blank">${s.searchWord}</a></td>
								<td>${s.searchCount}</td>
								<td>${s.twenties}</td>
								<td>${s.thirties}</td>
								<td>${s.male}</td>
								<td>${s.female}</td>
								<td>${s.gyeonggi}</td>
								<td>${s.seoul}</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
    // 키워드 순위를 가져오는 함수
    $(document).ready(function() {		
        getKeywordRanking();
        console.log("ddd");

        $('input[name="sortTime"]').on('click', function() {
            getKeywordRanking();
        })
        
        $('input[name="sort"]').on('click', function() {
        	getKeywordRanking();
        })
    
	    function getKeywordRanking() {
	    	let sort = $('input[name="sort"]:checked').val();
	    	let sortTime = $('input[name="sortTime"]:checked').val();
	    	
	        searchService.getStatList(sortTime, sort, function(rank) {
	            let tbody = $('#keywordRanking');
	            tbody.empty();
	            
	            $.each(rank.slice(0, 10), function(index, item) {
	                let row = $('<tr>');
	                let titleLink = $('<a>').attr('href', '/market/search?keyword=' + item.searchWord + '&type=11st&type=ama&type=amaJp&type=ebay').text(item.searchWord);
	                let titleCell = $('<td>').append(titleLink);
	                row.append(titleCell);
	                row.append($('<td>').text(item.searchCount));
	                row.append($('<td>').text(item.twenties));
	                row.append($('<td>').text(item.thirties));
	                row.append($('<td>').text(item.male));
	                row.append($('<td>').text(item.female));
	                row.append($('<td>').text(item.gyeonggi));
	                row.append($('<td>').text(item.seoul));
	                tbody.append(row);
	            });
	        });
	    }
    });
	</script>
</body>
<%@include file="../footer.jsp"%>
