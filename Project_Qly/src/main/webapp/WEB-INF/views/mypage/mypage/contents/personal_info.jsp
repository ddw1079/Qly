<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인 정보</title>

<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background-color: #f1f2f6;
	font-family: 'Segoe UI', sans-serif;
}

.card {
	border-radius: 0.75rem;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
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

.center-flex {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
}
</style>
</head>
<%
com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");
%>

<div class="container-fluid mt-4">
	<!-- 상단 -->
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h4 class="fw-bold">퀘스트 목록</h4>
		<div class="d-flex align-items-center gap-3">
			<span class="fw-semibold"> <%=loginUser != null ? loginUser.getUsername() : "게스트"%>님
				(<%=loginUser != null ? loginUser.getUserType() : "비회원"%> 모드)
			</span>
			<button class="btn btn-dark btn-sm"
				onclick="location.href='/login/logout.do'">로그아웃</button>
			<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
				alt="프로필" width="40" style="border-radius: 50%;">
		</div>
	</div>

	<div class="container-fluid px-5">
		<!-- 1행 -->
		<div class="row gx-4 mb-4">
			<div class="col-md-4">
				<div class="card p-4 h-100 center-flex">
					<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
						class="rounded-circle mb-3" width="140" height="140" alt="프로필 이미지">
					<h5 class="fw-bold">홍길동</h5>
					<p class="text-muted">의뢰인 모드</p>
					<form method="post" enctype="multipart/form-data"
						action="/uploadProfileImage" class="w-100 px-3">
						<input type="file" name="profileImage" class="form-control mb-2" />
						<button type="submit" class="btn text-white w-100"
							style="background-color: #6db1a9;">사진 업로드</button>

					</form>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card p-4 h-100">
					<div class="mb-3 text-start">
						<span class="section-title">개인정보 조회</span>
					</div>
					<form>
						<div class="mb-3 row">
							<label class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" readonly
									value="${sessionScope.loginUser.username}">
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-2 col-form-label">전화번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" readonly
									value="${sessionScope.loginUser.phone}">
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" readonly
									value="${sessionScope.loginUser.address}">
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" readonly
									value="${sessionScope.loginUser.email}">
							</div>
						</div>
				</div>
			</div>
		</div>

		<!-- 2행 -->
		<div class="row gx-4 mb-4">
			<div class="col-md-4">
				<div class="card p-4 h-100">
					<div class="mb-3 text-start">
						<span class="section-title">최근 알림</span>
					</div>
					<ul class="list-unstyled">
						<li class="mb-2"><span class="badge bg-info me-2">공지</span>
							시스템 점검이 6월 21일 02:00에 예정되어 있습니다.</li>
						<li class="mb-2"><span
							class="badge bg-warning text-dark me-2">보안</span> 비밀번호를 최근 3개월 동안
							변경하지 않았습니다.</li>
						<li><span class="badge bg-success me-2">알림</span> 새로운 퀘스트가
							등록되었습니다!</li>
					</ul>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card p-4 h-100">
					<div class="mb-3 text-start">
						<span class="section-title">나의 활동 요약</span>
					</div>
					<div class="row g-3">
						<div class="col-md-4">
							<div
								class="p-3 bg-light border-start border-5 border-primary rounded shadow-sm">
								<div class="fw-bold text-primary">5건</div>
								<small class="text-muted">참여한 퀘스트</small>
							</div>
						</div>
						<div class="col-md-4">
							<div
								class="p-3 bg-light border-start border-5 border-success rounded shadow-sm">
								<div class="fw-bold text-success">120 QUBIT</div>
								<small class="text-muted">보유 코인</small>
							</div>
						</div>
						<div class="col-md-4">
							<div
								class="p-3 bg-light border-start border-5 border-dark rounded shadow-sm">
								<div class="fw-bold text-dark">2025-06-20</div>
								<small class="text-muted">최근 접속일</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 3행 -->
		<div class="row gx-4 mb-4">
			<div class="col-md-4">
				<div class="card p-4 h-100 center-flex">
					<div class="mb-3 text-start">
						<span class="section-title">진행 목표</span>
					</div>
					<svg width="100" height="100" class="mb-2">
          <circle cx="50" cy="50" r="45" stroke="#e0e0e0"
							stroke-width="10" fill="none" />
          <circle cx="50" cy="50" r="45" stroke="#6db1a9"
							stroke-width="10" stroke-dasharray="282" stroke-dashoffset="212"
							fill="none" stroke-linecap="round" transform="rotate(-90 50 50)" />
          <text x="50%" y="50%" text-anchor="middle" dy=".3em"
							class="fs-6 fw-bold text-dark">25%</text>
        </svg>
					<div class="text-muted small">
						목표 완료까지<br> <strong>2시간 30분</strong> 남음
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card p-4 h-100">
					<div class="mb-3 text-start">
						<span class="section-title">오늘의 일정</span>
					</div>
					<div class="d-flex flex-column gap-3">
						<div class="border-start border-5 ps-3 border-primary">
							<div class="fw-semibold">
								08:00 - 09:00 <span class="badge bg-primary ms-2">퀘스트 수행</span>
							</div>
							<div class="text-muted">길고양이 급식소 정리하기</div>
						</div>
						<div class="border-start border-5 ps-3 border-success">
							<div class="fw-semibold">
								10:00 - 11:30 <span class="badge bg-success ms-2">의뢰 응답</span>
							</div>
							<div class="text-muted">의뢰인 요청 검토</div>
						</div>
						<div class="border-start border-5 ps-3 border-warning">
							<div class="fw-semibold">
								14:00 - 15:00 <span class="badge bg-warning text-dark ms-2">개인
									일정</span>
							</div>
							<div class="text-muted">운동 및 정리시간</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>
