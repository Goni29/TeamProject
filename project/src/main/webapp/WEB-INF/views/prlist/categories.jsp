<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Categories</title>
</head>
<body>
<h2>Categories List</h2>
<ul>
    <c:forEach var="category" items="${categories}">
        <li>
            <a href="/categories/large/${category.large}/medium/${category.medium}/small/${category.small}">
                Large: ${category.large}, Medium: ${category.medium}, Small: ${category.small}
            </a>
        </li>
    </c:forEach>
</ul>
</body>
</html>