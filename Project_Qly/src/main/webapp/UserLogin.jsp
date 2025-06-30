<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QLY 로그인</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	height: 100vh;
	background: linear-gradient(135deg, #f8fefc, #d2f9f3);
	/* 밝은 화이트+민트 그라데이션 */
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}
/* 카드 스타일 (화이트 + 민트 테두리 + 블러 유지) */
.login-box {
	backdrop-filter: blur(20px);
	background: rgba(255, 255, 255, 0.35); /* 반투명 화이트 */
	border: 2px solid #5bd6c7;
	border-radius: 20px;
	box-shadow: 0 12px 28px rgba(0, 0, 0, 0.1);
	padding: 60px 40px;
	width: 420px;
	text-align: center;
	transition: all 0.3s ease-in-out;
}
/* 로고 */
.logo {
	margin-bottom: 30px;
}

.logo img {
	width: 220px;
}

/* 제목 */
.login-box h2 {
	font-size: 28px;
	margin-bottom: 30px;
	color: #104b47;
	font-weight: 700;
}

/* 인풋 */
.login-box input[type="text"], .login-box input[type="password"] {
	width: 100%;
	padding: 14px;
	margin-bottom: 20px;
	border: 1.5px solid #5bd6c7;
	border-radius: 10px;
	background-color: rgba(255, 255, 255, 0.85);
	box-sizing: border-box;
	font-size: 15px;
	color: #333;
}

.login-box input::placeholder {
	color: #aaa;
}

/* 버튼 */
.login-box button {
	width: 100%;
	padding: 14px;
	border: none;
	border-radius: 10px;
	background: linear-gradient(to right, #5de6c7, #42c7b1);
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease;
}

.login-box button:hover {
	background: linear-gradient(to right, #4bd2b5, #34b7a2);
}

/* 회원가입 링크 */
.signup-link {
	margin-top: 20px;
	font-size: 14px;
	color: #333;
}

.signup-link a {
	color: #20b59e;
	font-weight: bold;
	text-decoration: none;
}

.signup-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="login-box">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/mainpage"> <img
				src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="QLY 로고">
			</a>
		</div>

		<h2>Sign in</h2>

		<form action="${pageContext.request.contextPath}/login/login.do"
			method="POST">
			<input type="text" name="username" placeholder="User Name" required>
			<input type="password" name="password" placeholder="Password"
				required>
			<button type="submit">Sign in</button>
		</form>

		<div class="signup-link">
			계정이 없으신가요? <a href="${pageContext.request.contextPath}/qly_User.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>
