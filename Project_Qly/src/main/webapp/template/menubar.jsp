<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/template/coin_charge.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>메뉴바</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
/* 생략 없이 전체 유지 */
.user-panel {
	background-color: #f9fefc;
	padding: 12px 20px;
	border-bottom: 1px solid #dee2e6;
}

.coin-box-lg {
	padding: 10px 16px;
	border: 2px solid #41867e;
	background-color: white;
	color: #41867e;
	font-weight: bold;
	border-radius: 8px;
	font-size: 16px;
	white-space: nowrap;
}

.profile-pic {
	width: 65px;
	height: 65px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #41867e;
}

.menu-bar {
	display: flex;
	background-color: #6db1a9;
	margin: 0;
	padding: 0;
}

.menu-item {
	flex: 1;
	text-align: center;
	padding: 15px 0;
	font-weight: bold;
	font-size: 24px;
	color: white;
	cursor: pointer;
	transition: background-color 0.2s;
}

.menu-item:hover {
	background-color: #559e96;
}

.submenu-container {
	display: none;
	background-color: #fff;
	border-top: 1px solid #dee2e6;
	border-bottom: 1px solid #dee2e6;
	width: 100%;
	margin: 0;
	padding: 0;
}

.submenu-row {
	display: flex;
	margin: 0;
}

.submenu-cell {
	flex: 1;
	border-left: 1px solid #dee2e6;
	border-right: 1px solid #dee2e6;
	text-align: center;
	padding: 10px 0;
}

.submenu-cell a {
	display: block;
	color: #000;
	text-decoration: none;
	padding: 6px 0;
	font-weight: 500;
}

.submenu-cell a:hover {
	color: #007bff;
	text-decoration: underline;
}

.menu-wrapper:hover .submenu-container, .submenu-container:hover {
	display: block;
}

.container-fluid, .menu-wrapper, .menu-bar, .submenu-container {
	padding-left: 0 !important;
	padding-right: 0 !important;
	margin-left: 0 !important;
	margin-right: 0 !important;
}
</style>
</head>

<body>
	<%
	com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");

	/* int userid = loginUser.getUserId();*/
	// int userid = loginUser.getUserId();

	int userId = loginUser != null ? loginUser.getUserId() : 0;
	String userName = loginUser != null ? loginUser.getUsername() : "게스트";
	String userType = loginUser != null ? loginUser.getUserType() : "비회원";
	int userCoins = loginUser != null ? loginUser.getTotalTokens() : 0;
	%>

	<div class="container-fluid">
		<!-- 사용자 정보 -->
		<div class="row user-panel align-items-center justify-content-between">
			<div class="col-auto d-flex align-items-center mt-1">
				<a href="${pageContext.request.contextPath}/mainpage"> <img
					src="https://i.postimg.cc/yYVx9NTf/logo5.png" alt="QLY 로고"
					style="height: 120px;">
				</a>
			</div>

			<div
				class="col d-flex justify-content-end align-items-center gap-3 flex-wrap text-end mt-1">
				<!-- 프로필 아이콘 -->
				<c:choose>
					<c:when test="${loginUser.userType eq '관리자'}">
						<a href="<c:url value='/admin/memberList.do' />"> <img
							src="https://cdn-icons-png.flaticon.com/512/149/149071.png"
							width="100" alt="프로필" />
						</a>
					</c:when>
					<c:otherwise>
						<a
							href="<c:url value='/mypage/user?page=../contents/personal_info.jsp' />">
							<img src="https://cdn-icons-png.flaticon.com/512/149/149071.png"
							width="100" alt="프로필" />
						</a>
					</c:otherwise>
				</c:choose>

				<!-- 유저 정보 -->
				<div class="text-end me-3 d-flex flex-column align-items-end">
					<div class="fw-bold mb-2" style="font-size: 18px;">
						<%=userName%>
						<small>(<%=userType%>)
						</small>
					</div>
					<div class="d-flex align-items-center gap-2 mb-2">
						<div class="coin-box-lg">
							보유 코인: <strong><%=userCoins%></strong>
						</div>
						<button class="btn btn-sm text-white px-3 py-2"
							style="background-color: #40746e;"
							onclick="$('#chargeCoinModal').modal('show');">충전</button>
					</div>
					<c:if test="${not empty loginUser}">
						<div class="text-muted" style="font-size: 14px;">
							환영합니다,
							<%=userName%>님!
						</div>
					</c:if>
				</div>

				<!-- 버튼 영역 -->
				<div>
					<c:choose>
						<c:when test="${empty loginUser}">
							<button class="btn w-100 mt-1"
								style="background-color: #2c3e50; color: white; font-weight: bold; font-size: 14px; border-radius: 8px;"
								onclick="location.href='<c:url value="/login/loginForm" />'">로그인</button>
							<button class="btn w-100 mt-1"
								style="background-color: #2c3e50; color: white;"
								onclick="location.href='<c:url value="/qly_User.jsp?page=qly_User.jsp" />'">회원가입</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${loginUser.userType eq '관리자'}">
									<button class="btn w-100 mt-1"
										style="background-color: #2c3e50; color: white;"
										onclick="location.href='<c:url value="/admin/memberList.do" />'">관리자
										페이지</button>
								</c:when>
								<c:otherwise>
									<button class="btn w-100 mt-1"
										style="background-color: #2c3e50; color: white;"
										onclick="location.href='<c:url value="/mypage/user.do" />'">마이페이지</button>

								</c:otherwise>
							</c:choose>
							<button class="btn w-100 mt-1"
								style="background-color: #2c3e50; color: white; font-weight: bold; font-size: 14px; border-radius: 8px;"
								onclick="location.href='<c:url value="/login/logout.do" />'">로그아웃</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<!-- 메뉴바 및 서브메뉴 -->
		<div class="menu-wrapper">
			<div class="menu-bar">
				<div class="menu-item">QLY소개</div>
				<div class="menu-item">퀘스트</div>
				<c:if test="${not empty loginUser}">
					<div class="menu-item">코인충전소</div>
				</c:if>
				<div class="menu-item">고객센터</div>
			</div>

			<div class="submenu-container">
				<div class="submenu-row">
					<div class="submenu-cell">
						<a href="<c:url value='/template/qly_Introduction.jsp' />">QLY란?</a>
						<a href="<c:url value='/template/qly_Introduction2.jsp' />">회사
							소개</a>
					</div>
					<div class="submenu-cell">
						<a href="<c:url value='/quest/list.do' />">퀘스트 목록</a>
						<c:if test="${loginUser.userType eq '의뢰인'}">
							<a href="<c:url value='/quest/registerForm.do' />">퀘스트 등록</a>
						</c:if>
						<c:if test="${loginUser.userType eq '해결사'}">
							<a href="<c:url value='/quest/particularForm.do' />">퀘스트 수행하기</a>
						</c:if>
					</div>
					<c:if test="${not empty loginUser}">
						<div class="submenu-cell">
							<a href="<c:url value='/payments/history.do' />">거래내역 확인</a>
							<a href="#" onclick="$('#chargeCoinModal').modal('show'); return false;">코인 충전</a>
						</div>
					</c:if>
					<div class="submenu-cell">
						<a href="<c:url value='/inquiry/form' />">문의사항</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
