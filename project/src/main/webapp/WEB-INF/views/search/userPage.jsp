<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<style>
    .page-size {
        width: 100vw;
    }
</style>
<body>
<div id="wrapper">
<%@ include file="../sidebar.jsp"%>
<div id="conteny-wrapper" class="d-flex flex-column page-size">
<%@ include file="../topbar.jsp"%>
<span class="titletext" hidden="hidden">상품 검색 이력</span>
	<div class="container-fluid p-5 text-center">
		<h1>상품 검색 이력</h1>
	</div>

	<div class="container mt-5">
		<div class="row">
			<div class="col">

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
							<th>검색 일자</th>
							<th>검색 ID</th>
							<th>검색 IP</th>
						</tr>
					</thead>

					<tbody>
						<!-- 게시글 목록 반복 출력 -->
						<c:forEach var="search" items="${sList}">
							<tr>
								<td><a href="/market/search?keyword=${search.searchWord}&type=11st&type=ama&type=amaJp&type=ebay" target="_blank">${search.searchWord}</a></td>
								<td>${search.searchDate}</td>
								<td>${search.id}</td>
								<td>${search.ip}</td>
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<!-- 페이지네이션 -->
				<div class="col-md-6">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<!-- 이전 페이지가 있을 때 -->
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage-1 }" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:if test="${!pageMaker.prev }">
								<!-- 이전 페이지가 없을 때 -->
								<li class="page-item disabled"><a class="page-link"
									href="${pageMaker.startPage-1 }" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<!-- 페이지 for문 -->
							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								<li
									class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
									<a class="page-link" href="${num}">${num}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage+1 }" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
							<c:if test="${!pageMaker.next}">
								<li class="page-item disabled"><a class="page-link"
									href="${pageMaker.endPage+1 }" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>

				<!-- 검색과 관련된 폼 -->
				<div class="col-md-6">
				    <form action="/board/list" id="searchForm" class="form-group" method="get">
				        <div class="row">
				            <div class="col-md-6 text-right">
				                <select class="form-control" name="type">
				                    <option value="" ${pageMaker.cri.type eq null ? 'selected' : ''}>--검색 방법--</option>
				                    <option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>제목</option>
				                    <option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : ''}>내용</option>
				                    <option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : ''}>작성자</option>
				                    <option value="TC" ${pageMaker.cri.type eq 'TC' ? 'selected' : ''}>제목 + 내용</option>
				                    <option value="TW" ${pageMaker.cri.type eq 'TW' ? 'selected' : ''}>제목 + 작성자</option>
				                    <option value="CW" ${pageMaker.cri.type eq 'CW' ? 'selected' : ''}>내용 + 작성자</option>
				                    <option value="TCW" ${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}>제목 + 내용 + 작성자</option>
				                </select>
				            </div>
				            <div class="col-md-4">
				                <input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword}" />
				            </div>
				            <div class="col-md-2">
				                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
				                <input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
				                <button type="submit" class="btn btn-primary">검색</button>
				            </div>
				        </div>
				    </form>
				</div>
			</div>
		</div>


	</div>

	<!-- 페이징과 관련된 폼(내용이 숨겨져 있다.) -->
	<form action="/board/list" id="actionForm" method="get">
	</form>
</div>
</div>
</body>

	<script>
		$(document)
				.ready(
						function() {
							let result = `<c:out value="${result}" />`;
							checkModal(result);
							history.replaceState({}, null, null);
							//			history.replaceState(null, '', '/board/register');

							function checkModal(result) {
								if (result === '' || history.state) {
									return;
								} else {
									$('#ex1>.modalText').html(result);
									$("#ex1").modal();
								}
							}

							$('button.newboard').on('click', function() {
								self.location = "/board/register";
							});

							// 페이지 리스트에서의 이벤트 처리
							let $actionForm = $('#actionForm');
							$('.page-link').off('click').on('click', function( ev ){
								ev.preventDefault();
								$actionForm.find('input[name="pageNum"]').val( $(this).attr('href')) ; 
								$actionForm.submit();
							});
							
							// 조회페이지(상세내용 보기-목록의 제목을 클릭했을 때) 이벤트 처리
							$('.getMove').off('click').click(function(e){
								e.preventDefault();
								$actionForm.append('<input type="hidden" name="bno" value="'+$(this).attr("href")+'" />');
								$actionForm.attr('action', '/board/get');
								$actionForm.submit();
								$actionForm.find('input[name="bno"]').remove();
							})
							
							// 게시글 검색과 관련된 부분
							let $searchForm = $('#searchForm');

							$('#searchForm button')
									.on(
											'click',
											function(e) {
												e.preventDefault();
												if (!$searchForm.find(
														"option:selected")
														.val()) {
													alert("검색 방법(종류)를 선택하세요");
													return;
												}
												/*
												 if( ! $searchForm.find('input[name="keyword"]').val() ){
												 alert("검색 키워드를 입력하세요");
												 return;
												 }
												 // 거의 대부분 공백 입력을 고려하지 않는경우가 많다 
												 //   검색 키워드에서 사용자가 실수로 앞 또는 뒤에 공백이 들어있을 경우 사용자의 의도대로 검색이 안 될 수도 있다.
												
												 if( ! ( $searchForm.find('input[name="keyword"]').val().trim()  ) ){
												 alert("검색어에 공백만 들어있습니다. 검색어를 확인하세요");
												 return;
												 }
												 */
												if (!($searchForm
														.find(
																'input[name="keyword"]')
														.val().trim())) {
													alert("검색어가 입력되지 않았거나 검색어로 공백만 입력되었습니다.");
													return;
												}
												//여기서 부터				
												let trimNotkeyword = $searchForm
														.find(
																'input[name="keyword"]')
														.val().trim();
												$searchForm
														.find(
																'input[name="keyword"]')
														.val(trimNotkeyword)
												//여기 까지는 공백으로 시작하거나 공백으로 끝나는 키워드를 입력했더라도 정확한 키워드만 서버에 전달되도록 한다.
												$searchForm
														.find(
																'input[name="pageNum"]')
														.val("1");
												$searchForm.submit();
											});

						});
	</script>
<%@include file="../footer.jsp"%>
