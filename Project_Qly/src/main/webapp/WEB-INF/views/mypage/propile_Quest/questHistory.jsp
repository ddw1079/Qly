<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>퀘스트 히스토리</title>
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
      box-shadow: 0 3px 10px rgba(0,0,0,0.06);
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

  <c:forEach var="q" items="${questlist}">
    <div class="card mb-5">
      <div class="card-header">${q.title}</div>
      <img src="${q.photoPath}" class="card-img-top" alt="이미지">

      <div class="card-body">
        <p class="mb-2">${q.content}</p>

        <!-- 체크 저장 폼 -->
        <form id="checkForm-${q.questId}" action="/Project_Qly/mypage/insertcheck.do" method="post">
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
                <input class="form-check-input task task-${q.questId}" type="checkbox"
                       id="task${q.questId}_${loop.index}" name="checkedTasks"
                       value="${t.taskId}" ${t.isChecked eq '1' ? 'checked' : ''} />
                <label class="form-check-label" for="task${q.questId}_${loop.index}">
                  ${t.description}
                </label>
              </div>
            </c:forEach>
          </div>
        </form>

        <!-- 코인 지급용 폼 -->
        <form id="coinForm-${q.questId}" action="coinpayment.do" method="post">
          <input type="hidden" name="questId" value="${q.questId}" />
        </form>

        <!-- 버튼 영역 -->
        <div class="d-flex justify-content-between align-items-center">
          <p class="coin-label mb-0">획득 코인: ${q.rewardTokens} Qubit</p>

          <div>
            <button type="submit" class="btn btn-primary btn-sm"
                    form="checkForm-${q.questId}">
              체크 저장
            </button>

            <button type="submit" class="btn btn-success btn-sm ms-2 coin-btn"
                    form="coinForm-${q.questId}" data-questid="${q.questId}"
                    ${percent ne 100 ? 'disabled' : ''}>
              코인 지급
            </button>
          </div>
        </div>

        <div class="map-placeholder mt-2">위치: ${q.address} (${q.latitude}, ${q.longitude})</div>
      </div>
    </div>
  </c:forEach>
</div>

<!-- 진행률/버튼 제어 스크립트 -->
<script>
  $(document).ready(function () {
    $("[class*='task-']").on("change", function () {
      const classList = $(this).attr("class").split(" ");
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

      const coinBtn = $(".coin-btn[data-questid='" + questId + "']");
      coinBtn.prop("disabled", percent !== 100);
    });
  });
</script>

</body>
</html>
