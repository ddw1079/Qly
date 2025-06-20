<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/template/menubar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8fdfa;
	padding: 40px 0;
}
.detail-container {
	max-width: 800px;
	margin: 80px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
}
.detail-header {
	border-bottom: 1px solid #ddd;
	margin-bottom: 24px;
	padding-bottom: 10px;
}
.detail-title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}
.detail-meta {
	font-size: 14px;
	color: #888;
}
.detail-content {
	font-size: 16px;
	line-height: 1.8;
	white-space: pre-wrap;
	margin-top: 20px;
}
.status-badge {
	font-size: 14px;
	font-weight: bold;
	padding: 6px 12px;
	border-radius: 20px;
}
</style>
</head>
<body>

<div class="detail-container">
	<!-- 문의 제목, 작성일, 유형 -->
	<div class="detail-header d-flex justify-content-between align-items-center">
		<div>
			<div class="detail-title">[${inquiry.type}] ${inquiry.title}</div>
			<div class="detail-meta mt-1">
				작성일: ${inquiry.createdDate} | 문의유형: ${inquiry.type}
			</div>
		</div>
		<c:choose>
			<c:when test="${inquiry.answerStatus eq '답변완료'}">
				<span class="status-badge bg-success">답변 완료</span>
			</c:when>
			<c:otherwise>
				<span class="status-badge bg-warning text-dark">답변 대기</span>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- 문의 내용 -->
	<div class="detail-content">
		${inquiry.content}
	</div>

	<!-- 관리자 답변 -->
<!-- 관리자 답변 -->
<div class="mt-5 p-3 border rounded bg-light">
	<strong class="text-success">관리자 답변</strong>
	<div class="mt-2" style="white-space: pre-wrap;">
		<c:choose>
			<c:when test="${not empty inquiry.questionContent}">
				${inquiry.questionContent}
			</c:when>
			<c:otherwise>
				답변 대기중입니다.
			</c:otherwise>
		</c:choose>
	</div>
</div>



</body>
</html>
