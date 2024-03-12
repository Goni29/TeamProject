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

<span class="titletext" hidden="hidden">게시글 목록</span>
<body>
    <div id="wrapper">
        <%@ include file="../sidebar.jsp"%>
        <div id="content-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="../topbar.jsp"%>

            <div class="container mt-5">
                <div class="row">
                    <div class="col">
                        <!-- 로그인한 사용자만 게시글 작성 버튼 표시 -->
                        <c:if test="${loginVo != null}">
                            <div class="col-auto">
                                <a href='/board/register' class="newboard btn btn-primary mb-3">게시글
                                    작성</a>
                            </div>
                        </c:if>

                        <!-- 게시글 목록 테이블 -->
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>카테고리</th>
                                    <th>제목</th>
                                    <th></th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>

                            <tbody>
                                <!-- 게시글 목록 반복 출력 -->
                                <c:forEach var="board" items="${list}">
                                    <tr>
                                        <!-- 카테고리 -->
                                        <c:if test="${board.category == 0}">
                                            <td>일반</td>
                                        </c:if>
                                        <c:if test="${board.category == 1}">
                                            <td class="text-danger">핫딜</td>
                                        </c:if>
                                        <!-- 게시글 제목 -->
                                        <td>
                                            <a class="getMove" href="${board.bno}">
                                                ${board.title} <span class="replyCount text-success"></span>
                                            </a>
                                        </td>
                                        <!-- 가격 -->
                                        <td>${board.won}</td>
                                        <!-- 작성자 -->
                                        <td>${board.writer}</td>
                                        <!-- 작성일 -->
                                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                value="${board.regdate}" /></td>
                                    </tr>

                                    <!-- 각 게시글의 댓글 수 조회 -->
                                    <script>
                                        var replyBno = ${board.bno}; // 게시글 번호
                                        var replyCount;

                                        (function(bno) {
                                            replyService.getCount(
                                                { bno : bno },
                                                function(resultData) {
                                                    replyCount = resultData;

                                                    // 댓글 수가 0이 아닌 경우 댓글 수를 표시
                                                    if (replyCount !== 0) {
                                                        $('.getMove[href="${board.bno}"] .replyCount').text(
                                                            ' (' + replyCount + ')');
                                                    }
                                                },
                                                function(error) {
                                                    console.error("에러 발생:", error);
                                                }
                                            );
                                        })(replyBno);
                                    </script>
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
                                        <li class="page-item">
                                            <a class="page-link" href="${pageMaker.startPage-1 }" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${!pageMaker.prev }">
                                        <!-- 이전 페이지가 없을 때 -->
                                        <li class="page-item disabled">
                                            <a class="page-link" href="${pageMaker.startPage-1 }" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <!-- 페이지 for문 -->
                                    <c:forEach var="num" begin="${pageMaker.startPage }"
                                        end="${pageMaker.endPage }">
                                        <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                                            <a class="page-link" href="${num}">${num}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${pageMaker.next}">
                                        <li class="page-item">
                                            <a class="page-link" href="${pageMaker.endPage+1 }" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${!pageMaker.next}">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="${pageMaker.endPage+1 }" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>

                        <!-- 검색과 관련된 폼 -->
                        <div class="col-md-6">
                            <form action="/board/list" id="searchForm" class="form-control" method="get">
                                <div class="row">
                                    <div class="col-md-6 text-end">
                                        <select class="form-select" name="type">
                                            <option value="" ${pageMaker.cri.type eq null ? 'selected' : ''}>--검색
                                                방법--</option>
                                            <option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>제목</option>
                                            <option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : ''}>내용</option>
                                            <option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : ''}>작성자</option>
                                            <option value="TC" ${pageMaker.cri.type eq 'TC' ? 'selected' : ''}>제목 +
                                                내용</option>
                                            <option value="TW" ${pageMaker.cri.type eq 'TW' ? 'selected' : ''}>제목 +
                                                작성자</option>
                                            <option value="CW" ${pageMaker.cri.type eq 'CW' ? 'selected' : ''}>내용 +
                                                작성자</option>
                                            <option value="TCW" ${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}>제목 +
                                                내용 + 작성자</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" name="keyword"
                                            value="${pageMaker.cri.keyword}" />
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
        </div>
    </div>

    <!-- 페이징과 관련된 폼(내용이 숨겨져 있다.) -->
    <form action="/board/list" id="actionForm" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
        <input type="hidden" name="type" value="${pageMaker.cri.type }" />
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
        <input type="hidden" name="category" value="${pageMaker.cri.category }" />
    </form>

    <div id="ex1" class="modal">
        <p class="modalText">정상적으로 처리가 완료되었습니다</p>
        <a href="#" rel="modal:close">Close</a>
    </div>

    <script>
        $(document).ready(function(){
            $("a[rel='modal:close']").click(function(){
                $("#ex1").fadeOut(500);
            });
        });
        $(document).ready(function() {
            let result = `<c:out value="${result}" />`;
            checkModal(result);
            history.replaceState({}, null, null);

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
            });

            // 게시글 검색과 관련된 부분
            let $searchForm = $('#searchForm');

            $('#searchForm button').on('click', function(e) {
                e.preventDefault();
                if (!$searchForm.find("option:selected").val()) {
                    alert("검색 방법(종류)를 선택하세요");
                    return;
                }
                if (!($searchForm.find('input[name="keyword"]').val().trim())) {
                    alert("검색어가 입력되지 않았거나 검색어로 공백만 입력되었습니다.");
                    return;
                }
                let trimNotkeyword = $searchForm.find('input[name="keyword"]').val().trim();
                $searchForm.find('input[name="keyword"]').val(trimNotkeyword)
                $searchForm.find('input[name="pageNum"]').val("1");
                $searchForm.submit();
            });

        });
    </script>
</body>
<%@include file="../footer.jsp"%>