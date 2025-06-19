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
</head>
<body>
<div class="container mt-4">

  <h3 class="mb-4">나의 퀘스트 히스토리</h3>

  <c:forEach var="q" items="${questlist}">
    <div class="card mb-4 shadow-sm">
      <div class="card-header fs-5 fw-bold">${q.title}</div>
      <img src="${q.photoPath}" class="card-img-top" alt="이미지">

      <div class="card-body">
        <p>${q.content}</p>

        <c:set var="tasks" value="${taskMap[q.questId]}" />
        <c:set var="total" value="${fn:length(tasks)}" />
        <c:set var="checked" value="0" />
        <c:forEach var="t" items="${tasks}">
          <c:if test="${t.isChecked eq '1'}">
            <c:set var="checked" value="${checked + 1}" />
          </c:if>
        </c:forEach>
        <c:set var="percent" value="${total > 0 ? (checked * 100 / total) : 0}" />

        <!-- 진행률 바 -->
        <div class="progress mb-2">
          <div class="progress-bar ${percent eq 100 ? 'bg-success' : 'bg-warning'}"
               style="width: ${percent}%;" role="progressbar"></div>
        </div>
        <p class="text-muted">진행률: ${percent}%</p>

        <!-- 해야 할 일 -->
        <div>
          <c:forEach var="t" items="${tasks}" varStatus="loop">
            <div class="form-check">
              <input class="form-check-input" type="checkbox"
                     id="task${q.questId}_${loop.index}" value="${t.description}"
                     ${t.isChecked eq '1' ? 'checked' : ''} disabled />
              <label class="form-check-label" for="task${q.questId}_${loop.index}">
                ${t.description}
              </label>
            </div>
          </c:forEach>
        </div>

        <hr>
        <p class="fw-bold text-primary">${q.rewardTokens} 코인</p>
        <div class="map-placeholder">위치: ${q.address} (${q.latitude}, ${q.longitude})</div>
      </div>
    </div>
  </c:forEach>

</div>
</body>
</html>
