<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>로그인 페이지</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f0f0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-box {
	background-color: #EDF4FB;
	padding: 80px;
	border-radius: 12px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	width: 500px;
	border: 3px solid #333333;
}

.logo {
	display: flex;
	justify-content: center;
	margin-bottom: 25px;
}

.logo img {
	width: 400px;
	height: auto;
}

.login-box input[type="text"], .login-box input[type="password"],
	.login-box button {
	width: 100%;
	font-size: 1.2rem;
	padding: 18px;
	margin-bottom: 25px;
	border: 2px solid #333; /* stroke 추가 + 굵게 */
	border-radius: 6px;
	box-sizing: border-box;
}

.login-box input::placeholder {
	color: gray;
}

.login-box button {
	background-color: #00FA9A;
	color: black;
	font-weight: bold;
	cursor: pointer;
}

.login-box button:hover {
	background-color: #00e88e;
}

.signup-link {
	text-align: right;
	font-size: 1rem;
}

.signup-link a {
	color: gray;
	text-decoration: none;
	font-weight: bold;
}

.signup-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="login-box">
		<!-- 로고 영역 -->
		<div class="logo">
			<img class="w-100" src="https://i.postimg.cc/Dy7BstrB/logo2.png"
				alt="Qly 로고" width="250"><br> <br>
		</div>

		
		<form action="${pageContext.request.contextPath}/login/login.do" method="POST">
	 		<input type="text" name="username" placeholder="ID" required>
	 		<input type="password" name="password" placeholder="password" required>
	 		<button type="submit">로그인</button>
		</form>

		<div class="signup-link">
			
			<a href="${pageContext.request.contextPath}/qly_Uesr.jsp">회원가입</a>
		</div>
	</div>

</body>
</html>
