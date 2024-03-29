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

                    <div class="row">
                           <c:forEach items="${orderList}" var="order" varStatus="status">
							   <div id="accordion${status.index}">
							       <div class="card">
							           <div class="card-header" id="heading${status.index}">
							               <h5 class="mb-0">
							                   <button class="btn btn-link" data-toggle="collapse" data-target="#custommerservice-collapse${status.index}" aria-expanded="true" aria-controls="collapse${status.index}">
							                       ${order.productname}
							                   </button>
							               </h5>
							           </div>
							           <div id="custommerservice-collapse${status.index}" class="collapse show" aria-labelledby="heading${status.index}" data-parent="#accordion${status.index}">
							               <div class="card-body">
							                   <p><span>주문자</span>${order.id}</p>
							                   <p><span>수신인</span>${order.name}</p>
							                   <p><span>주소</span>${order.address}${order.addressdetail}${order.extraaddress}</p>
							                   <p><span>주문상품</span>${order.productname}</p>
							                   <p><span>주문날짜</span>${order.buyingdate}</p>
							                   <p><span>배송상태</span>${order.delivery}</p>
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