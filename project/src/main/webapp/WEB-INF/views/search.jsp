<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
        <div id="content-wrapper" class="d-flex flex-column page-size">      
            <%@ include file="./topbar.jsp"%>
            <div id="content main-content" class="main-width">  
                <div class="container-fluid"> 
                    <div class="row">
                        <c:forEach var="product" items="${products}">
                            <div class="col-md-3 border">
                                <img src="${product.imgUrl}" alt="Image"> <br>
                                <p>${product.marketName}</p>
                                <a href="pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                    <c:choose>
                                        <c:when test="${fn:length(product.productName) > 20}">
                                            ${fn:substring(product.productName, 0, 20)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${product.productName}
                                        </c:otherwise>
                                    </c:choose>
                                </a><br>
                                <p>가격 : ${product.won}원</p>
                                <p>예상 기간 : ${product.delivery}</p>
                                <p>조회수 : ${product.marketViewCount}</p>
                                <br>
                                <div class="btn-group" role="group" aria-label="Button group">
                                    <form class="actionForm" action="/board/register">
                                        <input name="num" value="${product.num}" hidden="hidden" />
                                        <input name="productName" value="${product.productName}" hidden="hidden" />
                                        <input name="marketName" value="${product.marketName}" hidden="hidden" />
                                        <input name="url" value="${product.url}" hidden="hidden" />
                                        <input name="imgUrl" value="${product.imgUrl}" hidden="hidden" />
                                        <input name="won" value="${product.won}" hidden="hidden" />
                                        <input name="dollar" value="${product.dollar}" hidden="hidden" />
                                        <input name="delivery" value="${product.delivery}" hidden="hidden" />
                                        <input name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" />
                                        <input name="otherCosts" value="${product.otherCosts}" hidden="hidden" />
                                        <input name="k_ProductName" value="${product.k_ProductName}" hidden="hidden" />
                                        <input name="keyword" value="${searchWord}" hidden="hidden" />
                                        <button class="btn btn-primary">핫딜에 추천하기</button>
                                    </form>
                                    <form class="actionForm" action="/market/detail">
                                        <input name="num" value="${product.num}" hidden="hidden" />
                                        <input name="id" value="${loginVo.id}" hidden="hidden" />
                                        <button class="btn btn-success">상세 페이지</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">로그인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Modal body text goes here.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

<%@ include file="./footer.jsp"%>
</body>
</html>