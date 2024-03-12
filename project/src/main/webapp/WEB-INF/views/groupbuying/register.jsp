<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공동 구매 등록</title>
</head>
<body>
<h2>새 공동 구매 등록</h2>
<form action="/groupbuying/register" method="post">
    제목: <input type="text" name="title"><br>
    내용: <textarea name="content"></textarea><br>
    목표일: <input type="text" name="goaldate"><br>
    목표 인원: <input type="number" name="goaltarget"><br>
    <input type="submit" value="등록">
</form>
</body>
</html>