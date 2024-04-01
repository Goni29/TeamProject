<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../header.jsp" %>

<style>
    .page-size {
        width: 100vw;
    }
    .center-title {
        text-align: center;
    }
    .content-container {
        padding-top: 50px; 
    }
</style>

<body id="page-top">
    
    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <%@ include file="../sidebar.jsp" %>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="../topbar.jsp" %>
            <div id="content main-content" class="main-width">  

                <div class="container">
                
					<h1 class="mt-5 center-title">구매 목록 조회</h1>

					<div class="row mt-5">
					    <c:forEach items="${orderList}" var="order" varStatus="status">
					        <div class="col-12">
					            <div id="accordion${status.index}">
					                <div class="card">
					                    <div class="card-header" id="heading${status.index}">
					                        <h5 class="mb-0 center-title">
					                            <button class="btn btn-link" data-toggle="collapse" data-target="#rec-collapse${status.index}" aria-expanded="true" aria-controls="collapse${status.index}">
					                                ${order.productname}
					                            </button>
					                        </h5>
					                    </div>
					                    <div id="rec-collapse${status.index}" class="table-responsive collapse" data-parent="#accordion${status.index}">
					                        <table class="table table-bordered">
					                            <tbody>
					                                <tr>
					                                    <td>주문인</td>
					                                    <td>${order.id}</td>
					                                </tr>
					                                <tr>
					                                    <td>수령인</td>
					                                    <td>${order.name}</td>
					                                </tr>
					                                <tr>
					                                    <td>주소</td>
					                                    <td>${order.address} ${order.addressdetail} ${order.extraaddress}</td>
					                                </tr>
					                                <tr>
					                                    <td>주문상품</td>
					                                    <td>${order.productname}</td>
					                                </tr>
					                                <tr>
					                                    <td>주문수량</td>
					                                    <td>${order.count_product}</td>
					                                </tr>
					                                <tr>
					                                    <td>주문날짜</td>
					                                    <td>${order.buyingdate}</td>
					                                </tr>
					                                <tr>
					                                    <td>배송상태</td>
					                                    <td>${order.delivery}</td>
					                                </tr>
					                            </tbody>
					                        </table>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </c:forEach>
					</div>
                </div>
            </div>
        </div>
    </div>
<%@include file="../footer.jsp"%>
</body>
</html>