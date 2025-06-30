<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 좌측 고정 사이드바 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>해결사 선택</title>

<!-- Bootstrap & jQuery -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f6f9f8;
	margin: 0;
	color: #333;
}

.main-layout {
	display: flex;
}

.content-area {
	flex-grow: 1;
	padding: 60px 50px;
}

.page-title {
	font-size: 26px;
	font-weight: 700;
	margin-bottom: 30px;
	color: #004d43;
}

.quest-card {
	background: #ffffff;
	border-radius: 20px;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.06);
	padding: 30px 28px;
	margin-bottom: 40px;
}

.quest-header {
	font-size: 20px;
	font-weight: 600;
	color: #00b09b;
	margin-bottom: 10px;
}

.quest-section {
	margin-bottom: 20px;
}

.quest-section label {
	font-weight: 600;
	color: #00796b;
	margin-bottom: 5px;
	display: block;
}

.quest-image {
	max-height: 250px;
	border-radius: 10px;
	margin: 10px 0;
}

.list-group-item {
	border: none;
	border-bottom: 1px solid #eaeaea;
}

.form-check-label strong {
	font-size: 16px;
	color: #004d43;
}

.submit-btn {
	background-color: #00b09b;
	color: #fff;
	padding: 10px 25px;
	font-size: 16px;
	border: none;
	border-radius: 12px;
	transition: background-color 0.2s ease;
}

.submit-btn:hover {
	background-color: #009688;
}

.text-muted {
	color: #888 !important;
}
</style>
</head>

<body>
	<div class="main-layout">
		<!-- 사이드바는 include로 포함됨 -->

		<div class="content-area">
			<h2 class="page-title">해결사 선택</h2>

			<c:if test="${not empty error}">
				<script>
					alert("${error}");
				</script>
			</c:if>

			<div class="row">
				<!-- 왼쪽: 퀘스트 정보 -->
				<div class="col-md-6">
					<div class="quest-card">
						<div class="quest-header">퀘스트 정보</div>
						<div class="quest-section">
							<label>제목</label>
							<p>${quest.title}</p>
						</div>

						<c:if test="${not empty quest.photoPath}">
							<div class="quest-section text-center">
								<img src="${quest.photoPath}" alt="퀘스트 이미지"
									class="img-fluid quest-image">
							</div>
						</c:if>

						<div class="quest-section">
							<label>해야 할 일</label>
							<ul>
								<c:forEach var="task" items="${quest.tasks}">
									<li>${task.description}</li>
								</c:forEach>
							</ul>
						</div>

						<div class="quest-section">
							<label>보상</label>
							<p class="text-primary fw-bold">${quest.rewardTokens}코인</p>
						</div>
					</div>
				</div>

				<!-- 오른쪽: 신청자 목록 -->
				<div class="col-md-6">
					<div class="quest-card">
						<div class="quest-header">신청자 목록</div>
						<div class="quest-section">
							<c:choose>
								<c:when test="${empty applicants}">
									<p class="text-muted">아직 신청한 사람이 없습니다.</p>
								</c:when>
								<c:otherwise>
									<form method="post"
										action="${pageContext.request.contextPath}/quest/assignSolver.do">
										<input type="hidden" name="questId" value="${quest.questId}" />
										<ul class="list-group">
											<c:forEach var="a" items="${applicants}">
												<li class="list-group-item">
													<div class="form-check">
														<input class="form-check-input" type="radio" name="userId"
															value="${a.userId}" id="user${a.userId}" /> <label
															class="form-check-label" for="user${a.userId}"> <strong>${a.username}</strong><br>
															신청일: <fmt:formatDate value="${a.appliedAt}"
																pattern="yyyy-MM-dd HH:mm" /><br> 주소: ${a.address}
															/ 장소: ${a.location}
														</label>
													</div>
												</li>
											</c:forEach>
										</ul>
										<div class="text-end mt-4">
											<button type="submit" class="submit-btn">해결사 선택</button>
										</div>
									</form>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
