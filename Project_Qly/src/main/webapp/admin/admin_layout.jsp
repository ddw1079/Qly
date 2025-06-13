<%@ page contentType="text/html;charset=UTF-8"%>
<%
// 현재 페이지 파라미터 받아오기, 없으면 기본값으로 회원 관리 페이지로 설정
String pageParam = request.getParameter("page");
if (pageParam == null || pageParam.trim().equals("")) {
	pageParam = "admin_memberList.jsp"; // 기본 페이지
}
%>

<!-- 
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
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qly 관리자 레이아웃</title>

<!--  스타일 및 기능용 외부 CDN -->
<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery -->
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
}

.layout-wrapper {
	display: flex;
	height: 100vh; /* 전체 화면 높이 */
}

.sidebar {
	width: 15%; /* 사이드바 너비 (기존보다 조금 작게 조정) */
	min-width: 200px; /* 최소 너비 확보 */
	background-color: #9cc9c4; /* 사이드바 배경색 */
	color: white;
	padding: 20px;
}

.main-content {
	width: 85%;
	padding: 30px 30px 30px 40px; /* 상 우 하 좌 (좌측 더 넓게) */
	overflow-y: auto;
	background-color: #f1f2f6;
}
</style>

</head>

<body>
	<div class="layout-wrapper">
		<!--  사이드바 영역: 좌측 고정 메뉴 -->
		<div class="sidebar">
			<%@ include file="admin_sidebar.jsp"%>
		</div>

		<!--  본문 영역: 동적으로 각 관리 JSP 삽입 -->
		<div class="main-content">
			<jsp:include page="<%=pageParam%>" />
		</div>
	</div>
</body>
</html>
