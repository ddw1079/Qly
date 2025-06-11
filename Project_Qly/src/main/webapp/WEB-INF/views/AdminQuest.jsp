<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>퀘스트 목록</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 40px;
        }

        h2 {
            text-align: left;
            margin-bottom: 5px;
        }

        p {
            font-size: 14px;
            margin-bottom: 20px;
            color: #555;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f5f5f5;
        }

        form.search-form {
            text-align: right;
            margin-bottom: 20px;
        }

        .search-box {
            padding: 6px;
            font-size: 14px;
        }

        .search-button {
            padding: 7px 14px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        .search-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

<!-- 제목 및 안내 문구 -->
<h2>퀘스트 목록</h2>
<p>현재 등록된 퀘스트들을 확인할 수 있습니다.</p>

<!-- 검색 폼 -->
<form class="search-form" action="/admin/questList" method="get">
    <input type="text" name="keyword" class="search-box" placeholder="퀘스트 검색" value="${param.keyword}" />
    <button type="submit" class="search-button">🔍</button>
</form>

<!-- 퀘스트 테이블 -->
<table>
    <thead>
        <tr>
            <th>퀘스트 제목</th>
            <th>보상 (Qubit)</th>
            <th>지역</th>
            <th>작성자 ID</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="quest" items="${questList}">
            <tr>
                <td>${quest.title}</td>
                <td>${quest.rewardTokens}</td>
                <td>${quest.location}</td>
                <td>${quest.creatorId}</td> 
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
