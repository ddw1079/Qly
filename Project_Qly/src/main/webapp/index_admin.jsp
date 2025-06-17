<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 시작 페이지</title>
</head>
<body>
	<script>
		// 관리자 레이아웃으로 리디렉션
		location.href = "${pageContext.request.contextPath}/admin/memberList.do";
	</script>
</body>
</html>