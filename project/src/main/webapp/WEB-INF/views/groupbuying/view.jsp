<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공동 구매 상세 정보</title>
</head>
<body>
<h2>공동 구매 상세 정보</h2>
<table border="1">
    <tr>
        <th>제목</th>
        <td>${groupBuying.title}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${groupBuying.content}</td>
    </tr>
    <tr>
        <th>등록일</th>
        <td>${groupBuying.regidate}</td>
    </tr>
    <tr>
        <th>목표일</th>
        <td>${groupBuying.goaldate}</td>
    </tr>
    <tr>
        <th>목표 인원</th>
        <td>${groupBuying.goaltarget}</td>
    </tr>
</table>
<a href="/groupbuying/list">목록으로 돌아가기</a>
</body>
</html>