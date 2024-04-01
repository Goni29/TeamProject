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
            <div id="content main-content" class="main-width">

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
                                   <form class="actionForm" action="/market/register">
	                                    <input name="num" value="${product.num}" hidden="hidden" /> 
	                                    <input name="productName" value="${product.productName}" hidden="hidden" /> 
	                                    <input name="marketName" value="${product.marketName}" hidden="hidden" /> 
	                                    <input name="url" value="${product.url}" hidden="hidden" /> 
	                                    <input name="imgUrl" value="${product.imgUrl}" hidden="hidden" /> 
	                                    <input name="won" value="${product.won}" hidden="hidden" /> 
	                                    <input name="delivery" value="${product.delivery}" hidden="hidden" />
	                                    <input name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" /> 
	                                    <input name="keyword" value="${searchWord}" hidden="hidden" />
	                                    <button hidden="hidden" class="participateButton btn-primary btn-needlogin" data-num="${product.num}">공동구매 참여하기</button><br /><br />
	                               	 </form>
                                   
                                   <form class="actionForm" action="/user/save">
                                       <input name="num" value="${product.num}" hidden="hidden" />
                                       <input name="productName" value="${product.productName}" hidden="hidden" />
                                       <input name="marketName" value="${product.marketName}" hidden="hidden" />
                                       <input name="url" value="${product.url}" hidden="hidden" />
                                       <input name="imgUrl" value="${product.imgUrl}" hidden="hidden" />
                                       <input name="won" value="${product.won}" hidden="hidden" />
                                      
                                       <input name="delivery" value="${product.delivery}" hidden="hidden" />
                                       <input name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" />
                                   
                                       <input name="keyword" value="${searchWord}" hidden="hidden" />
                                       <button hidden="hidden" class="btn btn-primary btn-needlogin">찜하기</button>
                                  	</form>
                                   
                                   <a href="/pr?large=${product.CATEGORY_LARGE}&medium=${product.CATEGORY_MEDIUM}&small=${product.CATEGORY_SMALL}&sub_category=${product.CATEGORY_SUB_CATEGORY}&num=${product.MARKET_NUM}">
                                       <button class="btn btn-success">상세 페이지</button>
                                   </a>
                               </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="text-center">
						    <nav aria-label="Page navigation">
						        <ul class="pagination justify-content-center">
						            <c:if test="${pageMaker.prev}">
						                <li class="page-item">
						                    <a class="page-link" href="${pageContext.request.contextPath}/prlist/rankedUser?page=${pageMaker.startPage - 1}" aria-label="Previous">
						                        &laquo; 이전
						                    </a>
						                </li>
						            </c:if>
						
						            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
						                <c:choose>
						                    <c:when test="${pageNum == pageMaker.cri.pageNum}">
						                        <li class="page-item active" aria-current="page">
						                            <span class="page-link">
						                                ${pageNum}
						                                <span class="sr-only">(current)</span>
						                            </span>
						                        </li>
						                    </c:when>
						                    <c:otherwise>
						                        <li class="page-item">
						                            <a class="page-link" href="${pageContext.request.contextPath}/prlist/rankedUser?page=${pageNum}">
						                                ${pageNum}
						                            </a>
						                        </li>
						                    </c:otherwise>
						                </c:choose>
						            </c:forEach>
						
						            <c:if test="${pageMaker.next}">
						                <li class="page-item">
						                    <a class="page-link" href="${pageContext.request.contextPath}/prlist/rankedUser?page=${pageMaker.endPage + 1}" aria-label="Next">
						                        다음 &raquo;
						                    </a>
						                </li>
						            </c:if>
						        </ul>
						    </nav>
						</div>
				</div>
            </div>
        </div>
    </div>
<%@ include file="../footer.jsp"%>
</body>
</html>