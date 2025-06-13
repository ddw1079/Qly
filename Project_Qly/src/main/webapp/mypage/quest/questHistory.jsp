<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 진행 상세</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<script>
	$(document).ready(function() {
		const $progressBar = $("#progressBar");
		const $progressText = $("#progressText");
		const $tasks = $("input[name='tasks']");
		const $rewardBtn = $("#rewardBtn");

		function updateProgress() {
			const total = $tasks.length;
			const checked = $tasks.filter(":checked").length;
			const percent = Math.floor((checked / total) * 100);

			$progressBar.css("width", percent + "%");
			$progressText.text("진행률: " + percent + "%");

			// 색상 변경
			if (percent === 100) {
				$progressBar.removeClass("bg-warning").addClass("bg-success");
				$rewardBtn.prop("disabled", false); // 보상 버튼 활성화
			} else {
				$progressBar.removeClass("bg-success").addClass("bg-warning");
				$rewardBtn.prop("disabled", true); // 미완료 시 비활성화
			}
		}

		$tasks.on("change", updateProgress);
		updateProgress(); // 초기화
		$("#rewardBtn").on("click", function(e) { // 보상지급 버튼 눌렀을때 나오는 알림창
			e.preventDefault(); // 실제 제출 방지
			if (confirm("보상을 지급하시겠습니까?")) {
				alert("보상이 지급되었습니다!");
			}
		});
	});
</script>

<style>
.map-placeholder {
	width: 100%;
	height: 120px;
	background-color: #e0e0e0;
	text-align: center;
	line-height: 120px;
	color: #888;
}
</style>
</head>
<body>
	<div class="container mt-4">
		<h2 class="mb-4 text-center">퀘스트 진행 사항</h2>
		<form action=".jsp" method="post">
			<div class="row">
				<!-- 왼쪽: 퀘스트 카드 -->
				<div class="col-md-7 mb-5">
					<div class="card shadow">
						<div class="card-header fw-bold fs-4">제목</div>
						<img src="cat.jpg" alt="고양이" class="card-img-top">
						<div class="card-body">

							<!-- 진행률 바 -->
							<div class="mb-3">
								<label class="form-label fw-bold">퀘스트 진행률</label>
								<div class="progress">
									<div id="progressBar" class="progress-bar bg-warning"
										role="progressbar" style="width: 0%;" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
								<small id="progressText" class="text-muted">진행률: 0%</small>
							</div>

							<!-- 해야 할 일 -->
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

						</div>
					</div>
				</div>

				<!-- 오른쪽: 위치 + 보상 -->
				<div class="col-md-5">
					<!-- 위치 카드 -->
					<div class="card mb-3">
						<div class="card-body">
							<h5 class="card-title">위치: 곰곰시 능농로 둠둠길</h5>
							<div class="map-placeholder">지도</div>
							<p class="mt-3" style="font-size: 0.9em;">
							    퀘스트 일정 : 2025-6-14 16:00 <br>
								퀘스트 종류: 사진업 / 견학활동 /
								물류 / 회수 / 테스트 업로드<br> 
								의뢰자: 🐻곰디 디디<br> 
								퀘스트 종류: 진행 중<br>
								<br>
							</p>
						</div>
					</div>

					<!-- 보상 카드 -->
					<div class="card">
						<div class="card-body text-center">
							<p class="mb-1">보상</p>
							<h5 class="text-primary">500 코인</h5>
							<button id="rewardBtn" class="btn btn-success mt-2" disabled>보상
								지급</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
