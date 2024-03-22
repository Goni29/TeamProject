<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
</head>
<body>
<h2>Menu Categories</h2>
<ul>
    <c:forEach var="category" items="${categories}">
        <li>${category.name}</li>
    </c:forEach>
</ul>
</body>
</html>