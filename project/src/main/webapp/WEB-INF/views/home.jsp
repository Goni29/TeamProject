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
    
    .img-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
	}

.img-size {
    max-width: 100px;
    height: auto;
	}
</style>

<body id="page-top">
    
    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <%@ include file="./sidebar.jsp"%>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="./topbar.jsp"%>
            <div id="content main-content" class="main-width">  

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">인기 급상승 상품</h1>
                    </div>

                    <div class="row">
                        <c:forEach var="product" items="${products}" begin="0" end="3">
                            <div class="col-xl-3 col-md-6 mb-4 border">
                                <p>${product.marketName}</p>
                                
                                <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image" > <br>
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
                                </a><br>
                                      
                                <div>
	                               	<p>가격 : ${product.won}원</p>
	                                <p>현재 참여 인원 : ${product.personnum}</p>
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${product.personnum}%</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: ${product.personnum}%" aria-valuenow="${product.personnum}" aria-valuemin="0" aria-valuemax="${product.goaltarget}"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group" aria-label="Button group">
                                   <form class="actionForm" action="/board/register">
                                       <input name="num" value="${product.num}" hidden="hidden" />
                                       <input name="productName" value="${product.productName}" hidden="hidden" />
                                       <input name="marketName" value="${product.marketName}" hidden="hidden" />
                                       <input name="url" value="${product.url}" hidden="hidden" />
                                       <input name="imgUrl" value="${product.imgUrl}" hidden="hidden" />
                                       <input name="won" value="${product.won}" hidden="hidden" />
                                      
                                       <input name="delivery" value="${product.delivery}" hidden="hidden" />
                                       <input name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" />
                                   
                                       <input name="keyword" value="${searchWord}" hidden="hidden" />
                                       <button class="btn btn-primary">공동구매 참여하기</button>
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
                                       <button class="btn btn-primary">찜하기</button>
                                  	</form>
                                   
                                   <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                       <button class="btn btn-success">상세 페이지</button>
                                   </a>
                               </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Additional Content Row -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">당신을 위한 상품!</h1>
                    </div>
                    <div class="row">
                        <c:forEach var="product2" items="${recentlyViewedProducts}" begin="0" end="3">
                            <div class="col-xl-3 col-md-6 mb-4 border">
                                <p>${product2.marketName}</p>

                                <a href="/pr?large=${product2.large}&medium=${product2.medium}&small=${product2.small}&sub_category=${product2.sub_category}&num=${product2.num}">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4 img-size" src="${product2.imgUrl}" alt="Product Image"> <br>
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    <c:choose>
                                        <c:when test="${fn:length(product2.productName) > 20}">
                                            ${fn:substring(product2.productName, 0, 20)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${product2.productName}
                                        </c:otherwise>
                                    </c:choose>
                                    </h6>
                                </a><br>
                                       
                                <div>
                                    <p>가격 : ${product2.won}원</p>
                                    <p>현재 참여 인원 : ${product2.personnum}</p>
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${product2.personnum}%</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: ${product2.personnum}%" aria-valuenow="${product2.personnum}" aria-valuemin="0" aria-valuemax="${product2.goaltarget}"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group" aria-label="Button group">
                                    <form class="actionForm" action="/board/register">
                                        <input name="num" value="${product2.num}" hidden="hidden" />
                                        <input name="productName" value="${product2.productName}" hidden="hidden" />
                                        <input name="marketName" value="${product2.marketName}" hidden="hidden" />
                                        <input name="url" value="${product2.url}" hidden="hidden" />
                                        <input name="imgUrl" value="${product2.imgUrl}" hidden="hidden" />
                                        <input name="won" value="${product2.won}" hidden="hidden" />
                                   
                                        <input name="delivery" value="${product2.delivery}" hidden="hidden" />
                                        <input name="deliveryFee" value="${product2.deliveryFee}" hidden="hidden" />
                                       
                                        <input name="keyword" value="${searchWord}" hidden="hidden" />
                                        <button class="btn btn-primary" hidden="hidden">공동구매 참여하기</button>
                                    </form>
                                    
                                	<form class="actionForm" action="/user/save">
                                        <input name="num" value="${product2.num}" hidden="hidden" />
                                        <input name="productName" value="${product2.productName}" hidden="hidden" />
                                        <input name="marketName" value="${product2.marketName}" hidden="hidden" />
                                        <input name="url" value="${product2.url}" hidden="hidden" />
                                        <input name="imgUrl" value="${product2.imgUrl}" hidden="hidden" />
                                        <input name="won" value="${product2.won}" hidden="hidden" />
                                   
                                        <input name="delivery" value="${product2.delivery}" hidden="hidden" />
                                        <input name="deliveryFee" value="${product2.deliveryFee}" hidden="hidden" />
                                       
                                        <input name="keyword" value="${searchWord}" hidden="hidden" />
                                        <button class="btn btn-primary">찜하기</button>
                                    </form>
                                    
                                    <a href="/pr?large=${product2.large}&medium=${product2.medium}&small=${product2.small}&sub_category=${product2.sub_category}&num=${product2.num}">
                                        <button class="btn btn-success" hidden="hidden">상세 페이지</button>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Additional Content Section -->
                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <!-- Left Column -->
                            <div class="col">
                                <h3>최근본 상품 목록</h3>
                                <hr>

                                <div class="container">
								    <div class="img-container">
								        <c:forEach var="product2" items="${recentlyViewedProducts}" begin="0" end="3">
								            <div class="mb-3">
								                <a href="/pr?large=${product2.large}&medium=${product2.medium}&small=${product2.small}&sub_category=${product2.sub_category}&num=${product2.num}">
								                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4 img-size" src="${product2.imgUrl}" alt="Product Image">
								                </a>
								            </div>
								        </c:forEach>
								    </div>
								</div>
                            </div>

                            <!-- Right Column -->
                            <div class="col">
                                <h3>실시간 검색 키워드</h3>
                                <hr>
                                <!-- Additional Content -->
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</body>

</html>