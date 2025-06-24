<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해결사선택</title>

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


	<!-- 🔴 바깥 form 제거됨 -->
	<div class="container">
		<h2 class="text-center mb-4">해결사 선택</h2>

		<c:if test="${not empty error}">
			<script>
				alert("${error}");
			</script>
		</c:if>

		<div class="row">
			<!-- 왼쪽 카드: 퀘스트 정보 -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">제목</div>
					<div class="card-body">
						<p>${quest.title}</p>
						<hr>
						<c:if test="${not empty quest.photoPath}">
							<div class="text-center mb-3">
								<img src="${quest.photoPath}" alt="퀘스트 이미지" class="img-fluid"
									style="max-height: 300px;">
							</div>
						</c:if>

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

			<!-- 오른쪽 카드: 신청자 리스트 -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">신청자 목록</div>
					<div class="card-body">
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


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
