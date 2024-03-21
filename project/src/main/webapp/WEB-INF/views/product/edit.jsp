<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Product Registration</title>
</head>
<body>

	<h2>제품 등록</h2>

	<form:form modelAttribute="product"
		action="${pageContext.request.contextPath}/product/update"
		method="POST">
		<form:label path="productName">상품명 : </form:label>
		<form:input path="productName" />
		<br />

		<form:label path="marketName">마켓 이름 : </form:label>
		<form:input path="marketName" />
		<br />

		<form:label path="url">상품 URL : </form:label>
		<form:input path="url" />
		<br />

		<form:label path="imgUrl">이미지 URL : </form:label>
		<form:input path="imgUrl" />
		<br />

		<form:label path="won">가격 : </form:label>
		<form:input path="won" />
		<br />

		<form:label path="keyword">제품 키워드 : </form:label>
		<form:input path="keyword" />
		<br />

		<form:label path="description">제품 설명 : </form:label>
		<form:textarea path="description" rows="5" cols="30"></form:textarea>
		<br />

		<input type="submit" value="Update Product" />
	</form:form>

</body>
</html>