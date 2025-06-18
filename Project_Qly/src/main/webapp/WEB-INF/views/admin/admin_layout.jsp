<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qly 관리자 레이아웃</title>

<!-- 외부 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 공통 스타일 -->
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
			<%@ include file="admin_sidebar.jsp" %>
		</div>

		<!-- ✅ 본문 영역 -->
		<div class="main-content">
			<c:choose>
				<c:when test="${page eq 'admin_memberList.jsp'}">
					<jsp:include page="/WEB-INF/views/admin/admin_memberList.jsp" />
				</c:when>
				<c:when test="${page eq 'admin_questList.jsp'}">
					<jsp:include page="/WEB-INF/views/admin/admin_questList.jsp" />
				</c:when>
				<c:when test="${page eq 'admin_coinList.jsp'}">
					<jsp:include page="/WEB-INF/views/admin/admin_coinList.jsp" />
				</c:when>
				<c:when test="${page eq 'admin_question.jsp'}">
					<jsp:include page="/WEB-INF/views/admin/admin_question.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="/WEB-INF/views/admin/admin_memberList.jsp" />
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</body>
</html>
