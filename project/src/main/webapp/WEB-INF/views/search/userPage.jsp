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
				
				<% if (session.getAttribute("loginVo") == null) { %>
						    <script>
					alert("잘못된 요청입니다");
					 window.location.href = '/';
					</script>
				<% }%>
				
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
	</script>
<%@include file="../footer.jsp"%>
