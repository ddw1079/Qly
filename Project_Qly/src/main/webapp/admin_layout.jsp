<%@ page contentType="text/html;charset=UTF-8"%>
<%
String pageParam = request.getParameter("page");
if (pageParam == null || pageParam.trim().equals("")) {
	pageParam = "admin_memberList.jsp"; // 기본 페이지
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Qly 관리자 레이아웃</title>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	width: 15%; /* 줄였습니다 */
	min-width: 200px;
	background-color: #fcb80f;
	color: white;
	padding: 20px;
}

.main-content {
	width: 85%;
	padding: 30px 30px 30px 40px; /* 상 우 하 좌 → 좌측만 더 넉넉하게 */
	overflow-y: auto;
	background-color: #f1f2f6;
}
</style>
</head>
<body>
	<div class="layout-wrapper">
		<!--  사이드바 (고정) -->
		<div class="sidebar">
			<%@ include file="admin_sidebar.jsp"%>
		</div>

		<!--  본문 내용 영역 -->
		<div class="main-content">
			<jsp:include page="<%=pageParam%>" />
		</div>
	</div>
</body>
</html>
