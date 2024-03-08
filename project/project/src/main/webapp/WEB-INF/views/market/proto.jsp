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
    .main_product_screen {
    width: 1200px;
    margin: 0 auto;
}
</style>

<head>
   <title>Home</title>
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
   <script src="resources/js/sb-admin-2.js"></script>
   <script src="resources/js/sb-admin-2.min.js"></script>
</head>

<body class="main_product_screen">
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
               <div class="text-center">
                   <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="${product.imgUrl}" alt="Product Image"> <br>
                   <a href="pr?keyword=${product.keyword}">
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
           </div>
       </c:forEach>
   </div>
   
   <div class="product_grid">
       <div class="popular_product_label">추천상품</div>
       <c:forEach var="product2" items="${products2}" begin="0" end="3">
           <div class="card-body">
               <div class="groupbuy_item">
                   <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="${product2.imgUrl}" alt="Product Image"> <br>
                   <a href="pr?keyword=${product2.keyword}">
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
           </div>
       </c:forEach>
   </div>
</body>

</html>