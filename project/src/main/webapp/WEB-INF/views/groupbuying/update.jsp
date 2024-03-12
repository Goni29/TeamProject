<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공동 구매 수정</title>
</head>
<body>
<h2>공동 구매 수정</h2>
<form action="/groupbuying/update" method="post">
    <input type="hidden" name="gno" value="${groupBuying.gno}">
    제목: <input type="text" name="title" value="${groupBuying.title}"><br>
    내용: <textarea name="content">${groupBuying.content}</textarea><br>
    목표일: <input type="text" name="goaldate" value="${groupBuying.goaldate}"><br>
    목표 인원: <input type="number" name="personnum" value="${groupBuying.goaltarget}"><br>
    <input type="submit" value="수정">
</form>
</body>
</html>