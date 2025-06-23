<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보 수정</title>

<!-- Bootstrap & 스타일 통일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background-color: #f1f2f6;
	font-family: 'Segoe UI', sans-serif;
	margin: 0;
	padding: 0;
}

.card {
	border-radius: 0.75rem;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
}

label {
	font-weight: 500;
}

h3 {
	font-weight: bold;
}

.section-title {
	display: inline-block;
	background-color: #e0f7f5;
	color: #2c5d56;
	font-weight: 600;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 15px;
}
</style>
</head>

<body>

<%-- 세션에서 로그인 유저 객체 가져오기 --%>
<%
	com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");
%>

<div class="container-fluid mt-4">
	<!-- 상단 -->
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h4 class="fw-bold">개인정보 수정</h4>
		<div class="d-flex align-items-center gap-3">
			<span class="fw-semibold"><%= loginUser != null ? loginUser.getUsername() : "게스트" %>님
				(<%= loginUser != null ? loginUser.getUserType() : "비회원" %> 모드)
			</span>
			<button class="btn btn-dark btn-sm" onclick="location.href='/login/logout.do'">로그아웃</button>
			<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
				alt="프로필" width="40" style="border-radius: 50%;">
		</div>
	</div>

	<!-- 프로필 + 수정 폼 -->
	<div class="row gx-4 mb-4 justify-content-center">
		<!-- 왼쪽 프로필 -->
		<div class="col-md-4">
			<div class="card p-4 h-100 d-flex flex-column align-items-center justify-content-center" style="min-height: 480px;">
				<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
					class="rounded-circle mb-3" width="140" height="140" alt="프로필 이미지">
				<h5 class="fw-bold"><%= loginUser != null ? loginUser.getUsername() : "" %></h5>
				<p class="text-muted"><%= loginUser != null ? loginUser.getUserType() : "" %> 모드</p>
				<form method="post" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/uploadProfileImage" class="w-100 px-3">
					<input type="file" name="profileImage" class="form-control mb-2" />
					<button type="submit" class="btn text-white w-100" style="background-color: #6db1a9;">사진 업로드</button>
				</form>
			</div>
		</div>

		<!-- 오른쪽 정보 수정 -->
		<div class="col-md-8">
			<div class="card p-4 h-100" style="min-height: 480px;">
				<div class="mb-3 text-start">
					<span class="section-title">개인정보 수정</span>
				</div>
				<form method="post" action="${pageContext.request.contextPath}/mypage/updatePersonalInfo">
					<input type="hidden" name="userId" value="<%= loginUser != null ? loginUser.getUserId() : "" %>"/>
					<div class="mb-3">
						<label for="username" class="form-label">이름</label>
						<input type="text" class="form-control form-control-lg" id="username" name="username" required value="<%= loginUser != null ? loginUser.getUsername() : "" %>">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">이메일</label>
						<input type="email" class="form-control form-control-lg" id="email" name="email" required value="<%= loginUser != null ? loginUser.getEmail() : "" %>">
					</div>
					<div class="mb-3">
						<label for="phone" class="form-label">전화번호</label>
						<input type="tel" class="form-control form-control-lg" id="phone" name="phone" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" value="<%= loginUser != null ? loginUser.getPhone() : "" %>">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">새 비밀번호</label>
						<input type="password" class="form-control form-control-lg" id="password" name="password" autocomplete="new-password">
					</div>
					<div class="mb-3">
						<label for="confirm_password" class="form-label">비밀번호 확인</label>
						<input type="password" class="form-control form-control-lg" id="confirm_password" name="confirm_password" autocomplete="new-password">
					</div>
					<div class="text-end">
						<button type="submit" class="btn text-white" style="background-color: #6db1a9;">저장</button>
						<button type="button" class="btn btn-secondary px-4 ms-2" onclick="history.back();">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>
