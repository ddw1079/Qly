<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String pageParam = (String) request.getAttribute("pageParam");
  if (pageParam == null || pageParam.trim().equals("")) {
    pageParam = request.getParameter("page");
  }
  if (pageParam == null || pageParam.trim().equals("")) {
    pageParam = "mypage/contents/personal_info.jsp";
  }
  request.setAttribute("pageParam", pageParam);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Qly 마이페이지</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
  }
  .nav-fixed {
    position: sticky;
    top: 0;
    z-index: 999;
  }
  .layout-wrapper {
    display: flex;
    height: calc(100vh - 88px); /* 상단 메뉴바 높이 제외 */
  }
  .sidebar {
    width: 15%;
    min-width: 200px;
    background-color: #9cc9c4;
    color: white;
    padding: 20px;
  }
  .main-content {
    flex-grow: 1;
    min-height: 0;
    overflow-y: auto;
    padding: 30px 30px 30px 40px;
    background-color: #f1f2f6;
  }
</style>
</head>

<body>
  <!-- ✅ 상단 네비게이션 고정 메뉴바 -->
  <div class="nav-fixed">
    <%@ include file="/template/menubar.jsp" %>
  </div>

  <div class="layout-wrapper">
    <!-- 좌측 사이드바 -->
    <div class="sidebar">
      <%@ include file="user_sidebar.jsp" %>
    </div>

    <!-- 우측 메인 컨텐츠 -->
    <div class="main-content">
      <c:import url="/WEB-INF/views/${pageParam}" />
    </div>
  </div>
</body>
</html>
