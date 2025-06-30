<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ✅ Bootstrap 및 jQuery -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ 스타일 -->
<style>
.nav-container {
	width: 100%;
	background-color: #ffffff;
	border-bottom: 1px solid #d6ebe8;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.05);
	padding: 16px 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	position: sticky;
	top: 0;
	z-index: 1000;
}
.nav-inner {
	max-width: 1400px;
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.logo-area {
	position: relative;
	display: flex;
	align-items: center;
	gap: 10px;
	cursor: pointer;
	text-decoration: none;
}
.logo-circle-blur {
	width: 40px;
	height: 40px;
	background: #6be0d8;
	border-radius: 50%;
	filter: blur(10px);
	position: absolute;
	left: -20px;
	z-index: 0;
}
.logo-text {
	font-family: 'Poppins', sans-serif;
	font-weight: 800;
	font-size: 32px;
	color: #1e5e59;
	position: relative;
	z-index: 1;
	text-decoration: none;
}
.logo-text .ly {
	font-size: 18px;
	font-weight: 400;
	margin-left: 4px;
}
.nav-buttons {
	display: flex;
	gap: 14px;
	align-items: center;
}
.nav-buttons a,
.nav-buttons .dropdown-toggle,
.nav-buttons button {
	padding: 6px 16px;
	border: 2px solid #6bc1c1;
	border-radius: 30px;
	font-size: 15px;
	color: #1e5e59;
	text-decoration: none;
	background-color: #fff;
	transition: all 0.25s ease;
}
.nav-buttons a:hover,
.nav-buttons .dropdown-toggle:hover,
.nav-buttons button:hover {
	background-color: #e3f7f6;
	font-weight: 600;
}
.dropdown-menu {
	border-radius: 12px;
	border: 1px solid #6bc1c1;
	padding: 6px 0;
	min-width: 160px;
	text-align: center;
}
.dropdown-item {
	padding: 10px 16px;
	font-size: 15px;
	color: #1e5e59;
	border-radius: 8px;
	transition: background-color 0.2s ease;
}
.dropdown-item:hover {
	background-color: #e3f7f6;
	font-weight: 500;
}

/* ✅ 로그인 정보 및 버튼 스타일 */
.auth-buttons {
	display: flex;
	gap: 10px;
	align-items: center;
}
.auth-buttons .user-info {
	border: 2px solid #6bc1c1;
	border-radius: 30px;
	padding: 6px 16px;
	font-size: 14px;
	font-weight: 600;
	color: #00796b;
	background-color: #e0fdfa;
	white-space: nowrap;
}
.auth-buttons .btn {
	padding: 6px 16px;
	font-size: 14px;
	border-radius: 30px;
	background-color: #2c3e50;
	color: white;
	font-weight: 500;
	border: none;
}
.auth-buttons .btn:hover {
	background-color: #1a252f;
	font-weight: bold;
}
</style>

<!-- ✅ 네비게이션 바 -->
<div class="nav-container">
	<div class="nav-inner">
		<a href="<c:url value='/mainpage' />" class="logo-area">
			<div class="logo-circle-blur"></div>
			<div class="logo-text">
				<span class="q">Q</span><span class="ly">LY</span>
			</div>
		</a>

		<div class="nav-buttons">
			<!-- 소개 -->
			<div class="dropdown">
				<button class="btn dropdown-toggle" type="button" id="introDropdown"
					data-bs-toggle="dropdown" aria-expanded="false">소개</button>
				<ul class="dropdown-menu" aria-labelledby="introDropdown">
					<li><a class="dropdown-item" href="<c:url value='/template/qly_Introduction.jsp' />">플랫폼 소개</a></li>
					<li><a class="dropdown-item" href="<c:url value='/template/qly_Introduction2.jsp' />">팀 소개</a></li>
				</ul>
			</div>

			<!-- 퀘스트 -->
			<div class="dropdown">
				<a class="btn dropdown-toggle" href="javascript:void(0);" id="questDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">퀘스트</a>
				<ul class="dropdown-menu" aria-labelledby="questDropdown">
					<li><a class="dropdown-item" href="<c:url value='/quest/list.do' />">퀘스트 목록</a></li>
					<li><a class="dropdown-item" href="<c:url value='/quest/registerForm.do' />">퀘스트 등록</a></li>
				</ul>
			</div>

			<a href="<c:url value='/payments/history.do' />">코인</a>
			<a href="<c:url value='/inquiry/list.do' />">고객센터</a>
		</div>

		<!-- ✅ 로그인/회원/관리자 버튼 -->
		<div class="auth-buttons">
			<c:if test="${not empty loginUser}">
				<div class="user-info">
					${loginUser.username} 님 (${loginUser.userType} 모드)
				</div>
			</c:if>

			<c:choose>
				<c:when test="${empty loginUser}">
					<button class="btn"
						onclick="location.href='<c:url value="/login/loginForm" />'">로그인</button>
					<button class="btn"
						onclick="location.href='<c:url value="/qly_User.jsp?page=qly_User.jsp" />'">회원가입</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${loginUser.userType eq '관리자'}">
							<button class="btn"
								onclick="location.href='<c:url value="/admin/memberList.do" />'">관리자 페이지</button>
						</c:when>
						<c:otherwise>
							<button class="btn"
								onclick="location.href='<c:url value="/mypage/user.do" />'">마이페이지</button>
						</c:otherwise>
					</c:choose>
					<button class="btn"
						onclick="location.href='<c:url value="/login/logout.do" />'">로그아웃</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
