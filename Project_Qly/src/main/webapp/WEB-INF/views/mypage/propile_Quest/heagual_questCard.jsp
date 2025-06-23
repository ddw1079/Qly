<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>완료한 퀘스트</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.8/index.global.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.8/index.global.min.js"></script>

  <style>
    body {
      background-color: #f1f2f6;
      font-family: 'Segoe UI', sans-serif;
    }

    .calendar-box {
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 20px;
    }

    .quest-card {
      background: #ffffff;
      border-left: 6px solid #4caf50;
      padding: 20px;
      border-radius: 1rem;
      box-shadow: 0 3px 8px rgba(0, 0, 0, 0.05);
      margin-bottom: 1.5rem;
    }

    .status-dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      display: inline-block;
      margin-right: 6px;
      vertical-align: middle;
    }

    .dot-complete { background-color: #4caf50; }

    .fc-toolbar-title {
      font-size: 1.25rem;
      font-weight: bold;
      color: #00695c;
    }

    .fc-button {
      background-color: #80cbc4 !important;
      border: none !important;
      color: white !important;
      border-radius: 6px !important;
      padding: 5px 12px !important;
    }

    .fc-button:hover {
      background-color: #4db6ac !important;
    }

    .fc-col-header-cell-cushion, .fc-daygrid-day-number {
      color: #00796b;
      font-weight: 500;
    }

    .fc-daygrid-day.fc-day-today {
      background-color: #b2dfdb !important;
    }
  </style>
</head>
<body>
<%
  com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");
%>

<div class="container-fluid mt-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h4 class="fw-bold">완료한 퀘스트</h4>
    <div class="d-flex align-items-center gap-3">
      <span class="fw-semibold">
        <%= loginUser != null ? loginUser.getUsername() : "게스트" %>님
        (<%= loginUser != null ? loginUser.getUserType() : "비회원" %> 모드)
      </span>
      <button class="btn btn-dark btn-sm" onclick="location.href='/login/logout.do'">로그아웃</button>
      <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="40" style="border-radius: 50%;" />
    </div>
  </div>

  <div class="row">
    <!-- 좌측: 캘린더 -->
    <div class="col-md-4">
      <div class="calendar-box mb-4">
        <h5 class="fw-bold mb-3">🗓️ 캘린더</h5>
        <div id="calendar"></div>
        <hr />
        <button class="btn btn-secondary w-100 mt-3" onclick="showAllQuests()">전체 보기</button>
      </div>
    </div>

    <!-- 우측: 완료 퀘스트 카드 -->
    <div class="col-md-8">
      <c:forEach var="q" items="${completedQuests}">
        <div class="quest-card" data-date="<fmt:formatDate value='${q.regDate}' pattern='yyyy-MM-dd' />">
          <div class="mb-2 text-muted small">[카테고리] ${q.category}</div>
          <div class="mb-2 fw-semibold">
            <span class="status-dot dot-complete"></span> ${q.title}
          </div>
          <div class="mb-3 text-muted">완료일: <fmt:formatDate value="${q.regDate}" pattern="yyyy-MM-dd" /></div>
          <div class="text-end">
            <form action="viewQuestDetail.do" method="get">
              <input type="hidden" name="questId" value="${q.questId}" />
              <button class="btn btn-outline-success btn-sm">상세보기</button>
            </form>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const calendarEl = document.getElementById('calendar');
    const calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ko',
      height: 400,
      events: [
        <c:forEach var="q" items="${completedQuests}">
          {
            title: '',
            start: '<fmt:formatDate value="${q.regDate}" pattern="yyyy-MM-dd" />',
            color: '#4caf50'
          },
        </c:forEach>
      ],
      dateClick: function (info) {
        const clickedDate = info.dateStr;
        const cards = document.querySelectorAll('.quest-card');
        cards.forEach(card => {
          const cardDate = card.getAttribute('data-date');
          card.style.display = (cardDate === clickedDate) ? 'block' : 'none';
        });
      },
      eventContent: function (arg) {
        return { html: `<div style="text-align:center; font-size:20px;">•</div>` };
      }
    });
    calendar.render();
  });

  function showAllQuests() {
    document.querySelectorAll('.quest-card').forEach(card => {
      card.style.display = 'block';
    });
  }
</script>

</body>
</html>
