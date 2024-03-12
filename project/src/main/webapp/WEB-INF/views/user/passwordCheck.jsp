<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../header.jsp"%>
<%@ include file="../topbar.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 확인</title>
</head>
<body>
	<h2>상세 정보 페이지로 이동하기 위해 비밀번호를 입력해 주세요.</h2>
	<form action="/user/info" method="post">
		<input type="password" name="password" />
		<button>상세 정보 페이지로</button>
	</form>
	
<%@ include file="../footer.jsp"%>