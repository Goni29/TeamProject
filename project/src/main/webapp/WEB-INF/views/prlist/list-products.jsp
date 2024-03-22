<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <!-- 이곳에 필요한 CSS 및 JavaScript 파일을 포함할 수 있습니다. -->
</head>
<body>

<!-- AJAX 요청에 대한 응답으로 돌아가는 제품 목록 -->
<c:choose>
    <c:when test="${not empty products}">
        <table border="1">
            <tr>
                <th>Product Name</th>
                <th>Market Name</th>
                <th>Price</th>
                <th>Category</th>
                <th>Group Buying</th>
                <th>View</th>
            </tr>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.productName}</td>
                    <td>${product.marketName}</td>
                    <td>${product.won}</td>
                    <td>${product.large}/${product.medium}/${product.small}/${product.sub_category}</td>
                    <td><c:out value="${product.groupbuying eq '1' ? 'Yes' : 'No'}"/></td>
                    <td><a href="${product.url}" target="_blank">View Product</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p>No products found for the selected category.</p>
    </c:otherwise>
</c:choose>

</body>
</html>