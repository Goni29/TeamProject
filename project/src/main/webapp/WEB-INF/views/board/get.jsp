<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../header.jsp"%>
<span class="titletext" hidden="hidden">게시글 상세 보기</span>
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
            <div id="content main-content" class="main-width">  

                <div class="container-fluid">
				      <div class="row justify-content-center">
				         <div class="col-md-7">
				            <div id="contentarea" class="card">
				               <div class="card-header">게시글</div>
				               <div class="card-body">
				                  <div class="mb-4">
				                     <label for="title" class="form-label">제목</label> <input
				                        type="text" class="form-control" id="title" name="title"
				                        value="${board.title}" readonly="readonly">
				                  </div>
				                  <div class="mb-4">
				                     <label for="writer" class="form-label">닉네임</label> <input
				                        type="text" class="form-control" id="writer" name="writer"
				                        value="${board.writer}" readonly="readonly">
				                  </div>
				                  <div class="mb-4">
				                     <label for="regdate" class="form-label">등록 날짜</label> <input
				                        type="text" class="form-control" id="regdate" name="regdate"
				                        value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm' value='${board.regdate}' />"
				                        readonly="readonly">
				                  </div>
				
				                  <div class="mb-4">
				                     <label for="content" class="form-label">내용</label>
				                     <textarea class="form-control" id="content" rows="10"
				                        name="content" readonly="readonly">${board.content}</textarea>
				                  </div>
				
				                  <div class="row d-flex">
				                     <div class="col-auto">
				                        <a href='/board/list' class="btn btn-success">목록</a>
				                     </div>
				                     
			                        <div class="col-auto">
			                           <button id="modify" class="btn btn-success">수정</button>
			                        </div>
				
				                     <c:if test="${loginVo.id == board.id}">
				                        <div class="col-auto">
				                           <form action="/board/remove" method="post">
											    <input type="hidden" name="bno" value="${board.bno}">
											    <!-- 여기에 추가적인 필드(예: Criteria 정보)를 포함할 수 있습니다. -->
											    <button type="submit" class="btn btn-secondary">삭제</button>
											</form>
				
				                        </div>
				                     </c:if>
				                  </div>
				               </div>
				            </div>
				         </div>
				         <c:if test="${board.num != null}">
				            <!-- board.num이 0인 경우는 상품 검색을 통해 접근하지 않았을 때 -->
				            <div class="col-md-6">
				               <div id="contentarea" class="card">
				                  <div class="card-header">상품 정보</div>
				                  <div class="card-body">
				                     <form action="/board/register" method="post">
				                        <img src="${board.imgUrl}" alt="Image"
				                           class="img-fluid rounded border">
				                        <div class="mb-3 row">
				                           <label for="marketName" class="col-sm-2 col-form-label">쇼핑몰</label>
				                           <div class="col-sm-10">
				                              <input type="text" readonly class="form-control-plaintext"
				                                 id="marketName" value="${board.marketName}">
				                           </div>
				                        </div>
				                        <div class="mb-3 row">
				                           <label for="productName" class="col-sm-2 col-form-label">상품명</label>
				                           <div class="col-sm-10">
				                              <a href="${board.url}" target="_blank"> <input type="text" readonly
				                                 class="form-control-plaintext" id="productName"
				                                 value="${board.productName}"
				                                 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
				                              </a>
				                           </div>
				                        </div>
				                        <div class="mb-3 row">
				                           <label for="won" class="col-sm-2 col-form-label">가격</label>
				                           <div class="col-sm-10">
				                              <input type="text" readonly class="form-control-plaintext"
				                                 id="won" value="${board.won}원">
				                           </div>
				                        </div>
				                        <div class="mb-3 row">
				                           <label for="deliveryFee" class="col-sm-2 col-form-label">배송비</label>
				                           <div class="col-sm-10">
				                              <input type="text" readonly class="form-control-plaintext"
				                                 id="deliveryFee" value="${board.deliveryFee}원">
				                           </div>
				                        </div>
				                        <div class="mb-3 row">
				                           <label for="delivery" class="col-sm-2 col-form-label">배송
				                              일정</label>
				                           <div class="col-sm-10">
				                              <input type="text" readonly class="form-control-plaintext"
				                                 id="delivery" value="${board.delivery}">
				                           </div>
				                        </div>
				
				                     </form>
				                  </div>
				               </div>
				            </div>
				         </c:if>
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
					      </div>
					   </div>
						<%@include file="../footer.jsp"%>
				      </div>
				   </div>
				   </div>
				   </div>

</body>

<form action="/board/modify" method="get" id="operForm">
   <input type="hidden" id="bno" name="bno"
      value="<c:out value='${board.bno }'/>" /> <input type="hidden"
      name="pageNum" value="${cri.pageNum }" /> <input type="hidden"
      name="amount" value="${cri.amount }" /> <input type="hidden"
      name="type" value="${cri.type }" /> <input type="hidden"
      name="keyword" value="${cri.keyword }" />
</form>

<script>
      
      $(document).ready(function() {
          var bnoValue = ${board.bno};
          var $replyUl = $('.replyUl');
         var pageNum = 1;
         var replyCount = 0;
         var $replyPageFooter  = $('nav[aria-label="Page navigation"]');   ;
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
          
          
          
          
          
          
          
          
          
          
          
          
          
          

          function formatDate(date) {
              const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
              return new Intl.DateTimeFormat('ko-KR', options).format(new Date(date));
          }

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
                     alert("뒤질래?");
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
                     alert("뒤질래?");
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

        $('#modify').on('click', function(e) {
            e.preventDefault(); // 기본 이벤트를 방지
            // 폼 데이터를 '/board/modify'로 전송하기 위해 폼의 action을 설정
            $operForm.attr('action', '/board/modify').submit();
        });

        $('button[data-oper="list"]').on('click', function() {
            $operForm.find("#bno").remove();
            $operForm.attr('action', '/board/list').submit();
        });

        $('form[action="/board/remove"]').on('submit', function(e) {
            console.log("삭제 버튼 클릭됨"); // 디버깅을 위해 추가
            var confirmDelete = confirm("게시글을 삭제하시겠습니까?");
            if (!confirmDelete) {
                e.preventDefault();
                return false;
            }
            return true;
        });
    });
</script>


<%@ include file="../footer.jsp"%>