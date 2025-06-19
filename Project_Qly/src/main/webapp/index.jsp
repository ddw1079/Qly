<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<!-- 파일명은   index.jsp -->
<head>
<!--  위치는 webapp 아래 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<script>
	 location.href = "${pageContext.request.contextPath}/payments/history.do";
	</script>

</body>
</html>




