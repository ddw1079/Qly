<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>회원 관리</title>

    <!-- 내부 CSS -->
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

        /* 검색창 정렬 및 스타일 */
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

        .delete-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 7px 14px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #b92c3e;
        }
    </style>
</head>

<body>

<!--  페이지 제목 및 안내 문구 -->
<h2>회원 관리</h2>
<p>회원의 권한을 변경하거나 계정을 삭제할 수 있습니다.</p>

<!--  검색 폼: 아이디 또는 닉네임 검색용 (GET 방식으로 서버에 요청) -->
<form class="search-form" action="/admin/memberList" method="get">
    <input type="text" name="keyword" class="search-box" placeholder="검색" value="${param.keyword}" />
    <button type="submit" class="search-button">🔍</button>
</form>

<!--  회원 목록 테이블 -->
<table>
    <thead>
        <tr>
            <th>회원 번호</th>
            <th>회원 아이디</th>
            <th>회원 E-mail</th>
            <th>회원 권한</th>
            <th>계정 생성일</th>
            <th>회원 계정 삭제</th>
        </tr>
    </thead>
    <tbody>
        <!--  JSTL 반복문으로 회원 리스트 출력 -->
        <c:forEach var="user" items="${userList}" varStatus="status">
            <tr>
                <!-- 반복 순번 출력 (1부터 시작) -->
                <td>${status.index + 1}</td>

                <!-- 각 회원 정보 출력 -->
                <td>${user.userId}</td>
                <td>${user.email}</td>
                

                <!-- 가입일 날짜 포맷 적용 -->
                <td><fmt:formatDate value="${user.createdAt}" pattern="yyyy-MM-dd" /></td>

                <!-- 계정 삭제 버튼 (POST 방식) -->
                <td>
                    <form action="/admin/deleteUser" method="post">
                        <input type="hidden" name="userId" value="${user.userId}" />
                        <button type="submit" class="delete-button">삭제하기</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
