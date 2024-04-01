<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>

<span class="titletext" hidden="hidden">게시글 수정</span>

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
					<div>
						<h2>게시글 수정 및 삭제</h2>
					</div>
					<form action="/board/modify" id="mainForm" method="post">
						<div class="fieldbox">
						<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
						<input type="hidden" name="amount" value="${cri.amount}"/>
						<input type="hidden" name="type" value="${cri.type }" />
						<input type="hidden" name="keyword" value="${cri.keyword }" />
							<div>글 번호</div>
							<div><input type="text" name="bno" value="${board.bno}" readonly="readonly"/></div>
						</div>
						
						<div class="fieldbox">
							<div>작성일</div>
							<div><input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.regdate}" />" readonly="readonly"/></div>
						</div>
						
						<c:if test="${board.regdate != board.updatedate}">	
						<div class="fieldbox">
							<div>수정일</div>
							<div><input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.updatedate}" />" readonly="readonly"/></div>
						</div>
						</c:if>
						
						<div class="fieldbox">
							<div>제목</div>
							<div><input type="text" name="title" value="${board.title}" /></div>
						</div>
						
						<div class="fieldbox">
							<div>작성자</div>
							<div><input type="text" name="writer" value="${board.writer}" readonly="readonly"/></div>
						</div>
						
						<div class="fieldbox">
							<div>내용</div>
							<div><textarea name="content" rows="10" cols="30" >${board.content}</textarea></div>
						</div>
						
						<div>
							<button type="submit" data-command="modify">수정</button>
							<button type="submit" data-command="remove">삭제</button>
							<button type="submit" data-command="list">목록으로</button>
							
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
		$(document).ready(function(){
			let $form = $('#mainForm');
			
			$('button').on('click', function(e){
				e.preventDefault();
				let buttonName = $(this).data("command");
				
				if( buttonName ==='list'){
					location.href="/board/list?pageNum="+${cri.pageNum}+"&amount="+ ${cri.amount}; 
					//page 정보만 넘겨줘도 된다요.....~~~~
					return; 
				}
				
				if(buttonName === 'remove'){
					$form.attr('action', '/board/remove');
				}
				
				$form.submit();
			})
			
		})
	</script>
<%@ include file="../footer.jsp"%>