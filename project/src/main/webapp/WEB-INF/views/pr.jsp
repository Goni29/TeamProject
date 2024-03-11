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
    .pr-size {
        width: 1000px;
    }
</style>
<body id="page-top">
    
    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <%@ include file="./sidebar.jsp"%>
        <div id="content-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="./topbar.jsp"%>
            <div class="container-fluid pr-size">
                <c:forEach var="product" items="${products}">
                    <div class="row">
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <img src="${product.imgUrl}" class="img-fluid" alt="Image">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-8">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <p>${product.marketName}</p>
                                        <a href="${product.url}" class="text-decoration-none">${product.productName}</a><br>
                                        <p>가격 : ${product.won}원</p>
                                        <p>예상 기간 : ${product.delivery}</p>
                                        <p>조회수 : ${product.marketViewCount}</p>
                                        <br>
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
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="chart-area">
                                    
                                    </div>
                                </div>
                            </div>
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="chart-area">
                                        
                                    </div>
                                </div>
                            </div>
                </c:forEach>
            </div>
        </div>
    </div>

<%@ include file="./footer.jsp"%>
</body>
</html>