<%@ page contentType="text/html;charset=UTF-8"%>
<%
    // 현재 페이지 파라미터 받아오기, 없으면 기본값으로 회원 관리 페이지로 설정
    String pageParam = request.getParameter("page");
    if (pageParam == null || pageParam.trim().equals("")) {
        pageParam = "admin_memberList.jsp"; // 기본 페이지
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Qly 관리자 레이아웃</title>

    <!--  Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!--  공통 스타일 설정 -->
    <style>
        * {
            box-sizing: border-box;
        }

        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f1f2f6;
            overflow-x: hidden;
        }

        .sidebar-bg {
            background-color: #9cc9c4;
            min-height: 100vh;
            padding: 20px;
            color: white;
        }

        @media (max-width: 768px) {
            .sidebar-bg {
                min-height: auto;
                padding: 15px;
            }
        }

        .main-area {
            background-color: #f1f2f6;
            padding: 30px 40px;
            min-height: 100vh;
        }
    </style>
</head>

<body>

<!--  반응형 Bootstrap Grid Layout -->
<div class="container-fluid">
    <div class="row">

        <!--  사이드바 영역 (좌측 고정) -->
        <div class="col-md-3 col-lg-2 sidebar-bg">
            <%@ include file="admin_sidebar.jsp" %>
        </div>

        <!--  본문 영역 (우측 컨텐츠) -->
        <div class="col-md-9 col-lg-10 main-area">
            <jsp:include page="<%=pageParam%>" />
        </div>

    </div>
</div>

</body>
</html>
