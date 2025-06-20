<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>퀘스트 목록</title>

  <!-- CSS & JS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
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
      border-left: 6px solid #80cbc4;
      padding: 20px;
      border-radius: 1rem;
      box-shadow: 0 3px 8px rgba(0, 0, 0, 0.05);
    }

    .status-dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      display: inline-block;
      margin-right: 6px;
    }

    .dot-waiting { background-color: #9e9e9e; }
    .dot-progress { background-color: #ffc107; }
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
  <!-- 상단 -->
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h4 class="fw-bold">퀘스트 목록</h4>
    <div class="d-flex align-items-center gap-3">
      <span class="fw-semibold">
        <%= loginUser != null ? loginUser.getUsername() : "게스트" %>님
        (<%= loginUser != null ? loginUser.getUserType() : "비회원" %> 모드)
      </span>
      <button class="btn btn-dark btn-sm" onclick="location.href='/login/logout.do'">로그아웃</button>
      <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="40" style="border-radius: 50%;">
    </div>
  </div>

  <!-- 상태 점 설명 -->
  <div class="d-flex gap-3 align-items-center mb-3">
    <div><span class="status-dot dot-waiting"></span>대기</div>
    <div><span class="status-dot dot-progress"></span>진행</div>
    <div><span class="status-dot dot-complete"></span>완료</div>
  </div>

  <div class="row">
    <!-- 좌측: 캘린더 -->
    <div class="col-md-4">
      <div class="calendar-box mb-4">
        <h5 class="fw-bold mb-3">🗓️ 캘린더</h5>
        <div id="calendar"></div>
        <hr>
        <button class="btn btn-secondary w-100 mt-3" onclick="showAllQuests()">전체 보기</button>
      </div>
    </div>

    <!-- 우측: 퀘스트 카드 -->
    <div class="col-md-8">
      <!-- 날짜별 퀘스트 카드 (data-date 포함) -->
      <div class="quest-card mb-4" data-date="2025-06-12">
        <div class="mb-2 text-muted small">[카테고리] 생활 수리</div>
        <div class="mb-2 fw-semibold"><span class="status-dot dot-waiting"></span> 에어컨이 안 나와요</div>
        <div class="mb-1 text-muted">신청자: 2명</div>
        <div class="mb-3 text-muted">등록일: 2025-06-12</div>
        <div class="text-end"><button class="btn btn-outline-success btn-sm">상세보기</button></div>
      </div>

      <div class="quest-card mb-4" data-date="2025-06-10">
        <div class="mb-2 text-muted small">[카테고리] 컴퓨터</div>
        <div class="mb-2 fw-semibold"><span class="status-dot dot-progress"></span> 포맷 도와주세요</div>
        <div class="mb-1 text-muted">신청자: 1명</div>
        <div class="mb-3 text-muted">등록일: 2025-06-10</div>
        <div class="text-end"><button class="btn btn-outline-success btn-sm">상세보기</button></div>
      </div>

      <div class="quest-card mb-4" data-date="2025-06-05">
        <div class="mb-2 text-muted small">[카테고리] 청소</div>
        <div class="mb-2 fw-semibold"><span class="status-dot dot-complete"></span> 원룸 청소 부탁해요</div>
        <div class="mb-1 text-muted">신청자: 4명</div>
        <div class="mb-3 text-muted">등록일: 2025-06-05</div>
        <div class="text-end"><button class="btn btn-outline-success btn-sm">상세보기</button></div>
      </div>
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
        { title: '', start: '2025-06-12', color: '#9e9e9e' },
        { title: '', start: '2025-06-10', color: '#ffc107' },
        { title: '', start: '2025-06-05', color: '#4caf50' }
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
