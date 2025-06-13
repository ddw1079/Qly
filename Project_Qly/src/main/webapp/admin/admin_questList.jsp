<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!--
  관리자 퀘스트 관리 페이지 (admin_questList.jsp)
  ------------------------------------------------------
   페이지 목적:
    - 전체 퀘스트 현황(총 건수, 상태별 분포, 최근 등록)을 관리자에게 시각적으로 제공
    - 등록된 퀘스트 리스트를 표로 출력하고, 검색 및 페이징 처리
    - 완료율, 응답/처리 지표, 최근 등록 추이 등을 차트와 카드로 시각화
    - 운영 메모를 통해 관리자 간 커뮤니케이션 지원

   포함 요소:
    - 관리자 정보 표시 (admin 모드)
    - 통계 카드: 총 퀘스트 / 진행중 / 완료 / 최근 등록
    - 진행 상태 비율 바 (Progress Bar)
    - 퀘스트 처리 지표 카드
    - 최근 등록 추이 선형 차트 (Chart.js)
    - 퀘스트 목록 테이블 (DataTables)
    - 운영 메모 입력 영역
    - Bootstrap, jQuery, DataTables, Chart.js 사용
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 관리</title>


<!-- 필수 CDN 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
#chart-container {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>

	<!-- 관리자 상단 정보 -->
	<div
		style="display: flex; justify-content: space-between; align-items: center;">
		<h2>퀘스트 관리 페이지</h2>
		<div style="display: flex; align-items: center; gap: 10px;">
			<span style="font-weight: 500;">admin님 (관리자 모드)</span>
			<button class="btn btn-dark btn-sm">로그아웃</button>
			<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
				alt="관리자 프로필" width="50">
		</div>
	</div>

	<!-- 통계 요약 커드 -->
	<div style="display: flex; gap: 20px; margin: 30px 0;">
		<div
			style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); position: relative;">
			<h5>총 퀘스트 수</h5>
			<p>92건</p>
			<img src="https://i.postimg.cc/VkZ36Ybx/quest.png" alt="퀴스트 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div
			style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); position: relative;">
			<h5>진행 중인 퀘스트</h5>
			<p>24건</p>
			<img src="https://cdn-icons-png.flaticon.com/512/189/189792.png"
				alt="진행중 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div
			style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); position: relative;">
			<h5>완료된 퀘스트</h5>
			<p>65건</p>
			<img src="https://cdn-icons-png.flaticon.com/512/190/190411.png"
				alt="완료 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 48px;">
		</div>
		<div
			style="flex: 1; padding: 20px; background: #6aaea7; border-radius: 10px; color: white; box-shadow: 0 0 8px rgba(0, 0, 0, 0.15);">
			<h5>최근 등록 퀘스트</h5>
			<p style="font-size: 1.5rem;">6건</p>
			<p style="opacity: 0.9;">최근 7일 이내 등록된 퀘스트 수</p>
		</div>
	</div>

<div class="row mb-4">
  <!-- 왼쪽: col-md-8 (완료율 + 아래 카드 포함) -->
  <div class="col-md-8 d-flex flex-column gap-3">
<!--  완료율 카드 -->
<div class="card shadow-sm p-4">
  <h5>전체 퀘스트 상태 분포</h5>
  <div class="progress" style="height: 30px;">
    <div class="progress-bar" style="width: 20%; background-color: #cee4e3; color: black; font-weight: bold;">
      예정 20%
    </div>
    <div class="progress-bar" style="width: 30%; background-color: #9dc9c5; color: white; font-weight: bold;">
      진행중 30%
    </div>
    <div class="progress-bar" style="width: 50%; background-color: #6caea8; color: white; font-weight: bold;">
      완료 50%
    </div>
  </div>
</div>


    <!--  완료율 아래 새 카드 -->
    <div class="card shadow-sm p-4">
      <h5>퀘스트 처리 지표 요약</h5>
      <ul class="mb-0">
        <li>평균 응답 시간: <strong>1시간 20분</strong></li>
        <li>평균 처리 시간: <strong>5시간</strong></li>
        <li>신속 처리율: <strong>73%</strong></li>
      </ul>
    </div>
  </div>

  <!-- 오른쪽: col-md-4 (차트 영역) -->
  <div class="col-md-4">
    <div class="card shadow-sm p-4 h-100">
      <h5>최근 등록 추이</h5>
      <div style="height: 200px;">
        <canvas id="questChart"></canvas>
      </div>
    </div>
  </div>
</div>


	<!-- 퀘스트 목록 테이블 -->
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
			<tr>
				<td>1</td>
				<td>냉장고 옴기기</td>
				<td>2024-06-20</td>
				<td>서울</td>
				<td>5000</td>
				<td>진행예정</td>
			</tr>
			<tr>
				<td>2</td>
				<td>반려견 산책</td>
				<td>2024-06-20</td>
				<td>인천</td>
				<td>3500</td>
				<td>진행완료</td>
			</tr>
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
							emptyTable : "회원이 없습니다.",
							zeroRecords : "검색 결과가 없습니다."
						}
					});

					// 선형 차트 구성
					const ctx = document.getElementById('questChart')
							.getContext('2d');
					const questChart = new Chart(ctx, {
						type : 'line',
						data : {
							labels : [ '6일 전', '5일 전', '4일 전', '3일 전', '2일 전',
									'어저', '오늘' ],
							datasets : [ {
								label : '등록 퀴스트 수',
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
