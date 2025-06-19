<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
  <c:when test="${empty page}">
    <c:set var="page" value="personal_info.jsp" />
  </c:when>
</c:choose>

<%-- 
  ============================================================
   <  Qly 관리자 레이아웃 페이지 (admin_layout.jsp) >

   ▸ 이 페이지는 Qly 관리자 페이지의 전체 레이아웃을 담당합니다.
   ▸ 좌측 사이드바 + 우측 본문 영역으로 구성되어 있으며,
     각 관리 기능별 JSP를 동적으로 include 처리합니다.
   ▸ 주요 사용 예: 회원 관리, 퀘스트 관리, 코인 관리, 정책 관리 등

   ▸ 주요 구성 요소:
     - 사이드바: admin_sidebar.jsp (좌측 고정)
     - 본문 영역: ?page=admin_*.jsp 형태로 페이지 전환
     - 기본 페이지: admin_memberList.jsp
  ============================================================
--%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Qly 유저 레이아웃</title>

  <!-- 스타일 및 기능용 외부 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
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

    .layout-wrapper {
      display: flex;
      height: 100vh;
    }

    .sidebar {
      width: 15%;
      min-width: 200px;
      background-color: #9cc9c4;
      color: white;
      padding: 20px;
    }

    .main-content {
      width: 85%;
      padding: 30px 30px 30px 40px;
      overflow-y: auto;
      background-color: #f1f2f6;
    }
  </style>
</head>

<body>

  <div class="layout-wrapper">

    <!-- ✅ 사이드바 영역 -->
    <div class="sidebar">
      <%@ include file="user_sidebar.jsp" %>
    </div>

    <!-- ✅ 본문 영역 -->
    <div class="main-content">
      <c:choose>
        <c:when test="${page eq 'personal_info.jsp'}">
          <jsp:include page="/WEB-INF/views/mapage/personal_info.jsp" />
        </c:when>
        <c:when test="${page eq 'edit_personal_info.jsp'}">
          <jsp:include page="/WEB-INF/views/mapage/edit_personal_info.jsp" />
        </c:when>
        <c:when test="${page eq 'questCard.jsp'}">
          <jsp:include page="/WEB-INF/views/mapage/questCard.jsp" />
        </c:when>
        <c:when test="${page eq 'questHistory.jsp'}">
          <jsp:include page="/WEB-INF/views/mapage/questHistory.jsp" />
        </c:when>
        <c:when test="${page eq 'heagual_questCard.jsp'}">
          <jsp:include page="/WEB-INF/views/mapage/heagual_questCard.jsp" />
        </c:when>
        <c:when test="${page eq 'heagual_questHistory.jsp'}">
          <jsp:include page="/WEB-INF/views/mapage/heagual_questHistory.jsp" />
        </c:when>
        <%-- 여기에 코인충전 페이지 추가 시 아래처럼 사용
        <c:when test="${page eq 'coin_charge.jsp'}">
          <jsp:include page="/WEB-INF/views/mapage/coin_charge.jsp" />
        </c:when>
        --%>
        <c:otherwise>
          <jsp:include page="/WEB-INF/views/mapage/personal_info.jsp" />
        </c:otherwise>
      </c:choose>
    </div>

  </div>
</body>
</html>
