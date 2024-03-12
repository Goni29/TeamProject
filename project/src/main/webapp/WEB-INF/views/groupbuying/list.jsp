<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공동 구매 목록</title>
</head>
<body>
<h2>공동 구매 목록</h2>
<a href="/groupbuying/register">새 공동 구매 등록</a>
<table border="1">
    <tr>
        <th>제목</th>
        <th>등록일</th>
        <th>목표일</th>
        <th>목표 인원</th>
        <th>상세 보기</th>
    </tr>
    <c:forEach var="groupBuying" items="${groupBuyingList}">
        <tr>
            <td>${groupBuying.title}</td>
            <td>${groupBuying.regidate}</td>
            <td>${groupBuying.goaldate}</td>
            <td>${groupBuying.personnum}</td>
            <td><a href="/groupbuying/${groupBuying.gno}">상세 보기</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>