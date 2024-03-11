<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>

<style>
    .page-size {
        width: 100vw;
    }
</style>

<body>
    
    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <%@ include file="../sidebar.jsp"%>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="../topbar.jsp"%>

<h1>${marketVo.productName} 상세 정보</h1>

<div>
    <img src="${marketVo.imgUrl}" alt="${marketVo.productName}" style="width:300px;">
    <p><strong>상품명:</strong> ${marketVo.productName}</p>
    <p><strong>마켓명:</strong> ${marketVo.marketName}</p>
    <p><strong>가격:</strong> ${marketVo.won}원</p>
    <p><strong>달러 가격:</strong> ${marketVo.dollar}달러</p>
    <p><strong>배송 정보:</strong> ${marketVo.delivery}</p>
    <p><strong>배송비:</strong> ${marketVo.deliveryFee}</p>
    <p><strong>기타 비용:</strong> ${marketVo.otherCosts}</p>
    <p><strong>상품 페이지:</strong> <a href="${marketVo.url}" target="_blank">상품 보러가기</a></p>
    <p><strong>조회수:</strong> ${marketVo.marketViewCount}</p>
    
</div>
</div>
</div>
</body>
</html>