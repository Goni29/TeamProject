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
							                   <button class="btn btn-link" data-toggle="collapse" data-target="#custommerservice-collapse${status.index}" aria-expanded="true" aria-controls="collapse${status.index}">
							                       ${order.productname}
							                   </button>
							               </h5>
							           </div>
							           <div id="custommerservice-collapse${status.index}" class="collapse" aria-labelledby="heading${status.index}" data-parent="#accordion${status.index}">
							              <div class="table-responsive">
											  <table class="table">
											    <thead>
											      <tr>
											        <th>주문인</th>
											        <th>수신인</th>
											        <th>주소</th>
											        <th>주문상품</th>
											        <th>주문날짜</th>
											        <th>배송상태</th>
											      </tr>
											    </thead>
											    <tbody>
											      <tr>
											        <td>${order.id}</td>
											        <td>${order.name}</td>
											        <td>${order.address} ${order.addressdetail} ${order.extraaddress}</td>
											        <td>${order.productname}</td>
											        <td>${order.buyingdate}</td>
											        <td>${order.delivery}</td>
											      </tr>
											      <!-- 추가 데이터 행을 여기에 삽입 -->
											    </tbody>
											  </table>
											</div>
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
</body>
</html>