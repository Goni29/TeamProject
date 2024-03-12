<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>

<style>
    .page-size {
        width: 100vw;
    }
</style>

=======
<html>
<head>
    <title>공동 구매 상세 정보</title>
</head>
>>>>>>> branch 'master' of https://github.com/Goni29/TeamProject.git
<body>
<<<<<<< HEAD
    
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
=======
<h2>공동 구매 상세 정보</h2>
<table border="1">
    <tr>
        <th>제목</th>
        <td>${groupBuying.title}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${groupBuying.content}</td>
    </tr>
    <tr>
        <th>등록일</th>
        <td>${groupBuying.regidate}</td>
    </tr>
    <tr>
        <th>목표일</th>
        <td>${groupBuying.goaldate}</td>
    </tr>
    <tr>
        <th>목표 인원</th>
        <td>${groupBuying.goaltarget}</td>
    </tr>
</table>
<a href="/groupbuying/list">목록으로 돌아가기</a>
>>>>>>> branch 'master' of https://github.com/Goni29/TeamProject.git
</body>
</html>