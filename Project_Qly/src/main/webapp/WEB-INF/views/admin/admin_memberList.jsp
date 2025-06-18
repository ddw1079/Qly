<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	background-color: #f9f9f9;
	margin-bottom: 100px;
}

.card-common {
	flex: 1;
	padding: 20px;
	background: white;
	border-radius: 10px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	position: relative;
	min-width: 220px;
}

.card-common h5 {
	font-weight: bold;
}

#chart-container {
	width: 100%;
	height: 100%;
}

.summary-cards {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin: 30px 0;
}
/* 🔍 아이콘 포함한 검색창용 스타일 추가 */
.dataTables_filter label {
	display: flex;
	align-items: center;
	gap: 5px;
}

.dataTables_filter input {
	margin-left: 4px;
	padding-left: 24px;
	background-image:
		url('https://cdn-icons-png.flaticon.com/512/622/622669.png');
	/* 돋보기 아이콘 */
	background-size: 18px;
	background-position: 4px center;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<div class="d-flex justify-content-between align-items-center">
		<h3>회원 관리 페이지</h3>
		<div class="d-flex align-items-center gap-2">
			<span class="fw-medium">admin님 (관리자 모드)</span>
			<button class="btn btn-dark btn-sm">로그아웃</button>
			<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
				alt="프로필" width="50">
		</div>
	</div>

	<div class="d-flex gap-3 my-4">
		<div class="card-common flex-fill">
			<h5>총 회원 수</h5>
			<p>${totalUsers}명</p>
			<img src="https://i.postimg.cc/T3vKs6wX/user.png" alt="회원 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div class="card-common flex-fill">
			<h5>총 퀘스트 수</h5>
			<p>${totalQuestCount}건</p>
			<!-- 기존 48건 → 동적 표현 -->
			<img src="https://i.postimg.cc/VkZ36Ybx/quest.png" alt="퀘스트 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>

		<div class="card-common flex-fill">
			<h5>보유 코인 합계</h5>
			<p>74,000 Qubit</p>
			<img src="https://i.postimg.cc/1zxrM2xg/dollar.png" alt="코인 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div class="flex-fill p-3"
			style="background: #6aaea7; border-radius: 10px; color: white; box-shadow: 0 0 8px rgba(0, 0, 0, 0.15);">
			<h5>최근 7일 신규 가입</h5>
			<p class="fs-4"><%=request.getAttribute("newUser7days") != null ? request.getAttribute("newUser7days") : "2"%>명
			</p>
			<p style="opacity: 0.9;">이번 주 등록된 신규 회원 수</p>
		</div>
	</div>

	<div class="d-flex gap-3 mb-4">
		<div class="card-common flex-grow-1">
			<h6 class="fw-bold text-secondary">SCHEDULE</h6>
			<div class="d-flex gap-3">
				<div style="flex: 1;">
					<div id="calendar"></div>
				</div>
				<div style="flex: 1;">
					<div class="d-flex justify-content-between align-items-center">
						<div>
							<h5 class="mb-1">관리자 오늘 일정</h5>
							<p class="mb-2 text-muted">2025-06-13 (금)</p>
						</div>
						<button id="openScheduleModal"
							class="btn btn-outline-primary btn-sm">+ 새 일정</button>
					</div>
					<ul class="mt-3 ps-3">
						<li>시스템 점검 - 오후 2시</li>
						<li>회원 신고 검토 - 오후 4시</li>
						<li>주간 통계 정리 - 오후 6시</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="card-common" style="flex: 1; text-align: center;">
			<h5>최근 7일 회원 활동 추이</h5>
			<canvas id="weeklyActivityChart" height="100"></canvas>
		</div>
	</div>

	<h5>회원 목록</h5>
	<table id="questTable" class="display" style="width: 100%;">
		<thead>
			<tr>
				<th>번호</th>
				<th>ID</th>
				<th>가입일자</th>
				<th>유저타입</th>
				<th>보유토큰</th>
				<th>최근활동일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${user.userId}</td>
					<td><fmt:formatDate value="${user.joinDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${user.userType != null ? user.userType : '-'}</td>
					<td>${user.totalTokens}</td>
					<td><fmt:formatDate value="${user.lastActive}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 메모 영역 -->
	<div class="mt-4">
		<h5>운영 메모</h5>
		<textarea placeholder="관리자 간 메모를 기록하세요"
			style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
		<button class="btn btn-warning text-white mt-2 float-end">메모
			저장</button>
	</div>

	<script>
$(document).ready(function () {
  $('#questTable').DataTable({
    language: {
      search: "검색:",
      lengthMenu: "_MENU_ 개씩 보기",
      info: "총 _TOTAL_개 중 _START_~_END_",
      paginate: { first: "처음", last: "마지막", next: "다음", previous: "이전" },
      emptyTable: "회원이 없습니다.",
      zeroRecords: "검색 결과가 없습니다."
    }
  });
  $('#calendar').datepicker({ dateFormat: "yy-mm-dd" });
  new Chart(document.getElementById('weeklyActivityChart').getContext('2d'), {
    type: 'line',
    data: {
      labels: ['6/7', '6/8', '6/9', '6/10', '6/11', '6/12', '6/13'],
      datasets: [{
        label: '일일 활동 수',
        data: [5, 8, 4, 7, 10, 6, 9],
        fill: true,
        borderColor: '#6aaea7',
        backgroundColor: 'rgba(106, 174, 167, 0.2)',
        tension: 0.3,
        pointBackgroundColor: '#6aaea7',
        pointRadius: 4
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { display: false },
        tooltip: { callbacks: { label: ctx => `${ctx.raw}건` } }
      },
      scales: {
        y: { beginAtZero: true, ticks: { stepSize: 2, color: '#666' }, grid: { color: '#eee' } },
        x: { ticks: { color: '#666' }, grid: { display: false } }
      }
    }
  });
});
</script>
</body>
</html>
