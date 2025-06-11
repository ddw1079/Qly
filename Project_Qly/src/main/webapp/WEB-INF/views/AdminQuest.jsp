<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>퀘스트 목록</title>
</head>
<body>
    <h2>퀘스트 목록</h2>
    <form action="questList.do" method="get">
        <input type="text" name="keyword" placeholder="검색어">
        <button type="submit">검색</button>
    </form>
    
    <table border="1">
        <tr>
            <th>제목</th>
            <th>보상</th>
            <th>지역</th>
            <th>작성자</th>
        </tr>
        <c:forEach var="quest" items="${questList}">
            <tr>
                <td>${quest.title}</td>
                <td>${quest.rewardTokens}</td>
                <td>${quest.location}</td>
                <td>${quest.creatorNickname}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
