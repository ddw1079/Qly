<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><title>\u퀘스트 히스토리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
	background-color: #f1f2f6;
	font-family: 'Segoe UI', sans-serif;
}
h3.title {
	font-weight: bold;
	color: #00695c;
}
.card {
	border-left: 6px solid #4db6ac;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.06);
}
.card-header {
	background-color: #e0f7fa;
	color: #00695c;
	font-size: 1.25rem;
	font-weight: bold;
}
.card-body {
	padding: 20px;
}
.map-placeholder {
	width: 100%;
	height: 100px;
	background-color: #d0ece9;
	text-align: center;
	line-height: 100px;
	color: #00796b;
	font-weight: bold;
	border-radius: 8px;
	border: 2px dashed #4db6ac;
}
.progress {
	height: 20px;
	border-radius: 10px;
}
.progress-bar {
	transition: width 0.6s ease;
}
.checklist-title {
	font-weight: bold;
	color: #009688;
	margin-top: 15px;
}
.coin-label {
	font-size: 1.1rem;
	font-weight: bold;
	color: #00897b;
}
</style>
</head>
<body>

<div class="container mt-4">
	<h3 class="mb-4 text-center title">나의 퀘스트 히스토리</h3>

	<!-- Flash 메시지 출력 -->
	<c:if test="${not empty msg}">
		<script>alert("${msg}");</script>
	</c:if>

	<c:forEach var="q" items="${questlist}">
		<div class="card mb-5">
			<div class="card-header">${q.title}</div>

			<c:if test="${not empty q.photoPath}">
				<img src="${q.photoPath}" class="card-img-top" style="height: 300px; width: 100%; object-fit: cover;" alt="이미지">
			</c:if>

			<div class="card-body">
				<p class="mb-2">${q.content}</p>

				<!-- 체크리스트 + 코인 지급 전송 폼 -->
				<form action="${pageContext.request.contextPath}/mypage/insertcheck.do" method="post">
					<input type="hidden" name="questId" value="${q.questId}" />

					<c:set var="tasks" value="${taskMap[q.questId]}" />
					<c:set var="total" value="${fn:length(tasks)}" />
					<c:set var="checked" value="0" />
					<c:forEach var="t" items="${tasks}">
						<c:if test="${t.isChecked eq '1'}">
							<c:set var="checked" value="${checked + 1}" />
						</c:if>
					</c:forEach>
					<c:set var="percent" value="${total > 0 ? (checked * 100 / total) : 0}" />

					<!-- 진행률 -->
					<div class="progress mb-2">
						<div id="progress-bar-${q.questId}"
							 class="progress-bar ${percent eq 100 ? 'bg-success' : 'bg-warning'}"
							 style="width: ${percent}%;" role="progressbar"></div>
					</div>
					<p id="progress-text-${q.questId}" class="text-muted mb-3">진행률: ${percent}%</p>

					<!-- 체크리스트 -->
					<div class="mb-3">
						<p class="checklist-title">체크리스트</p>
						<c:forEach var="t" items="${tasks}" varStatus="loop">
							<div class="form-check">
								<input class="form-check-input task task-${q.questId}"
									   type="checkbox"
									   id="task${q.questId}_${loop.index}"
									   name="checkedTasks"
									   value="${t.taskId}"
									   ${t.isChecked eq '1' ? 'checked' : ''}
									   ${q.status eq '완료' ? 'disabled' : ''} />
								<label class="form-check-label" for="task${q.questId}_${loop.index}">${t.description}</label>
							</div>
						</c:forEach>
					</div>

					<!-- 버튼 -->
					<div class="d-flex justify-content-between align-items-center">
						<p class="coin-label mb-0">획득 코인: ${q.rewardTokens} Qubit</p>
						<button type="submit"
								id="coin-btn-${q.questId}"
								class="btn ${q.status eq '완료' ? 'btn-secondary' : 'btn-success'} btn-sm"
								${percent ne 100 or q.status eq '완료' ? 'disabled' : ''}>
							${q.status eq '완료' ? '지급 완료' : '코인 지급'}
						</button>
					</div>
				</form>

				<div class="map-placeholder mt-2">위치: ${q.address} (${q.latitude}, ${q.longitude})</div>
			</div>
		</div>
	</c:forEach>
</div>

<!-- ✅ JavaScript: 체크 변경 시 진행률/버튼 제어 및 AJAX 전송 -->
<script>
$(document).ready(function () {
  $("[class*='task-']").on("change", function () {
    const checkbox = $(this);
    const isChecked = checkbox.is(":checked");
    const taskId = checkbox.val();

    // AJAX로 서버에 체크 상태 전송
    $.ajax({
      url: "${pageContext.request.contextPath}/mypage/checkUpdate.do",
      method: "POST",
      data: {
        taskId: taskId,
        isChecked: isChecked
      },
      success: function () {
        console.log("체크 상태 저장 성공");
      },
      error: function () {
        alert("체크 저장 실패 🥲 다시 시도해 주세요.");
        checkbox.prop("checked", !isChecked); // 원래 상태로 복구
      }
    });

    // 진행률 및 버튼 제어
    const classList = checkbox.attr("class").split(" ");
    const taskClass = classList.find(c => c.startsWith("task-"));
    const questId = taskClass.split("-")[1];

    const checkboxes = $(".task-" + questId);
    const total = checkboxes.length;
    const checked = checkboxes.filter(":checked").length;
    const percent = total > 0 ? Math.round((checked / total) * 100) : 0;

    $("#progress-bar-" + questId).css("width", percent + "%")
      .removeClass("bg-warning bg-success")
      .addClass(percent === 100 ? "bg-success" : "bg-warning");

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

</body>
</html>
