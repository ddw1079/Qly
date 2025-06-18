<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 관리</title>

<!-- 공통 스타일 및 CDN -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0px;
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

	<!-- 관리자 상단 정보 -->
	<div
		style="display: flex; justify-content: space-between; align-items: center;">
		<h3>퀘스트 관리 페이지</h3>
		<div style="display: flex; align-items: center; gap: 10px;">
			<span style="font-weight: 500;">admin님 (관리자 모드)</span>
			<button class="btn btn-dark btn-sm">로그아웃</button>
			<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
				alt="관리자 프리플" width="50">
		</div>
	</div>

	<!-- 통계 카드 -->
	<div class="summary-cards">
		<div class="card-common">
			<h5>총 퀘스트 수</h5>
			<p>${totalQuestCount}건</p>
			<img src="https://i.postimg.cc/VkZ36Ybx/quest.png"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div class="card-common">
			<h5>진행 중인 퀘스트</h5>
			<p>${progressCount}건</p>
			<img src="https://cdn-icons-png.flaticon.com/512/189/189792.png"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div class="card-common">
			<h5>완료된 퀘스트</h5>
			<p>${doneCount}건</p>
			<img src="https://cdn-icons-png.flaticon.com/512/190/190411.png"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div class="card-common" style="background: #6aaea7; color: white;">
			<h5>최근 등록 퀘스트</h5>
			<p style="font-size: 1.5rem;">${recentCount}건</p>
			<p style="opacity: 0.9;">최근 7일 이내 등록된 퀘스트 수</p>
		</div>
	</div>

	<!-- 상태 바 및 통계 -->
	<div class="row mb-4">
		<div class="col-md-8 d-flex flex-column gap-3">
			<div class="card shadow-sm p-4">
				<h5>전체 퀘스트 상태 분포</h5>
				<div class="progress" style="height: 30px;">
					<div class="progress-bar"
						style="width: 20%; background-color: #cee4e3; color: black; font-weight: bold;">예정
						20%</div>
					<div class="progress-bar"
						style="width: 30%; background-color: #9dc9c5; color: white; font-weight: bold;">진행중
						30%</div>
					<div class="progress-bar"
						style="width: 50%; background-color: #6caea8; color: white; font-weight: bold;">완료
						50%</div>
				</div>
			</div>

			<div class="card shadow-sm p-4">
				<h5>퀘스트 처리 지표 요약</h5>
				<ul class="mb-0">
					<li>평균 응답 시간: <strong>1시간 20분</strong></li>
					<li>평균 처리 시간: <strong>5시간</strong></li>
					<li>신속 처리율: <strong>73%</strong></li>
				</ul>
			</div>
		</div>

		<div class="col-md-4">
			<div class="card shadow-sm p-4 h-100">
				<h5>최근 등록 추이</h5>
				<div style="height: 200px;">
					<canvas id="questChart"></canvas>
				</div>
			</div>
		</div>
	</div>

	<!-- 퀘스트 목록 -->
	<h5>퀘스트 목록</h5>
	<table id="questTable" class="display" style="width: 100%;">
		<thead>
			<tr>
				<th>번호</th>
				<th>퀘스트제목</th>
				<th>등록일자</th>
				<th>지역</th>
				<th>토큰</th>
				<th>진행상황</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="quest" items="${questList}">
				<tr>
					<td>${quest.questId}</td>
					<td>${quest.title}</td>
					<td><fmt:formatDate value="${quest.createdAt}"
							pattern="yyyy-MM-dd" /></td>
					<td>${quest.location}</td>
					<td>${quest.rewardTokens}</td>
					<td><c:choose>
							<c:when test="${quest.status eq '대기'}">
								<span style="color: gray; font-weight: bold;"><span
									style="display: inline-block; width: 10px; height: 10px; background-color: gray; border-radius: 50%; margin-right: 5px;"></span>대기</span>
							</c:when>
							<c:when test="${quest.status eq '진행중'}">
								<span style="color: orange; font-weight: bold;"><span
									style="display: inline-block; width: 10px; height: 10px; background-color: orange; border-radius: 50%; margin-right: 5px;"></span>진행중</span>
							</c:when>
							<c:when test="${quest.status eq '완료'}">
								<span style="color: green; font-weight: bold;"><span
									style="display: inline-block; width: 10px; height: 10px; background-color: green; border-radius: 50%; margin-right: 5px;"></span>완료</span>
							</c:when>
							<c:otherwise>${quest.status}</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 운영 메모 -->
	<div style="margin-top: 40px;">
		<h5>운영 메모</h5>
		<textarea placeholder="관리자 간 메모를 기록하세요"
			style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
		<button
			style="margin-top: 10px; float: right; background-color: #fcb80f; color: white; border: none; padding: 8px 16px; border-radius: 5px;">메모
			저장</button>
	</div>

	<script>
		$(document).ready(
				function() {
					$('#questTable').DataTable({
						language : {
							search : "검색:",
							lengthMenu : "_MENU_ 개씩 보기",
							info : "총 _TOTAL_개 중 _START_~_END_",
							paginate : {
								first : "처음",
								last : "마지막",
								next : "다음",
								previous : "이전"
							},
							emptyTable : "등록된 퀘스트가 없습니다.",
							zeroRecords : "검색 결과가 없습니다."
						}
					});

					const ctx = document.getElementById('questChart')
							.getContext('2d');
					const questChart = new Chart(ctx, {
						type : 'line',
						data : {
							labels : [ '6일 전', '5일 전', '4일 전', '3일 전', '2일 전',
									'어제', '오늘' ],
							datasets : [ {
								label : '등록 퀘스트 수',
								data : [ 2, 1, 4, 3, 2, 1, 5 ],
								backgroundColor : 'rgba(106, 174, 167, 0.2)',
								borderColor : '#6aaea7',
								borderWidth : 2,
								tension : 0.3
							} ]
						},
						options : {
							responsive : true,
							maintainAspectRatio : false,
							scales : {
								y : {
									beginAtZero : true
								}
							}
						}
					});
				});
	</script>

</body>
</html>
