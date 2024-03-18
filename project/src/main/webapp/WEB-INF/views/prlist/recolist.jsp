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
            
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">추천상품</h1>
            </div>
            
            <div class="row">
                <c:forEach var="product" items="${products}" begin="0" end="4">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                        </div>
                        <div class="">
                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image"> <br>
                        </div>
                        <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                            <c:choose>
                                <c:when test="${fn:length(product.productName) > 20}">
                                    ${fn:substring(product.productName, 0, 20)}...
                                </c:when>
                                <c:otherwise>
                                    ${product.productName}
                                </c:otherwise>
                            </c:choose>
                        </a><br>
                        <div class="row no-gutters align-items-center">
                            <div class="col-auto">
                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                            </div>
                            <div class="col">
                                <div class="progress progress-sm mr-2">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <div class="row">
                <c:forEach var="product" items="${products}" begin="0" end="2">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                        </div>
                        <div class="">
                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image"> <br>
                        </div>
                        <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                            <c:choose>
                                <c:when test="${fn:length(product.productName) > 20}">
                                    ${fn:substring(product.productName, 0, 20)}...
                                </c:when>
                                <c:otherwise>
                                    ${product.productName}
                                </c:otherwise>
                            </c:choose>
                        </a><br>
                        <div class="row no-gutters align-items-center">
                            <div class="col-auto">
                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                            </div>
                            <div class="col">
                                <div class="progress progress-sm mr-2">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <%--
            필요시 추가하여 쓰세연
             <div class="row">
                <c:forEach var="product" items="${products}" begin="0" end="7">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                        </div>
                        <div class="">
                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image"> <br>
                        </div>
                        <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                            <c:choose>
                                <c:when test="${fn:length(product.productName) > 20}">
                                    ${fn:substring(product.productName, 0, 20)}...
                                </c:when>
                                <c:otherwise>
                                    ${product.productName}
                                </c:otherwise>
                            </c:choose>
                        </a><br>
                        <div class="row no-gutters align-items-center">
                            <div class="col-auto">
                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                            </div>
                            <div class="col">
                                <div class="progress progress-sm mr-2">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div> --%>
        </div>
    </div>
</body>
</html>