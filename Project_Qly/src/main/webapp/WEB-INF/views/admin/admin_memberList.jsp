<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%-- <fmt:formatDate> 사용을 위해 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%-- <fmt:formatDate> 사용을 위해 --%>

<!--
  < 회원 관리 페이지 (Admin Dashboard) >
  -----------------------------------
  이 JSP는 관리자(admin)가 전체 회원 현황을 한 눈에 파악하고 관리할 수 있는 관리페이지.

  -< 주요 기능 >
  - 상단 관리자 정보 영역
  - 통계 카드: 총 회원 수 / 총 퀘스트 수 / 보유 코인 합계 / 최근 7일 신규 가입
  - 캘린더 일정 및 오늘 일정 표시
  - 최근 7일 회원 활동 차트 (Chart.js)
  - 회원 목록 테이블 (DataTables)
  - 일정 추가 모달
  - 운영 메모 기록 영역
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

<!-- CDN 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

	<!-- 관리자 상단 정보 -->
	<div
		style="display: flex; justify-content: space-between; align-items: center;">
		<h2>회원 관리 페이지</h2>
		<div style="display: flex; align-items: center; gap: 10px;">
			<span style="font-weight: 500;">admin님 (관리자 모드)</span>
			<button class="btn btn-dark btn-sm">로그아웃</button>
			<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
				alt="프로필" width="50">
		</div>
	</div>

	<!-- 통계 요약 카드 -->
	<div style="display: flex; gap: 20px; margin: 30px 0;">

		<!-- 총 회원 수 -->
		<div
			style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); position: relative;">
			<h5>총 회원 수</h5>
			<p>${totalUsers}명</p>
			<!-- 🔹 Controller에서 전달된 totalUsers를 출력 -->
			<img src="https://i.postimg.cc/T3vKs6wX/user.png" alt="회원 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>


		<!-- 총 퀘스트 수 -->
		<div
			style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); position: relative;">
			<h5>총 퀘스트 수</h5>
			<p>48건</p>
			<img src="https://i.postimg.cc/VkZ36Ybx/quest.png" alt="퀘스트 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>

		<!-- 보유 코인 합계 -->
		<div
			style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); position: relative;">
			<h5>보유 코인 합계</h5>
			<p>74,000 Qubit</p>
			<img src="https://i.postimg.cc/1zxrM2xg/dollar.png" alt="코인 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>

		<!-- 최근 가입 회원 -->
		<div
			style="flex: 1; padding: 20px; background: #6aaea7; border-radius: 10px; color: white; box-shadow: 0 0 8px rgba(0, 0, 0, 0.15);">
			<h5>최근 7일 신규 가입</h5>
			<p style="font-size: 1.5rem;">
				<%=request.getAttribute("newUser7days") != null ? request.getAttribute("newUser7days") : "2"%>명
			</p>
			<p style="opacity: 0.9;">이번 주 등록된 신규 회원 수</p>
		</div>
	</div>

	<!--  일정 및 활동 그래프 -->
	<div style="display: flex; gap: 20px; margin-bottom: 30px;">
		<!-- 캘린더 및 오늘 일정 -->
		<div
			style="flex: 2; background: white; border-radius: 10px; padding: 20px; box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);">
			<h6 style="font-weight: bold; color: #555;">SCHEDULE</h6>
			<div style="display: flex; gap: 5px;">
				<div style="flex: 1;">
					<div id="calendar"></div>
				</div>
				<div style="flex: 1;">
					<div
						style="display: flex; justify-content: space-between; align-items: center;">
						<div>
							<h5 style="margin: 0;">관리자 오늘 일정</h5>
							<p style="margin: 5px 0; color: #666;">2025-06-13 (금)</p>
						</div>
						<button id="openScheduleModal"
							class="btn btn-outline-primary btn-sm">+ 새 일정</button>
					</div>
					<ul style="margin-top: 15px; padding-left: 16px;">
						<li>시스템 점검 - 오후 2시</li>
						<li>회원 신고 검토 - 오후 4시</li>
						<li>주간 통계 정리 - 오후 6시</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 최근 7일 활동 차트 -->
		<div
			style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 6px rgba(0, 0, 0, 0.1); text-align: center;">
			<h5>최근 7일 회원 활동 추이</h5>
			<canvas id="weeklyActivityChart" height="100"></canvas>
		</div>
	</div>

	<!--  회원 목록 테이블 -->
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
			<!-- 회원 목록 테이블 DB 연동 버전 -->
			<c:forEach var="user" items="${userList}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${user.userId}</td>
					<td><fmt:formatDate value="${user.joinDate}"
							pattern="yyyy-MM-dd" /></td>

					<td>${user.userType}</td>
					<td>${user.totalTokens}</td>
					<td><fmt:formatDate value="${user.lastActive}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>

		<!-- <tbody>
    <tr>
      <td>1</td>
      <td>USER01</td>
      <td>2024-06-20</td>
      <td>의뢰인</td>
      <td>5000</td>
      <td>2024-06-20</td>
    </tr>
    <tr>
      <td>2</td>
      <td>USER02</td>
      <td>2024-06-20</td>
      <td>해결사</td>
      <td>3500</td>
      <td>2024-06-25</td>
    </tr>
  </tbody> -->
	</table>

	<!--  일정 추가 모달 -->
	<div id="modalBackdrop"
		style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4); z-index: 9998;"></div>

	<div id="scheduleModal"
		style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 24px; border-radius: 10px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); z-index: 9999; width: 350px;">
		<h5>새 일정 추가</h5>
		<label>날짜:</label> <input type="text" id="scheduleDate"
			class="form-control" style="margin-bottom: 10px;" readonly> <label>시간:</label>
		<input type="time" id="scheduleTime" class="form-control"
			style="margin-bottom: 10px;"> <label>내용:</label> <input
			type="text" id="scheduleContent" class="form-control"
			placeholder="예: 회의, 점검 등" style="margin-bottom: 15px;">
		<div style="text-align: right;">
			<button id="saveScheduleBtn" class="btn btn-success btn-sm">저장</button>
			<button id="closeScheduleModal" class="btn btn-secondary btn-sm">닫기</button>
		</div>
	</div>

	<!--  운영 메모 -->
	<div style="margin-top: 40px;">
		<h5>운영 메모</h5>
		<textarea placeholder="관리자 간 메모를 기록하세요"
			style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
		<button
			style="margin-top: 10px; float: right; background-color: #fcb80f; color: white; border: none; padding: 8px 16px; border-radius: 5px;">메모
			저장</button>
	</div>

	<!--  실행 스크립트 -->
	<script>
$(document).ready(function () {
  // ▶ 회원 목록 테이블 구성
  $('#questTable').DataTable({
    language: {
      search: "검색:",
      lengthMenu: "_MENU_ 개씩 보기",
      info: "총 _TOTAL_개 중 _START_~_END_",
      paginate: {
        first: "처음", last: "마지막", next: "다음", previous: "이전"
      },
      emptyTable: "회원이 없습니다.",
      zeroRecords: "검색 결과가 없습니다."
    }
  });

  // ▶ 캘린더 설정
  $("#calendar").datepicker({
    dateFormat: "yy-mm-dd",
    onSelect: function (dateText) {
      alert("선택한 날짜: " + dateText);
    }
  });

  // ▶ 차트 표시
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
        tooltip: {
          callbacks: { label: context => `${context.raw}건` }
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          ticks: { stepSize: 2, color: '#666' },
          grid: { color: '#eee' }
        },
        x: {
          ticks: { color: '#666' },
          grid: { display: false }
        }
      }
    }
  });
});

// ▶ 모달 열기
$("#openScheduleModal").click(function () {
  const today = new Date().toISOString().split("T")[0];
  $("#scheduleDate").val(today);
  $("#modalBackdrop, #scheduleModal").fadeIn(200);
});

// ▶ 모달 닫기
$("#closeScheduleModal").click(function () {
  $("#modalBackdrop, #scheduleModal").fadeOut(200);
});

// ▶ 일정 저장 처리
$("#saveScheduleBtn").click(function () {
  const date = $("#scheduleDate").val();
  const time = $("#scheduleTime").val();
  const content = $("#scheduleContent").val();
  if (!content || !time) {
    alert("시간과 내용을 입력해주세요.");
    return;
  }
  alert(`📅 ${date} ${time} - ${content} 일정이 저장되었습니다.`);
  $("#modalBackdrop, #scheduleModal").fadeOut(200);
});
</script>

</body>
</html>
