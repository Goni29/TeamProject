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
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="./topbar.jsp"%>
            
            <div id="content main-content" class="main-width">  

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">인기 급상승 상품</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <c:forEach var="product" items="${products}" begin="0" end="3">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                                </div>
                                <div class="">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image"> <br>
                                </div>
                                <a href="pr?num=${product.num}">
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

                    <!-- Additional Content Row -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">당신을 위한 상품!</h1>
                    </div>
                    <div class="row">
                        <c:forEach var="product2" items="${products2}" begin="0" end="3">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                                </div>
                                <div class="">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4 img-size" src="${product2.imgUrl}" alt="Product Image"> <br>
                                </div>
                                <a href="pr?num=${product2.num}">
                                    <c:choose>
                                        <c:when test="${fn:length(product2.productName) > 20}">
                                            ${fn:substring(product2.productName, 0, 20)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${product2.productName}
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

                    <!-- Additional Content Section -->
                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <!-- Left Column -->
                            <div class="col">
                                <h3>국내외 상품 가격 비교</h3>
                                <hr>

                                <div class="container">
                                    <!-- Form for Searching Products -->
                                    <div class="mb-3">
                                        <form action="/market/search" method="get">
                                            <label for="search" class="form-label">상품명 입력</label> 
                                            <input type="text" class="form-control" id="search" name="keyword" placeholder="ex) logitech g102">
                                            
                                            <!-- Checkbox for Selecting Market Types -->
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="type" value="11st" checked="checked">
                                                <label class="form-check-label" for="inlineCheckbox1">11번가</label>
                                            </div>
                                            <!-- Add more checkboxes here -->

                                            <br>
                                            <!-- Submit Button -->
                                            <button type="submit" id="submit" class="btn btn-primary mb-3">검색</button>
                                            <!-- Alert for Errors -->
                                            <span id="alert" class="text-danger"></span>
                                        </form>

                                        <!-- Sample Image -->
                                        <img src="https://cdn.011st.com/11dims/resize/248/11src/pd/v2/2/4/3/3/4/5/IbOMi/2823243345_B.png" alt="Image">
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