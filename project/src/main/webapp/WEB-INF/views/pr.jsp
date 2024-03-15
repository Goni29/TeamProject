<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="./header.jsp"%>
<style>
.page-size {
	width: 100vw;
}
</style>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="./sidebar.jsp"%>
		<div id="conteny-wrapper" class="d-flex flex-column page-size">
			<%@ include file="./topbar.jsp"%>
			<span class="titletext" hidden="hidden">해외 상품 가격 비교</span>
			<body>
				<div class="container-fluid p-2 bg-dark text-white text-center">
					<p>
						<b>국내외 상품 목록</b>
					</p>
				</div>
				<div class="container">
					<div class="row">
						<c:forEach var="product" items="${products}">
							<div class="col-md-3 border">
								<p>${product.num}</p>
								<img src="${product.imgUrl}" alt="Image"> <br>
								<p>${product.marketName}</p>
								<a href="${product.url}">${product.productName}</a><br>
								<p>가격 : ${product.won}원</p>
								<p>예상 기간 : ${product.delivery}</p>
								<p>조회수 : ${product.marketViewCount}</p>
								<br>
								<button class="participateButton" data-num="${product.num}">공동구매
									참여하기</button>
								<div class="btn-group" role="group" aria-label="Button group">
									<form class="actionForm" action="/market/register">
										<input name="num" value="${product.num}" hidden="hidden" /> <input
											name="productName" value="${product.productName}"
											hidden="hidden" /> <input name="marketName"
											value="${product.marketName}" hidden="hidden" /> <input
											name="url" value="${product.url}" hidden="hidden" /> <input
											name="imgUrl" value="${product.imgUrl}" hidden="hidden" /> <input
											name="won" value="${product.won}" hidden="hidden" /> <input
											name="delivery" value="${product.delivery}" hidden="hidden" />
										<input name="deliveryFee" value="${product.deliveryFee}"
											hidden="hidden" /> <input name="keyword"
											value="${searchWord}" hidden="hidden" />
										<button hidden="hidden" class="participateButton"
											data-num="${product.num}">공동구매 참여하기</button>
									</form>



									<form class="actionForm" action="/market/detail"
										hidden="hidden">
										<input name="num" value="${product.num}" hidden="hidden" /> <input
											name="id" value="${loginVo.id}" hidden="hidden" />
										<button class="btn btn-success">상세 페이지</button>
									</form>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</body>


			<!-- 모달창. 숨겨져 있음 -->
			<div class="modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">로그인</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Modal body text goes here.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
			<div class="container mt-5">
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div id="contentarea" class="card">
							<div class="card-body">
								<ul class="list-unstyled replyUl">
									<li class="media" hidden="hidden">
										<div class="media-body">
											<div class="d-flex justify-content-between">
												<strong class="mt-0 mb-1">User00</strong> <small
													class="text-muted">2024-01-05</small>
											</div>
											<p>내용</p>
										</div>
									</li>
								</ul>

								<nav aria-label="Page navigation" class="justify-content-center"></nav>
							</div>
						</div>
					</div>
					<c:if test="${loginVo.id != null}">
						<div class="col-md-4">
							<div id="contentarea" class="card">
								<div class="card-body">
									<form id="commentForm">
										<div class="form-group">
											<textarea class="form-control" id="replyContent" rows="3"
												placeholder="댓글을 입력하세요"></textarea>
										</div>
										<button id="addReply" type="button" class="btn btn-primary">댓글
											작성</button>
									</form>
								</div>
							</div>
						</div>
					</c:if>
					<div class="container mt-5">
						<div class="row justify-content-center">
							<div class="col-md-8">
								<div id="contentarea" class="card">
									<div class="card-body">
										<ul class="list-unstyled replyUl">
											<c:forEach var="reply" items="${replies}">
												<li class="media">
													<div class="media-body">
														<div class="d-flex justify-content-between">
															<strong class="mt-0 mb-1">${reply.replyer}</strong> <small
																class="text-muted">${reply.replydate}</small>
														</div>
														<p>${reply.reply}</p>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${pageInfo.prev}">
								<li class="page-item"><a class="page-link"
									href="?pageNum=${pageInfo.startPage - 1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageInfo.startPage}"
								end="${pageInfo.endPage}" var="pageNum">
								<li class="page-item ${pageNum == cri.pageNum ? 'active' : ''}"><a
									class="page-link" href="?pageNum=${pageNum}">${pageNum}</a></li>
							</c:forEach>
							<c:if test="${pageInfo.next}">
								<li class="page-item"><a class="page-link"
									href="?pageNum=${pageInfo.endPage + 1}">Next</a></li>
							</c:if>
						</ul>
					</nav>

					<script>
$(document).ready(function(){
    // 댓글 작성 버튼 클릭 이벤트
    $('#addReply').off('click').on('click', function(e){
        e.preventDefault(); // 기본 이벤트를 방지합니다.

        let replyContent = $('#replyContent').val(); // 댓글 내용을 가져옵니다.

        // 댓글 내용이 비어 있는 경우 경고 메시지를 표시합니다.
        if(replyContent == null || replyContent.trim() == ""){
            alert("댓글 내용을 입력해주세요.");
        } else {
            // AJAX를 사용하여 서버에 댓글 데이터를 전송합니다.
            $.ajax({
                url: '/reply/addReply', // 요청을 보낼 서버의 URL 주소
                type: 'post', // HTTP 요청 방식 (GET, POST)
                contentType: 'application/json', // 요청의 Content-Type
                data: JSON.stringify({ // 서버로 보낼 데이터
                    reply: replyContent,
                    replyer: '${loginVo.nickname}', // 로그인한 사용자의 닉네임
                    id: '${loginVo.id}' // 로그인한 사용자의 ID
                }),
                dataType: 'json', // 서버에서 보내줄 데이터의 타입
                success: function(resultData){ // 요청이 성공했을 때 호출될 함수
                    alert("댓글이 정상적으로 작성되었습니다.");
                    $('#replyContent').val(""); // 댓글 입력 필드를 비웁니다.
                    showList(1); // 댓글 목록을 다시 표시합니다.
                },
                error: function(xhr, status, error){ // 요청이 실패했을 때 호출될 함수
                    alert("오류 발생: " + xhr.status + " " + error);
                }
            });
        }
    });

	
});
</script>



				</div>
			</div>
			</html>

			<%@ include file="./footer.jsp"%>