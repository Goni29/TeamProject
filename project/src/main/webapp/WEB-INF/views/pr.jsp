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
										<button hidden="hidden" class="participateButton" data-num="${product.num}">공동구매
											참여하기</button>
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
										<button id="addReply" type="submit" class="btn btn-primary">댓글
											작성</button>
									</form>
								</div>
							</div>
						</div>
					</c:if>

					<!-- 					<script>
document.addEventListener("DOMContentLoaded", function() {
    const participateButtons = document.querySelectorAll('.participateButton');
    
    participateButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            const productNum = this.getAttribute('data-num'); // 제품 고유 번호
            const requestData = { num: productNum };
            
            fetch('/groupBuying/participate', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData),
            })
            .then(response => response.json())
            .then(data => {
                if(data.status === 'success') {
                    // 페이지의 목표일자와 목표인원 내용 업데이트
                    document.querySelector('#goalDate'+productNum).textContent = '목표 일자: ' + data.goalDate;
                    document.querySelector('#goalTarget'+productNum).textContent = '남은 목표 인원: ' + data.goalTarget;
                    document.querySelector('#personNum'+productNum).textContent = '현재 참여 인원: ' + data.personNum;
                } else {
                    alert('공동 구매 참여에 실패했습니다.');
                }
            })
            .catch(error => console.error('Error:', error));
        });
    });
});
</script> -->
					<script>
		
		$(document).ready(function() {
		    var bnoValue = ${board.bno};
		    var $replyUl = $('.replyUl');
			var pageNum = 1;
			var replyCount = 0;
			var $replyPageFooter  = $('nav[aria-label="Page navigation"]');	;
 			showList(pageNum);
 			
 			
 			
 			
 	        $('#favorite').off('click').on('click', function(e){
 	        	e.preventDefault();
 	        	
 		            favoriteService.add({
		                    id : '${loginVo.id}',
 		                    bno : bnoValue
 		                },
 		                function(resultData){//여기에서 실패시 이미 스크랩된 게시글입니다 같은 거 쓰면 됨.
 		                	if(resultData == 'SUCCESS'){
 		                		alert('스크랩 성공');
 		                	}else{
 		                		alert('이미 스크랩된 게시글입니다');
 		                	}
 		                });

 	        });
 			
function showList(page) {
		    	console.log(page);
		    	pageNum = page;
		        // 특정 게시글을 보게 되면 해당 게시글의 댓글 목록이 나와야 한다.
		        replyService.getList(
		            { bno: bnoValue, page: page || 1 },
		            function (list) {
		            	
						if(page == -1 ){
							pageNum = Math.ceil(replyCount/10.0);
							showList(pageNum);
							return;
						} //page == -1이면 마지막 페이지로 다시 보여주세요
		            	
						var str = "";

						for (var i = 0; i < list.length; i++) {
						    var formattedDate = formatDate(list[i].replydate);
						    var buttonStr = ""; // 버튼을 저장할 변수
						    // 로그인 사용자와 게시글 작성자가 같은 경우에만 수정 버튼 생성
						    if ('${loginVo.id}' == list[i].id) {
						        buttonStr = `<button class="btn btn-sm btn-primary mr-2 modifyReply" value="` +  list[i].rno + `">수정</button>
						        	<button class="btn btn-sm btn-danger deleteReply" value="` +  list[i].rno + `">삭제</button>`;
						    }

						    str += `<li class="lucle">
					            <div class="media-body">
					                <div class="d-flex">
					                    <strong class="mt-0 mb-1">` + list[i].replyer + `</strong>
					                    <small class="text-muted ml-2">` + formattedDate + `</small>` +
					                    buttonStr +
					                    `</div>
					                <p>` + list[i].reply + `<p>
					            </div>
					        </li>`;
						}
						
			            $replyUl.html(str);
			            if (list == null || list.length == 0) {
			                $replyUl.html("<h5>댓글이 없습니다</h5>");
			            }
			            
		                replyService.getCount({ bno: bnoValue }, function (resultData) {
		                    var replyCount = resultData;
			                showReplyPage(replyCount);
		                }, function (error) {
		                    console.error("에러 발생:", error);
		                });
	                });
		                
		    }
		    
 			function showReplyPage(replyCount){
 				var endNum = Math.ceil(pageNum / 10.0) * 10;
 				var startNum = endNum - 9;
 				var prev = startNum != 1;
 				var next = false;
 				if( endNum *10 >= replyCount ){
 					endNum = Math.ceil(replyCount/10.0);
 				}
 				
 				if( endNum * 10 < replyCount){
 					next = true;
 				}
 				
 				var str = "<ul class='pagination'>";

 				if (prev) {
 				    str += `<li class="page-item"><a class="page-link"
 				                href="${startNum-1}" aria-label="Previous"> <span
 				                aria-hidden="true">&laquo;</span>
 				        </a></li>`;
 				} else {
 				    str += `<li class="page-item disabled"><a class="page-link"
 				                href="${startNum-1}" aria-label="Previous"> <span
 				                aria-hidden="true">&laquo;</span>
 				        </a></li>`;
 				}
				
 				for (var i = startNum; i <= endNum; i++) {
 				    // 각 페이지 번호에 대한 HTML 생성
 				    var pageItemClass = (pageNum == i) ? 'page-item active' : 'page-item';
 
 				    // 페이지 번호에 대한 HTML 추가
 				    str += '<li class="' + pageItemClass + '">';
 				    str += '<a class="page-link" href="' + i + '">' + i + '</a>';
 				    str += '</li>';
 				}

 				if (next) {
 				    str += `<li class="page-item"><a class="page-link"
 				                href="${endNum+1}" aria-label="Next"> <span
 				                aria-hidden="true">&raquo;</span>
 				        </a></li>`;
 				} else {
 				    str += `<li class="page-item disabled"><a class="page-link"
 				                href="${endNum+1}" aria-label="Next"> <span
 				                aria-hidden="true">&raquo;</span>
 				        </a></li>`;
 				}

 				str += `</ul>`;
 				$replyPageFooter.html(str);

 				$replyPageFooter.off().on('click', 'li a', function(e) {
 				    e.preventDefault();
 				    pageNum = $(this).attr("href");

 				    $('.page-link').parent().removeClass('active');
 				    $(this).parent().addClass('active');
 				    showList(pageNum);
 				});
 				
 				
 				// 댓글 작성
		        $('#addReply').off('click').on('click', function(e){
		        	e.preventDefault();
			        let replyContent = $('#replyContent').val();
			        
			        if(replyContent == null || replyContent == ""){
			            alert("댓글 내용을 입력해주세요.");
			        } else {
			            replyService.add({
			                    bno : bnoValue,
			                    reply : replyContent,
			                    replyer : '${loginVo.nickname}',
			                    id : '${loginVo.id}'
			                },
			                function(resultData){
			                    alert("댓글이 정상적으로 작성되었습니다.");
			                    $('#replyContent').val("");
			                    showList(1);
			                });
			        }
		        });
 				
 				//수정 기능. 아직 미탑재.
 				
		        $('.modifyReply').off('click').on('click', function(e){
		        	e.preventDefault();
		        	$("#replyContent").val($(this).parents("li.lucle").find('p').text());

			        if(replyContent == null || replyContent == ""){
			            alert("댓글을 입력해주세요.");
			        } else {
			            replyService.add({
			                    bno : bnoValue,
			                    reply : replyContent,
			                    replyer : '${loginVo.nickname}',
			                    id : '${loginVo.id}'
			                },
			                function(resultData){
			                    alert("댓글이 정상적으로 작성되었습니다.");
			                    $('#replyContent').val("");
			                    showList(1);
			                });
			        }
		        });
 				
 				
 				//댓글 삭제. visible을 0으로 바꿈.
		        $('.deleteReply').off('click').on('click', function(e){
		        	e.preventDefault();
		        	var rno = $(this).val();
		        	console.log(rno);

			            replyService.remove(rno,
			                function(resultData){
			                    alert("댓글이 정상적으로 삭제되었습니다.");
			                    showList(1);
			                });
		        });
 			}
		});
		</script>

					<script>
			$(document).ready(function() {

				var $operForm = $('#operForm');
				$('button[data-oper="modify"]').on('click', function() {
					$operForm.attr('', '/board/modify').submit();
				})

				$('button[data-oper="list"]').on('click', function() {
					$operForm.find("#bno").remove();
					$operForm.attr('action', '/board/list').submit();
				})
			})
		</script>

					<script>
						$(document).ready(function() {
    					$('.participateButton').on('click', function() {
        				var productNum = $(this).data('num'); // 버튼에서 data-num 속성 값을 읽어옴

        				var requestData = {
            			num: productNum // 공동구매 참여 요청 데이터에 상품 번호 포함
        				};

        				$.ajax({
            			url: '/groupbuying/participate',
            			type: 'POST',
			            contentType: 'application/json',
			            data: JSON.stringify(requestData),
			            success: function(response) {
			                alert(response.message); // 성공 메시지
			            },
			            error: function(xhr) {
		                if (xhr.status === 401) {
		                    alert("로그인 후 이용해주세요.");
		                    location.reload();
		                } else {
		                    alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요." + xhr.status);
		                }
						            }
						        });
						    });
						});

</script>



				</div>
			</div>
			</html>

			<%@ include file="./footer.jsp"%>