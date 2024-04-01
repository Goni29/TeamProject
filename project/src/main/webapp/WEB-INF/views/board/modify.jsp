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
                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div id="contentarea" class="card">
                                    <div class="card-header">게시글 수정</div>
                                    <form action="/board/modify" id="mainForm" method="post" class="card-body">
                                        <div class="mb-3">
                                            <input type="hidden" name="pageNum" value="${cri.pageNum}"/>
                                            <input type="hidden" name="amount" value="${cri.amount}"/>
                                            <input type="hidden" name="type" value="${cri.type}" />
                                            <input type="hidden" name="keyword" value="${cri.keyword}" />
                                            <div class="fieldbox">
                                                <label for="bno" class="form-label">글 번호</label>
                                                <input type="text" class="form-control" id="bno" name="bno" value="${board.bno}" readonly="readonly"/>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="fieldbox">
                                                <label for="regdate" class="form-label">작성일</label>
                                                <input type="text" class="form-control" id="regdate" name="regdate" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm' value='${board.regdate}' />" readonly="readonly"/>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <c:if test="${board.regdate != board.updatedate}">
                                                <div class="fieldbox">
                                                    <label for="updatedate" class="form-label">수정일</label>
                                                    <input type="text" class="form-control" id="updatedate" name="updatedate" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm' value='${board.updatedate}' />" readonly="readonly"/>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="mb-3">
                                            <label for="title" class="form-label">제목</label>
                                            <input type="text" class="form-control" id="title" name="title" value="${board.title}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="writer" class="form-label">작성자(닉네임)</label>
                                            <input type="text" class="form-control" id="writer" name="writer" value="${board.writer}" readonly="readonly">
                                        </div>
                                        <div class="mb-3">
                                            <label for="content" class="form-label">내용</label>
                                            <textarea class="form-control" id="content" rows="10" cols="30" name="content">${board.content}</textarea>
                                        </div>
                                        <input id="num" name="num" value="${vo.num}" hidden="hidden" />
                                        <input id="id" name="id" value="${loginVo.id}" hidden="hidden" />
                                        <div>
                                            <button type="submit" data-command="list" class="btn btn-success">목록으로</button>
                                            <button type="submit" data-command="modify" class="btn btn-success">수정</button>
                                            <button type="submit" data-command="remove" class="btn btn-secondary">삭제</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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