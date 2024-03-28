<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="content">
 
 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList">
  <li>
  <div>
   <p><span>주문자</span>${orderList.id}</p>
   <p><span>주소</span>${orderList.address}${orderList.detailaddress}${orderList.extraaddress}</p>
   <p><span>주문상품</span>${orderList.productname}</p>
   <p><span>주문날짜</span>${orderList.buyingdate}</p>
  </div>
  </li>
  </c:forEach>
 </ul>

</section>
</body>
</html>