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

									<input type="hidden" id="productNum" value="${product.num}" />

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
															<!-- 수정 버튼 -->
															<button type="button"
																class="btn btn-primary modifyButton"
																data-rno="${reply.rno}">수정</button>
															<!-- 삭제 버튼 -->
															<button type="button" class="btn btn-danger deleteButton"
																data-rno="${reply.rno}">삭제</button>

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
					<div class="modal fade" id="modifyModal" tabindex="-1"
						role="dialog" aria-labelledby="modifyModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="modifyModalLabel">댓글 수정</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea class="form-control" id="modifyReplyContent"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary"
										id="saveModifiedReply">저장</button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="modifyModal" tabindex="-1"
						role="dialog" aria-labelledby="modifyModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="modifyModalLabel">댓글 수정</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea class="form-control" id="modifyReplyContent"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary"
										id="saveModifiedReply">저장</button>
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
						$(document)
								.ready(
										function() {
											// 댓글 작성 버튼 클릭 이벤트
											$('#addReply')
													.off('click')
													.on(
															'click',
															function(e) {
																e
																		.preventDefault(); // 기본 이벤트를 방지합니다.
																var num = $(
																		'#productNum')
																		.val();
																let replyContent = $(
																		'#replyContent')
																		.val(); // 댓글 내용을 가져옵니다.

																// 댓글 내용이 비어 있는 경우 경고 메시지를 표시합니다.
																if (replyContent == null
																		|| replyContent
																				.trim() == "") {
																	alert("댓글 내용을 입력해주세요.");
																} else {
																	// AJAX를 사용하여 서버에 댓글 데이터를 전송합니다.
																	$
																			.ajax({
																				url : '/reply/addReply', // 요청을 보낼 서버의 URL 주소
																				type : 'post', // HTTP 요청 방식 (GET, POST)
																				contentType : 'application/json', // 요청의 Content-Type
																				data : JSON
																						.stringify({ // 서버로 보낼 데이터
																							reply : replyContent,
																							replyer : '${loginVo.nickname}', // 로그인한 사용자의 닉네임
																							id : '${loginVo.id}', // 로그인한 사용자의 ID
																							num : num
																						}),
																				dataType : 'json', // 서버에서 보내줄 데이터의 타입
																				success : function(
																						resultData) { // 요청이 성공했을 때 호출될 함수
																					alert("댓글이 정상적으로 작성되었습니다.");
																					$(
																							'#replyContent')
																							.val(
																									""); // 댓글 입력 필드를 비웁니다.
																					location
																							.reload(); // 댓글 목록을 다시 표시합니다.
																				},
																				error : function(
																						xhr,
																						status,
																						error) { // 요청이 실패했을 때 호출될 함수
																					alert("오류 발생: "
																							+ xhr.status
																							+ " "
																							+ error);
																				}
																			});
																}
															});
											/* function deleteReply(rno) {
												$.ajax({
													url : `/reply/${rno}`,
													type : 'DELETE',
													success : function(result) {
														alert("댓글 삭제 성공");
														location.reload();
													}
												});
											}

											function modifyReply(rno) {
												var requestURL = '/reply/' + rno;
												let replyContent = // 수정된 댓글 내용 가져오기
												$
														.ajax({
															url : requestURL,
															type : 'PUT',
															contentType : 'application/json',
															data : JSON
																	.stringify({
																		reply : replyContent
																	}),
															success : function(
																	result) {
																alert("댓글 수정 성공");
																location
																		.reload();
															}
														});
											}
											 */
										});
						$(document).ready(function() {
							// 삭제 버튼 클릭 이벤트
							$('body').on('click', '.deleteButton', function() {
								var rno = $(this).data('rno');
								deleteReply(rno);
							});

							// 수정 버튼 클릭 이벤트
							$('body').on('click', '.modifyButton', function() {
								var rno = $(this).data('rno');
								openModifyModal(rno);
							});
						});

						function deleteReply(rno) {
							var requestURL = '/reply/' + rno;
							if (!confirm("댓글을 삭제하시겠습니까?"))
								return;
							$.ajax({
								url : requestURL,
								type : 'DELETE',
								success : function(result) {
									alert("댓글이 삭제되었습니다.");
									location.reload(); // 페이지 새로고침
								},
								error : function(xhr, status, error) {
									alert("댓글 삭제 중 오류가 발생했습니다: "
											+ xhr.responseText);
								}
							});
						}

						function openModifyModal(rno) {
							console.log("Opening modify modal for rno: " + rno);
							var requestURL = '/reply/' + rno;
							// AJAX를 사용하여 댓글의 현재 내용을 서버로부터 가져옵니다.
							$
									.ajax({
										url : requestURL,
										type : 'GET',
										success : function(reply) {
											// 댓글 내용을 모달의 입력 필드에 설정
											$('#modifyReplyContent').val(
													reply.reply);
											// '저장' 버튼에 현재 댓글의 ID를 데이터 속성으로 설정
											$('#saveModifiedReply').data('rno',
													rno);
											// 모달 표시
											$('#modifyModal').modal('show');
										},
										error : function(xhr, status, error) {
											alert("댓글 정보 불러오기 실패: "
													+ xhr.responseText);
										}
									});
						}

						$(document)
								.ready(
										function() {
											// '저장' 버튼 클릭 이벤트 핸들러
											$('#saveModifiedReply')
													.click(
															function() {
																var rno = $(
																		this)
																		.data(
																				'rno'); // 현재 수정하려는 댓글의 ID
																var replyContent = $(
																		'#modifyReplyContent')
																		.val(); // 수정된 댓글 내용
																var requestURL = '/reply/'
																		+ rno;

																if (!replyContent
																		.trim()) {
																	alert("댓글 내용을 입력하세요.");
																	return;
																}

																// AJAX를 사용하여 수정된 댓글 내용을 서버에 전송
																$
																		.ajax({
																			url : requestURL,
																			type : 'PUT',
																			contentType : 'application/json',
																			data : JSON
																					.stringify({
																						reply : replyContent
																					}),
																			success : function(
																					result) {
																				alert("댓글이 수정되었습니다.");
																				location
																						.reload(); // 페이지 새로고침
																			},
																			error : function(
																					xhr,
																					status,
																					error) {
																				alert("댓글 수정 중 오류가 발생했습니다: "
																						+ xhr.responseText);
																			}
																		});
															});
										});
					</script>
<script>
$(document).ready(function() {
    // 공동구매 참여 버튼 클릭 이벤트 처리
    $('.participateButton').click(function() {
        var productNum = $(this).data('num'); // 상품 번호 가져오기
        var isLoggedIn = ${loginVo.id != null}; // 로그인 상태 확인 (서버 사이드 코드 필요)

        if (!isLoggedIn) {
            alert('로그인 후 이용해주세요.');
            return; // 로그인하지 않은 상태면 여기서 처리 중단
        }

        // 공동구매 참여 요청 AJAX
        $.ajax({
            url: '/groupbuying/participate',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ num: productNum }),
            dataType: 'json',
            success: function(response) {
                alert('성공적으로 참여되었습니다.');
                // 공동구매 참여 성공 시 댓글 자동 작성 로직
                postParticipationComment(productNum, '공동구매에 참여하였습니다.');
            },
            error: function(xhr, status, error) {
                // 로그인하지 않았을 때의 처리는 서버 사이드에서 401 같은 상태 코드를 보내줄 때 사용
                if (xhr.status === 401) {
                    alert('로그인 후 이용해주세요.');
                } else {
                    alert('오류 발생: ' + error);
                }
            }
        });
    });

    function postParticipationComment(productNum, commentText) {
        // 댓글 작성 AJAX 요청
        $.ajax({
            url: '/reply/addReply', // 댓글 작성 API 엔드포인트
            type: 'post',
            contentType: 'application/json',
            data: JSON.stringify({
                num: productNum,
                reply: commentText,
                replyer: '${loginVo.nickname}', // 서버 사이드 코드로 로그인한 사용자의 닉네임 필요
                id: '${loginVo.id}' // 서버 사이드 코드로 로그인한 사용자의 ID 필요
            }),
            dataType: 'json',
            success: function(resultData) {
                alert("댓글이 정상적으로 작성되었습니다.");
                location.reload(); // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                alert("댓글 작성 중 오류 발생: " + xhr.responseText);
            }
        });
    }
});
</script>



				</div>
			</div>
			</html>

			<%@ include file="./footer.jsp"%>