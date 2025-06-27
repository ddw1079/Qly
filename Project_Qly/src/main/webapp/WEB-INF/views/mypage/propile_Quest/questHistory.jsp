<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴스트 히스토리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffded417f5d8a057e299cf7acb7c310a&autoload=false&libraries=services"></script>

<style>
body {
	margin: 0;
	padding: 0;
	background: linear-gradient(135deg, #e3fdfd, #ffe6fa);
	font-family: 'Malgun Gothic', sans-serif;
	min-height: 100vh;
}

.section-container {
	display: flex;
	align-items: flex-start;
	gap: 16px;
	margin-bottom: 40px;
	padding-left: 20px;
	position: relative;
}

.section-container::before {
	content: "";
	width: 5px;
	height: 100%;
	background-color: #28c2a0; /* 민트색 세로선 */
	border-radius: 10px;
	position: absolute;
	left: 0;
	top: 0;
}

.section-title {
	text-align: left;
}

.section-title h3 {
	color: #004d43;
	font-weight: 900;
	font-size: 1.8rem;
	margin-bottom: 6px;
}

.section-title .subtitle {
	color: #00796b;
	font-size: 0.95rem;
	margin-bottom: 0;
}

.underline-bar {
	width: 60px;
	height: 4px;
	background-color: #28c2a0;
	border-radius: 10px;
	margin-left: 12px; /* 왼쪽 정렬 맞추기 */
}

.title {
	color: #004d43;
	font-weight: 900;
	margin-bottom: 40px;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	gap: 40px;
	justify-content: center;
}

.card {
	flex: 1 1 calc(33% - 32px);
	max-width: 400px;
	border-radius: 20px;
	background-color: #ffffff;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
	border: none;
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.card-header {
	background-color: #e0f7fa;
	color: #004d43;
	font-weight: bold;
	font-size: 1.25rem;
	padding: 16px 24px;
}

.card-body {
	padding: 24px;
	flex-grow: 1;
}

.map-placeholder {
	width: 100%;
	height: 300px;
	background-color: #e6f4f2;
	text-align: center;
	line-height: 100px;
	color: #00796b;
	font-weight: bold;
	border-radius: 12px;
	border: 2px dashed #00bfa5;
}

.checklist-title {
	color: #28c2a0;
	font-weight: bold;
	margin-top: 15px;
}

.coin-label {
	font-size: 1.1rem;
	font-weight: bold;
	color: #00897b;
}

.form-check-label {
	color: #004d43;
	font-weight: 500;
}

.btn-success {
	background-color: #28c2a0;
	border-color: #28c2a0;
	border-radius: 30px;
	font-weight: bold;
}

.btn-success:hover {
	background-color: #1ba891;
	border-color: #1ba891;
}

.btn-secondary {
	border-radius: 30px;
	font-weight: bold;
}

.progress {
	height: 20px;
	border-radius: 10px;
	background-color: #d0ece9;
}

.progress-bar {
	transition: width 0.6s ease;
	background-color: #28c2a0;
}

.content-wrapper {
	padding: 40px;
}
</style>
</head>

<body>
	<div class="container-fluid px-0">
		<div class="content-wrapper">

			<div class="section-container">
				<div class="section-title">
					<h3>나의 퀘스트 히스토리</h3>
					<p class="subtitle">완료한 퀘스트와 진행 현황을 확인하세요</p>
				</div>
			</div>
			<c:if test="${not empty msg}">
				<script>alert("${msg}");</script>
			</c:if>

			<div class="card-container">
				<c:forEach var="q" items="${questlist}">
					<div class="card">
						<div class="card-header">${q.title}</div>

						<c:if test="${not empty q.photoPath}">
							<img src="${q.photoPath}"
								style="width: 100%; height: auto; object-fit: cover; border-radius: 12px;"
								alt="이미지">
						</c:if>

						<div class="card-body">
							<p class="mb-2">${q.content}</p>
							<form
								action="${pageContext.request.contextPath}/mypage/insertcheck.do"
								method="post">
								<input type="hidden" name="questId" value="${q.questId}" />
								<c:set var="tasks" value="${taskMap[q.questId]}" />
								<c:set var="total" value="${fn:length(tasks)}" />
								<c:set var="checked" value="0" />
								<c:forEach var="t" items="${tasks}">
									<c:if test="${t.isChecked eq '1'}">
										<c:set var="checked" value="${checked + 1}" />
									</c:if>
								</c:forEach>
								<c:set var="percent"
									value="${total > 0 ? (checked * 100 / total) : 0}" />

								<div class="progress mb-2">
									<div id="progress-bar-${q.questId}" class="progress-bar"
										style="width: ${percent}%;"></div>
								</div>
								<p id="progress-text-${q.questId}" class="text-muted mb-3">진행률:
									${percent}%</p>

								<div class="mb-3">
									<p class="checklist-title">체크리스트</p>
									<c:forEach var="t" items="${tasks}" varStatus="loop">
										<div class="form-check">
											<input class="form-check-input task task-${q.questId}"
												type="checkbox" id="task${q.questId}_${loop.index}"
												name="checkedTasks" value="${t.taskId}"
												${t.isChecked eq '1' ? 'checked' : ''}
												${q.status eq '완료' ? 'disabled' : ''} /> <label
												class="form-check-label"
												for="task${q.questId}_${loop.index}">${t.description}</label>
										</div>
									</c:forEach>
								</div>

								<div class="d-flex justify-content-between align-items-center">
									<p class="coin-label mb-0">획득 코인: ${q.rewardTokens} Qubit</p>
									<button type="submit" id="coin-btn-${q.questId}"
										class="btn ${q.status eq '완료' ? 'btn-secondary' : 'btn-success'} btn-sm"
										${percent ne 100 or q.status eq '완료' ? 'disabled' : ''}>
										${q.status eq '완료' ? '퀘스트 완료 전' : '퀘스트 완료! 코인 받기'}</button>
								</div>
							</form>

							<h5 class="card-title mt-4">위치: ${q.address} ${q.location}</h5>
							<div id="map-${q.questId}" class="map-placeholder"></div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script>
$(document).ready(function () {
  $("[class*='task-']").on("change", function () {
    const checkbox = $(this);
    const isChecked = checkbox.is(":checked");
    const taskId = checkbox.val();

    $.ajax({
      url: "${pageContext.request.contextPath}/mypage/checkUpdate.do",
      method: "POST",
      data: { taskId: taskId, isChecked: isChecked },
      success: function () {
        console.log("체크 상태 저장 성공");
      },
      error: function () {
        alert("체크 저장 실패 🥲 다시 시도해 주세요.");
        checkbox.prop("checked", !isChecked);
      }
    });

    const classList = checkbox.attr("class").split(" ");
    const taskClass = classList.find(c => c.startsWith("task-"));
    const questId = taskClass.split("-")[1];

    const checkboxes = $(".task-" + questId);
    const total = checkboxes.length;
    const checked = checkboxes.filter(":checked").length;
    const percent = total > 0 ? Math.round((checked / total) * 100) : 0;

    $("#progress-bar-" + questId).css("width", percent + "%");
    $("#progress-text-" + questId).text("진행률: " + percent + "%");

    const coinBtn = $("#coin-btn-" + questId);
    if (percent === 100 && coinBtn.hasClass("btn-success")) {
      coinBtn.prop("disabled", false);
    } else {
      coinBtn.prop("disabled", true);
    }
  });
});
</script>

	<script>
kakao.maps.load(function () {
  <c:forEach var="quest" items="${questlist}">
    (function () {
      const lat = parseFloat("${quest.latitude}");
      const lng = parseFloat("${quest.longitude}");
      const mapId = "map-${quest.questId}";
      if (!isNaN(lat) && !isNaN(lng) && lat !== 0 && lng !== 0) {
        const container = document.getElementById(mapId);
        const map = new kakao.maps.Map(container, {
          center: new kakao.maps.LatLng(lat, lng),
          level: 3
        });
        new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(lat, lng),
          title: "${quest.title}"
        });
      }
    })();
  </c:forEach>
});
</script>
</body>
</html>
