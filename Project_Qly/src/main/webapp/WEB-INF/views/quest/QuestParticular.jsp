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

<!-- jQuery UI (달력용) -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<style>
body {
	background-color: #f0f0f0;
	font-size: 1.2rem;
}

.container {
	max-width: 1100px;
}

.card-title, .form-label {
	font-size: 1.4rem;
}

.form-control, .form-select {
	font-size: 1.2rem;
	padding: 0.8rem;
}

.submit-btn {
	font-size: 1.3rem;
	padding: 0.8rem 1.6rem;
}

h2 {
	font-weight: bold;
}

#datepicker-inline {
	font-size: 0.85rem;
	max-width: 300px;
}

#datepicker-inline .ui-datepicker {
	width: 100%;
}
</style>

<script>
	$(function() {
		$("#datepicker-inline").datepicker({
			dateFormat : "yy-mm-dd",
			minDate : 0,
			onSelect : function(dateText) {
				$("#selectedDate").val(dateText);
			}
		});
	});
</script>
</head>
<body>

	<div class="container my-5">
		<h2 class="mb-4 text-center">퀘스트 신청</h2>

		<form action=".jsp" method="post">
			<div class="row">
				<!-- 왼쪽: 퀘스트 정보 -->
				<div class="col-md-8 mb-4">
					<div class="card shadow">
						<div class="card-header fw-bold fs-4">제목</div>
						<img src="cat.jpg" alt="고양이" class="card-img-top">
						<div class="card-body">
							<p class="card-text fs-5">고양이 번지점프시키기!!! 고양이 번지점프시키기!!! ...</p>

							<!-- 여기에 해야 할 일 체크박스 리스트 추가 -->
							<%-- <div class="mb-3">
								<label class="form-label fw-bold">해야 할 일</label>
								<div>
									<c:forEach var="task" items="${questRequestContents}"
										varStatus="status">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="tasks"
												id="task_${status.index}" value="${task}">
											<label class="form-check-label" for="task_${status.index}">${task}</label>
										</div>
									</c:forEach>
								</div>
							</div> --%>

							<div class="mb-3">
								<label class="form-label fw-bold">해야 할 일</label>
								<div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="task1"
											name="tasks" value="청소하기">
										<label class="form-check-label" for="task1">청소하기</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="task2"
											name="tasks" value="밥 주기">
										<label class="form-check-label" for="task2">밥 주기</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="task3"
											name="tasks" value="산책시키기">
										<label class="form-check-label" for="task3">산책시키기</label>
									</div>
								</div>
							</div>


							<hr>

							<h5 class="card-title">가격</h5>
							<p class="card-text fw-bold fs-4 text-primary">500 코인</p>
						</div>
					</div>
				</div>


				<!-- 오른쪽: 날짜, 시간 선택 -->
				<div class="col-md-4">
					<div class="card shadow h-100">
						<div class="card-body d-flex flex-column justify-content-between">
							<div class="mb-4">
								<label class="form-label p-2 d-inline-block rounded"
									style="background-color: #00FA9A;">날짜 선택</label>

								<!-- 인라인 달력 표시용 -->
								<div id="datepicker-inline"></div>
								<!-- 선택된 날짜를 서버로 전달하기 위한 숨겨진 input -->
								<input type="hidden" name="day" id="selectedDate" required>
							</div>

							<!-- ⭐️ 주소 표시 (DB에서 받아온 값 보여줌) -->
							<div class="mb-4">
								<label class="form-label">주소</label>
								<div class="border p-3 bg-white rounded">서울시 종로구</div>
								<input type="hidden" name="address" value="${quest.address}">
							</div>

							<div class="mb-4">
								<label class="form-label">시간 선택</label>
								<select class="form-select" name="time" required>
									<option value="">-- 시간 선택 --</option>
									<option value="09:00">09:00</option>
									<option value="10:00">10:00</option>
									<option value="11:00">11:00</option>
									<option value="12:00">12:00</option>
									<option value="13:00">13:00</option>
									<option value="14:00">14:00</option>
									<option value="15:00">15:00</option>
									<option value="16:00">16:00</option>
									<option value="17:00">17:00</option>
									<option value="18:00">18:00</option>
								</select>
							</div>
							<div class="text-end mt-auto">
								<button type="submit" class="btn submit-btn"
									style="background-color: #00FA9A; border-color: #00FA9A; color: black;">
									퀘스트 신청</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
