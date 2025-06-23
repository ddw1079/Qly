<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 신청</title>

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<style>
body {
	background-color: #f9f9f9;
	font-size: 1.1rem;
}

.container {
	max-width: 1000px;
	margin-top: 50px;
}

.card {
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
}

.card-header {
	font-size: 1.5rem;
	font-weight: bold;
	background-color: #00d1b2;
	color: white;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

.card-body {
	padding: 30px;
}

label {
	font-weight: bold;
	margin-top: 10px;
}

.submit-btn {
	background-color: #00d1b2;
	color: white;
	font-size: 1.2rem;
	padding: 10px 30px;
	border: none;
	border-radius: 10px;
	margin-top: 20px;
}

#datepicker-inline {
	font-size: 0.85rem;
	max-width: 300px;
}
</style>

<script>
	$(function() {
		$("#selectedDate").datepicker({
			dateFormat : "yy-mm-dd",
			minDate : 0
		});
	});
</script>
</head>
<body>
	<%-- 	<p>디버깅: ${quest != null ? '퀘스트 있음' : 'quest가 null이야'}</p>
	<p>questId: ${quest.questId}</p>
	<p>title: ${quest.title}</p> --%>


	<div class="container">
		<h2 class="text-center mb-4">퀘스트 신청</h2>

		<c:if test="${not empty error}">
			<script>
				alert("${error}");
			</script>
		</c:if>


		<form action="${pageContext.request.contextPath}/quest/application.do"
			method="post">
			<%-- <input type="hidden" name="questId" value="${quest.questId}"> --%>
			<input type="hidden" name="questId" value="${quest.questId}">
			<div class="row">
				<!-- 왼쪽 카드: 퀘스트 정보 -->
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">제목</div>
						<div class="card-body">
							<p>${quest.title}</p>
							<hr>

							<%-- <c:if test="${not empty quest.photoPath}">
								<img src="${quest.photoPath}" alt="퀘스트 이미지"
									class="img-fluid mb-3" style="max-height: 300px;">
							</c:if>

							<label>해야 할 일</label>
							<ul>
								<c:forEach var="task" items="${quest.tasks}">
									<li>${task.description}</li>
								</c:forEach>
							</ul> --%>

							<c:if test="${not empty quest.photoPath}">
								<div class="text-center mb-3">
									<img src="${quest.photoPath}" alt="퀘스트 이미지" class="img-fluid"
										style="max-height: 300px;">
								</div>
							</c:if>
							<hr>
							<!-- 줄바꿈 효과 확실하게 유지 -->
							<div class="mt-3">
								<label>해야 할 일</label>
								<ul class="mb-3">
									<c:forEach var="task" items="${quest.tasks}">
										<li>${task.description}</li>
									</c:forEach>
								</ul>
							</div>


							<hr>
							<label>보상</label>
							<p class="text-primary fw-bold">${quest.rewardTokens}코인</p>
						</div>
					</div>
				</div>

				<!-- 오른쪽 카드: 신청 폼 -->
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">날짜 및 시간 선택</div>
						<div class="card-body">
							<label>날짜 선택</label> <input type="text" id="selectedDate"
								name="day" class="form-control mb-3" required> <label>주소</label>
							<input type="text" class="form-control mb-3"
								value="${quest.address}" readonly> <label>시간 선택</label>
							<select name="time" class="form-select mb-4" required>
								<option value="">-- 시간 선택 --</option>
								<c:forEach var="hour" begin="9" end="18">
									<option value="${hour < 10 ? '0' : ''}${hour}:00">
										${hour < 10 ? '0' : ''}${hour}:00</option>
								</c:forEach>
							</select>

							<div class="text-end">
								<button type="submit" class="submit-btn">퀘스트 신청</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
