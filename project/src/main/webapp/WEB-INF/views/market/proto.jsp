<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../nav.jsp"%>

<style>
    .product_grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 10px;
        border: 2px solid #000;
        padding: 20px;
        position: relative;
    }
    .hot_item {
        margin: 10px;
    }
    .hot_item img {
        width: 200px;
        height: 200px;
        object-fit: contain;
    }
    .search_bar {
        margin-bottom: 20px;
    }
    .popular_product_label {
        position: absolute;
        top: -10px;
        left: 10px;
        background: #fff;
        padding: 0 10px;
    }
    
    .groupbuying_product_label {
        position: absolute;
        top: -10px;
        left: 10px;
        background: #fff;
        padding: 0 10px;
    }
</style>

<div class="search_bar">
    <form action="/search" method="get">
        <input type="text" name="query" placeholder="상품 검색">
        <input type="submit" value="검색">
    </form>
</div>

<div class="product_grid">
    <div class="popular_product_label">인기상품</div>
    <c:forEach var="product" items="${products}" begin="0" end="3">
        <div class="hot_item">
            <img src="${product.imgUrl}" alt="Product Image"> <br>
            <a href="pr?keyword=${product.keyword}">${product.productName}</a><br>
        </div>
    </c:forEach>
</div>

<div class="product_grid">
    <div class="groupbuying_product_label">공구상품</div>
    <c:forEach var="product2" items="${products2}" begin="0" end="7">
        <div class="hot_item">
            <img src="${product2.imgUrl}" alt="Product Image"> <br>
            <a href="pr?keyword=${product2.keyword}">${product2.productName}</a><br>
        </div>
    </c:forEach>
</div>

</body>
</html>