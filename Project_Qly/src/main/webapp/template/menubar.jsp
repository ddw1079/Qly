<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:include page="/template/coin_charge.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>메인페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap JS CDN (optional) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- DataTables CSS & JS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<style>
.menu-box {
	background-color: #198754;
	color: white;
	text-align: center;
	padding: 15px 0;
	font-weight: bold;
	text-decoration: none;
	display: block;
	cursor: pointer;
	transition: background-color 0.2s;
}

.menu-box:hover {
	background-color: #146c43;
	color: white;
}

.submenu-row {
	display: none;
	background-color: white;
}

.submenu-cell {
	padding: 10px;
	border: 1px solid #dee2e6;
}

.submenu-cell a {
	display: block;
	text-align: center;
	color: #000000;
	text-decoration: none;
	font-weight: 500;
	padding: 5px 0;
}

.submenu-cell a:hover {
	color: #007bff;
	text-decoration: underline;
}

.user-panel {
	background-color: #e8f9f7;
	padding: 8px 10px; /* 기존 15px → 8px, 좌우 10px로 */
	border-bottom: 1px solid #dee2e6;
}

.user-name {
	font-weight: bold;
	font-size: 15px; /* 기존 18px → 15px */
}

.coin-info {
	display: flex;
	align-items: center;
	gap: 10px; /* 보유 코인 박스와 충전 버튼 박스 사이 간격 */
}

.coin-box {
	padding: 5px 10px;
	border: 2px solid black;
	background-color: white;
	color: black;
	font-weight: bold;
	border-radius: 4px;
	user-select: none;
}

.profile-pic {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #198754;
}

.btn-sm {
	padding: 3px 6px; /* 5px 10px → 3px 6px */
	font-size: 12px; /* 14px → 12px */
}
</style>
</head>
<body>

	<%
	// 예시용 변수, 실제로는 세션이나 DB에서 받아오세요.
	String userName = "홍길동";
	String userRole = "의뢰인";
	int userCoins = 1250;
	%>

	<div class="container-fluid">
		<!-- 🔼 사용자 정보 패널 -->
		<div class="row user-panel align-items-center">
			<!-- 로고: 왼쪽 -->
			<div class="col-auto">
				<img src="https://via.placeholder.com/100x30?text=LOGO" alt="로고"
					class="img-fluid">
			</div>

			<!-- 사용자 정보: 오른쪽 -->
			<div
				class="col d-flex justify-content-end align-items-center flex-wrap text-end">
				<div class="me-3">
					<div class="user-name">
						<%=userName%>
						<small>(<%=userRole%>)
						</small>
					</div>
					<div class="coin-info">
						<div class="coin-box">
							보유 코인: <strong><%=userCoins%></strong>
						</div>
						<!-- <button type="button" class="charge-btn-box btn-sm"
							onclick="location.href='coin_charge.jsp'">충전</button> -->
						<div class="col-lg d-flex align-items-center">
							<button class="btn btn-success w-100"
								onclick="$('#chargeCoinModal').modal('show');">충전</button>
						</div>
					</div>
					<div class="mt-2">
						<button class="btn btn-outline-secondary btn-sm"
							style="background-color: black; color: white; font-size: 16px; padding: 8px 16px; border-radius: 5px;">로그아웃</button>
						<button class="btn btn-outline-primary btn-sm"
							style="background-color: black; color: white; font-size: 16px; padding: 8px 16px; border-radius: 5px;">회원가입</button>
					</div>

				</div>
				<a href="#"> <img
					src="https://via.placeholder.com/60x60.png?text=🙂" alt="프로필"
					class="profile-pic">
				</a>

			</div>
		</div>


		<!-- 🔽 상단 메뉴 -->
		<div class="row">
			<div class="col-3 p-0">
				<div class="menu-box" onclick="toggleSubmenus()">QLY소개</div>
			</div>
			<div class="col-3 p-0">
				<div class="menu-box" onclick="toggleSubmenus()">퀘스트</div>
			</div>
			<div class="col-3 p-0">
				<div class="menu-box" onclick="toggleSubmenus()">코인충전소</div>
			</div>
			<div class="col-3 p-0">
				<div class="menu-box" onclick="toggleSubmenus()">고객센터</div>
			</div>
		</div>

		<!-- 🔽 서브메뉴 -->
		<div class="row submenu-row" id="submenuRow">
			<div class="col-3 submenu-cell">
				<a href="#">QLY란?</a> <a href="#">회사 소개</a>
			</div>
			<div class="col-3 submenu-cell">
				<a href="#">퀘스트 등록</a> <a href="#">퀘스트 신청</a> <a href="#">퀘스트 목록</a>
			</div>
			<div class="col-3 submenu-cell">
				<a href="#">QUBIT 충전</a> <a href="#">QUBIT 환급</a> <a href="#">거래내역
					확인</a>
			</div>
			<div class="col-3 submenu-cell">
				<a href="#">문의사항</a>
			</div>
		</div>
	</div>

	<script>
		function toggleSubmenus() {
			const submenuRow = document.getElementById("submenuRow");
			submenuRow.style.display = submenuRow.style.display === "flex" ? "none"
					: "flex";
		}
	</script>

</body>
</html>
