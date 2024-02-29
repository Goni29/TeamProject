<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="./include.jsp"%>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Oh My Goni</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
	

    <!-- Page Wrapper -->
    <div id="wrapper">
    
<%@ include file="./sidebar.jsp"%>
<div id="conteny-wrapper" class="d-flex flex-column">       
<%@ include file="./nav.jsp"%>
<div id="content main-content">  

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">인기 급상승 상품</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
 <c:forEach var="product" items="${products}" begin="0" end="3">
          <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                            </div>
                   <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="${product.imgUrl}" alt="Product Image"> <br>
                   <a href="pr?keyword=${product.keyword}">
                       <c:choose>
                           <c:when test="${fn:length(product.productName) > 20}">
                               ${fn:substring(product.productName, 0, 20)}...
                           </c:when>
                           <c:otherwise>
                               ${product.productName}
                           </c:otherwise>
                       </c:choose>
                   </a><br>
                   <div class="row no-gutters align-items-center">
                       <div class="col-auto">
                           <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                       </div>
                       <div class="col">
                           <div class="progress progress-sm mr-2">
                               <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                       </div>
                   </div>
               </div>
               </c:forEach>
               </div>
               <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">당신을 위한 상품!</h1>
                        </div>

                        <div class="row">
                        <c:forEach var="product2" items="${products2}" begin="0" end="3">
          <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                                </div>
                   <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="${product2.imgUrl}" alt="Product Image"> <br>
                   <a href="pr?keyword=${product2.keyword}">
                       <c:choose>
                           <c:when test="${fn:length(product2.productName) > 20}">
                               ${fn:substring(product2.productName, 0, 20)}...
                           </c:when>
                           <c:otherwise>
                               ${product2.productName}
                           </c:otherwise>
                       </c:choose>
                   </a><br>
                   <div class="row no-gutters align-items-center">
                       <div class="col-auto">
                           <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                       </div>
                       <div class="col">
                           <div class="progress progress-sm mr-2">
                               <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                       </div>
                   </div>
               </div>
       </c:forEach>
       </div>
</div>

                        <div class="container mt-5">
                            <div class="row justify-content-center">
                                <div class="col">
                                    <h3>국내외 상품 가격 비교</h3>
                                    <hr>

                                    <div class="container">
                                        <div class="mb-3">
                                            <form action="/market/search" method="get">

                                                <label for="search" class="form-label">상품명 입력</label> <input type="text"
                                                    class="form-control" id="search" name="keyword"
                                                    placeholder="ex) logitech g102">

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                        name="type" value="11st" checked="checked">
                                                    <label class="form-check-label" for="inlineCheckbox1">11번가</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                                        name="type" value="ebay" checked="checked">
                                                    <label class="form-check-label" for="inlineCheckbox4">Ebay</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                        name="type" value="ama" checked="checked">
                                                    <label class="form-check-label" for="inlineCheckbox2">Amazon</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                        name="type" value="amaJp" checked="checked"> <label
                                                        class="form-check-label" for="inlineCheckbox3">Amazon
                                                        Japan</label>
                                                </div>
                                                <br>

                                                <button type="submit" id="submit"
                                                    class="btn btn-primary mb-3">검색</button>
                                                <span id="alert" class="text-danger"></span>
                                            </form>



                                            <img src="https://cdn.011st.com/11dims/resize/248/11src/pd/v2/2/4/3/3/4/5/IbOMi/2823243345_B.png"
                                                alt="Image">

                                        </div>
                                    </div>
                                </div>


                                <div class="col">
                                    <h3>실시간 검색 키워드</h3>
                                    <hr>
                                    <div class="container">
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
                                                            id="searchSort2" value="7"> <label class="form-check-label"
                                                            for="searchSort2">일주일</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="sortTime"
                                                            id="searchSort3" value="30"> <label class="form-check-label"
                                                            for="searchSort3">한 달</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="sortTime"
                                                            id="searchSort4" value="36500"> <label
                                                            class="form-check-label" for="searchSort4">전체 기간</label>
                                                    </div>
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>검색 키워드 TOP 10</th>
                                                                <th>검색 횟수</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="keywordRanking">
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div class="col-auto">
                                                        <a href='/search/userPage?id=${loginVo.id}'
                                                            class="btn btn-primary mb-3">내 검색 이력</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
	</div>
  </div>
  </div>
</body>

</html>
=======
	pageEncoding="UTF-8"%>

<%@include file="./nav.jsp"%>
<span class="titletext" hidden="hidden">OhMyGoni</span>

<body>
	<div class="container-fluid p-5 bg-dark text-white text-center">
		<h1>OhMyGoni</h1>
		<p>국내외 상품들의 가격을 비교하고, 추천해 주세요!</p>
	</div>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col">
				<h3>국내외 상품 가격 비교</h3>
				<hr>

				<div class="container">
					<div class="mb-3">
						<form action="/market/search" method="get">

							<label for="search" class="form-label">상품명 입력</label> <input
								type="text" class="form-control" id="search" name="keyword"
								placeholder="ex) logitech g102">

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox1" name="type" value="11st" checked="checked">
								<label class="form-check-label" for="inlineCheckbox1">11번가</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox4" name="type" value="ebay" checked="checked">
								<label class="form-check-label" for="inlineCheckbox4">Ebay</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox2" name="type" value="ama" checked="checked">
								<label class="form-check-label" for="inlineCheckbox2">Amazon</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox3" name="type" value="amaJp"
									checked="checked"> <label class="form-check-label"
									for="inlineCheckbox3">Amazon Japan</label>
							</div>
							<br>

							<button type="submit" id="submit" class="btn btn-primary mb-3">검색</button>
							<span id="alert" class="text-danger"></span>
						</form>
						
						
						
						<img src="https://cdn.011st.com/11dims/resize/248/11src/pd/v2/2/4/3/3/4/5/IbOMi/2823243345_B.png" alt="Image">
						
					</div>
				</div>
			</div>


			<div class="col">
			<h3>실시간 검색 키워드</h3>
				<hr>
				<div class="container">
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
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>검색 키워드 TOP 10</th>
												<th>검색 횟수</th>
											</tr>
										</thead>
										<tbody id="keywordRanking">
											<tr>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								<div class="col-auto">
									<a href='/search/userPage?id=${loginVo.id}' class="btn btn-primary mb-3">내 검색 이력</a>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() { // 쇼핑몰과 검색어가 비어 있지 않은지 확인. 비어 있을 경우 e.preventDefault();로 강제 종료.
			$('#submit').on('click', function(e) {
				
				// 체크된 쇼핑몰 수.
				let checked = $('input[name="type"]:checked').length;
				
				if (checked === 0) {
					$('#alert').text('최소 하나의 쇼핑몰을 선택해 주세요.')
					e.preventDefault();
				}
				if ($('#search').val() === '') {
					$('#alert').text('검색어를 입력해 주세요.')
					e.preventDefault();
				}
				
				// 종료되지 않을 경우, 검색 페이지로 넘어가기 전에 ID와 검색 키워드를 search DB에 저장.				
				var uid = '${loginVo.id}';
				var searchWord = $('#search').val();

				
			    searchService.insert({
			        id: uid,
			        searchWord: searchWord
			    });
			})
		})
	</script>


<script>
    $(document).ready(function() {
		
        // 페이지가 준비되면 실행될 함수들 호출
        getKeywordRanking();
        getBoardList();

        // 정렬 방식이 변경될 때마다 게시글 목록을 다시 가져오는 이벤트 핸들러 등록
        $('input[name="sortTime"]').on('click', function() {
            getKeywordRanking();
        })
        
        $('input[name="sort"]').on('click', function() {
            getBoardList();
        })
        
        // 키워드 순위를 가져오는 함수
        function getKeywordRanking() {
        	let sortTime = $('input[name="sortTime"]:checked').val(); // sortTime이 1이면 1일=24시간 내의 결과만 도출.
            searchService.getCountList(sortTime, function(rank) {
                // keywordRanking 테이블의 tbody 요소 선택
                let tbody = $('#keywordRanking');

                // tbody 내용 초기화
                tbody.empty();

                // rank 데이터를 순회하며 각각의 정보를 테이블에 추가
                $.each(rank.slice(0, 10), function(index, item) {
                    // 새로운 행(tr) 생성
                    let row = $('<tr>');

                    // 각 열(td)에 데이터 삽입
                    let titleLink = $('<a>').attr('href', '/market/search?keyword=' + item.searchWord + '&type=11st&type=ama&type=amaJp&type=ebay').text(item.searchWord);
                    let titleCell = $('<td>').append(titleLink);
                    row.append(titleCell);
                    row.append($('<td>').text(item.searchCount));

                    // 테이블에 행 추가
                    tbody.append(row);
                    
                    titleLink.on('click', function(e) {
                        // 랭크 키워드의 목록을 클릭시에도 저장.
                        var uid = '${loginVo.id}';
                        var searchWord = $(this).text();
                        
                        searchService.insert({
                            id: uid,
                            searchWord: searchWord
                        });
                    });
                });
            });
        }


        // 게시글 목록을 가져오는 함수
        function getBoardList() {
            let selectedSort = $('input[name="sort"]:checked').val();
            boardService.jsonList({
                sort: selectedSort,
                page: 1,
                category: 1//핫딜
            }, function(board) {
                // preview 테이블의 tbody 요소 선택
                let tbody = $('#preview');

                // tbody 내용 초기화
                tbody.empty();

                // board 데이터를 순회하며 각각의 정보를 테이블에 추가
                $.each(board.slice(0, 10), function(index, item) {
                    function formatDate(date) {
                        const options = {
                            year: 'numeric',
                            month: '2-digit',
                            day: '2-digit',
                            hour: '2-digit',
                            minute: '2-digit'
                        };
                        return new Intl.DateTimeFormat('ko-KR', options).format(new Date(date));
                    }
                    // 새로운 행(tr) 생성
                    let row = $('<tr>');

                    // 각 열(td)에 데이터 삽입
                    row.append($('<td>').text(item.summary));
                    let titleLink = $('<a>').attr('href', '/board/get?bno=' + item.bno).text(item.title);
                    let titleCell = $('<td>').append(titleLink);
                    row.append(titleCell);
                    row.append($('<td>').text(formatDate(item.regdate)));
                    row.append($('<td>').text(item.viewCount));
                    row.append($('<td>').text(item.recommend));

                    // 테이블에 행 추가
                    tbody.append(row);
                });
            });
        }
    })
</script>



</body>
</html>
>>>>>>> branch 'master' of https://github.com/Goni29/TeamProject.git
