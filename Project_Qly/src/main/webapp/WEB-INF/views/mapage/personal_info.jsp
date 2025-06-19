<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CLINIK 스타일 개인정보 조회 -->
<div class="container py-4 px-5">

	<!-- 상단 제목 -->
	<div class="mb-4 d-flex justify-content-between align-items-center">
		<h3 class="fw-bold">개인정보 조회</h3>
	</div>

	<div class="row justify-content-center g-4">

		<!-- 👤 프로필 카드 -->
		<div class="col-md-4">
			<div class="card p-4 text-center shadow-sm border-0 rounded-4">
				<h5 class="mb-3">
					환영합니다, <strong>${user.username}</strong>님
				</h5>
				<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
					alt="프로필" class="rounded-circle mb-3" width="100" height="100">
				<button class="btn btn-primary w-100" disabled>${user.userType}
					의뢰인 모드</button>
			</div>
		</div>

		<!-- 📋 정보 카드 -->
		<div class="col-md-8">
			<div class="card p-4 shadow-sm border-0 rounded-4">
				<form>
					<div class="mb-4 row">
						<label class="col-sm-3 col-form-label fw-semibold">이름</label>
						<div class="col-sm-9">
							<input type="text" readonly class="form-control form-control-lg"
								value="${user.username}">
						</div>
					</div>

					<div class="mb-4 row">
						<label class="col-sm-3 col-form-label fw-semibold">전화번호</label>
						<div class="col-sm-9">
							<input type="text" readonly class="form-control form-control-lg"
								value="${user.phone}">
						</div>
					</div>

					<div class="mb-4 row">
						<label class="col-sm-3 col-form-label fw-semibold">주소</label>
						<div class="col-sm-9">
							<input type="text" readonly class="form-control form-control-lg"
								value="${user.address}">
						</div>
					</div>

					<div class="mb-2 row">
						<label class="col-sm-3 col-form-label fw-semibold">이메일</label>
						<div class="col-sm-9">
							<input type="email" readonly class="form-control form-control-lg"
								value="${user.email}">
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>

<!-- 추가 스타일 -->
<style>
body {
	background-color: #f1f3f6;
}

.card {
	background-color: #ffffff;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.06);
}
</style>
