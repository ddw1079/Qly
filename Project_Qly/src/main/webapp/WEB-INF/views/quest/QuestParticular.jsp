<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/template/menubar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 신청</title>

<!-- ✅ Bootstrap & jQuery UI -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: linear-gradient(to bottom right, #eafffa, #ffffff);
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.1rem;
	margin-bottom: 100px;
}

.detail-hero-area {
	background: linear-gradient(to bottom, #eafffa, #ffffff);
	padding: 40px 0 20px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.hero-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
	max-width: 1200px;
	width: 100%;
	padding: 0 30px;
}

.hero-text {
	flex: 1;
	min-width: 300px;
	max-width: 600px;
}

.hero-text h2 {
	font-size: 2.4rem;
	font-weight: 800;
	color: #004d44;
	margin-bottom: 14px;
}

.hero-text p {
	color: #555;
	margin-bottom: 10px;
	font-size: 1.1rem;
}

.hero-image {
	flex: 1;
	min-width: 280px;
	text-align: center;
}

.hero-image img.hero-illustration {
	max-width: 100%;
	height: auto;
	opacity: 1;
	filter: none;
	image-rendering: auto;
}

/* 민트 그라데이션 텍스트 */
.mint-gradient-text {
	background: linear-gradient(to right, #02665b, #004d44, #002d29);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	font-weight: 800;
	font-size: 2.2rem;
	line-height: 1.4;
	margin-bottom: 10px;
}

/* Card 영역 */
.container {
	max-width: 1100px;
	margin: 50px auto;
}

.card {
	background-color: #ffffff;
	border: 2px solid #00c7ae; /* 선명한 민트 외곽선 */
	border-radius: 16px;
	box-shadow: 0 6px 16px rgba(0, 199, 174, 0.1); /* 민트톤 그림자 */
	transition: all 0.2s ease-in-out;
	padding: 20px;
	margin-bottom: 20px;
}

.card:hover {
	box-shadow: 0 10px 25px rgba(0, 199, 174, 0.15);
	transform: scale(1.015);
}

.card-header {
	background-color: #e0f9f6;
	color: #006d63;
	font-size: 1.2rem;
	font-weight: 700;
	border-bottom: 1px solid #cceae4;
	padding: 16px 20px;
	border-top-left-radius: 16px;
	border-top-right-radius: 16px;
}

.card-body {
	padding: 25px 30px;
}

label {
	font-weight: 600;
	margin-top: 12px;
	display: block;
	color: #333;
}

input.form-control, select.form-select {
	border-radius: 10px;
	border: 1.5px solid #ccc;
	box-shadow: none;
	padding: 10px;
	font-size: 1rem;
}

input#selectedDate {
	background-color: #fff;
}

.btn-mint {
	background-color: #00c7ae;
	color: #fff;
	font-size: 1.05rem;
	padding: 10px 26px;
	border: none;
	border-radius: 25px;
	transition: all 0.2s ease;
}

.btn-mint:hover {
	background-color: #00b39e;
	transform: scale(1.03);
}
</style>

<fmt:formatDate value="${quest.startDate}" pattern="yyyy-MM-dd"
	var="minDateStr" />
<fmt:formatDate value="${quest.endDate}" pattern="yyyy-MM-dd"
	var="maxDateStr" />

<script>
	$(function() {
		const minDate = new Date("${minDateStr}");
		const maxDate = new Date("${maxDateStr}");

		$("#selectedDate").datepicker({
			dateFormat : "yy-mm-dd",
			minDate : minDate,
			maxDate : maxDate,
			beforeShowDay : function(date) {
				return [ date >= minDate && date <= maxDate ];
			}
		});
	});
</script>
</head>

<body>

	<!-- Hero Section -->
	<div class="detail-hero-area">
		<div
			class="hero-inner d-flex justify-content-between align-items-center">
			<div class="hero-text">
				<h2 class="mint-gradient-text">퀘스트 상세 보기</h2>
				<p>도움이 필요한 퀘스트의 정보를 확인하고 신청해주세요.</p>
				<span class="text-muted d-block mb-2" style="font-size: 0.95rem;">※
					신청 후 일정은 변경이 어려울 수 있습니다.</span>
				<ul class="text-muted small">
					<li>신청 전 퀘스트 내용을 꼼꼼히 확인해 주세요.</li>
					<li>정해진 시간 외에는 신청이 제한될 수 있습니다.</li>
					<li>허위 신청 시 패널티가 부과될 수 있습니다.</li>
				</ul>
			</div>
			<div class="hero-image">
				<img
					src="https://i.postimg.cc/rsSm0k6s/9430573-4151160-Photoroom.png"
					alt="퀘스트 히어로 이미지" class="img-fluid hero-illustration blurred-image">
			</div>
		</div>
	</div>

	<!-- Main Form Section -->
	<div class="container">
		<c:if test="${not empty error}">
			<script>
				alert("${error}");
			</script>
		</c:if>

		<form action="${pageContext.request.contextPath}/quest/application.do"
			method="post">
			<input type="hidden" name="questId" value="${quest.questId}">
			<div class="row">
				<!-- Left: Quest Info -->
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">퀘스트 정보</div>
						<div class="card-body">
							<h5 class="fw-bold mb-3">${quest.title}</h5>
							<c:if test="${not empty quest.photoPath}">
								<div class="text-center mb-3">
									<img src="${quest.photoPath}" alt="퀘스트 이미지"
										class="img-fluid rounded" style="max-height: 280px;">
								</div>
							</c:if>
							<label>해야 할 일</label>
							<ul class="mb-3">
								<c:forEach var="task" items="${quest.tasks}">
									<li>${task.description}</li>
								</c:forEach>
							</ul>
							<label>보상</label>
							<p class="text-primary fw-bold">${quest.rewardTokens}코인</p>
						</div>
					</div>
				</div>

				<!-- Right: Application Form -->
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">신청 정보 입력</div>
						<div class="card-body">
							<label>날짜 선택</label> <input type="text" id="selectedDate"
								name="day" class="form-control mb-3" required readonly>

							<label>주소</label> <input type="text" class="form-control mb-3"
								value="${quest.address}" readonly> <label>시간 선택</label>
							<select name="time" class="form-select mb-4" required>
								<option value="">-- 시간 선택 --</option>
								<c:forEach var="hour" begin="9" end="18">
									<option value="${hour < 10 ? '0' : ''}${hour}:00">
										${hour < 10 ? '0' : ''}${hour}:00</option>
								</c:forEach>
							</select>

							<div class="text-end">
								<button type="submit" class="btn btn-mint">퀘스트 신청</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


</body>
</html>
