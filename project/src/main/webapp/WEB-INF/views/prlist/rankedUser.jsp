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
        <div id="content-wrapper" class="d-flex flex-column page-size"> <!-- "conteny-wrapper" was incorrect -->
            <%@ include file="../topbar.jsp"%>
            <div id="content" class="main-width"> <!-- "main-content" was incorrectly placed outside the id attribute -->

                <div class="container-fluid">

                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">추천상품</h1>
                    </div>

                    <div class="row">
                        <c:forEach var="product" items="${rankView}">
                            <div class="col-xl-3 col-md-6 mb-4 border">
                                <p>${product.marketName}</p>

                                <a href="/pr?large=${product.CATEGORY_LARGE}&medium=${product.CATEGORY_MEDIUM}&small=${product.CATEGORY_SMALL}&sub_category=${product.CATEGORY_SUB_CATEGORY}&num=${product.MARKET_NUM}">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
                                    src="${product.imgUrl}" alt="Product Image">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                        <c:choose>
                                            <c:when test="${fn:length(product.productName) > 20}">
                                                ${fn:substring(product.productName, 0, 20)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${product.productName}
                                            </c:otherwise>
                                        </c:choose>
                                    </h6>
                                </a>
                                <div>
                                    <p>가격 : ${product.won}원</p>
                                    <p>현재 참여 인원 : ${product.personnum}</p>
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${product.achievementrate}%</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar"
                                                style="width: ${product.achievementrate}%"
                                                aria-valuenow="${product.achievementrate}" aria-valuemin="0"
                                                aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group" aria-label="Button group">
                                    <!-- Forms and buttons for action -->
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- Pagination and footer -->
                    <div class="pagination">
                        <c:if test="${pageMaker.prev}">
                            <a href="${pageContext.request.contextPath}/prlist/rankedUser?page=${pageMaker.startPage - 1}">&laquo; 이전</a>
                        </c:if>

                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                            <c:choose>
                                <c:when test="${pageNum == pageMaker.cri.pageNum}">
                                    <span><b>${pageNum}</b></span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/prlist/rankedUser?page=${pageNum}">${pageNum}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${pageMaker.next}">
                            <a href="${pageContext.request.contextPath}/prlist/rankedUser?page=${pageMaker.endPage + 1}">다음 &raquo;</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../footer.jsp"%>
</body>
</html>