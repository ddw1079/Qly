<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--  상단 정보 바 -->
<div style="display: flex; justify-content: space-between; align-items: center;">
	<h3>퀘스트 관리 페이지</h3>
	<div style="display: flex; align-items: center; gap: 10px;">
		<span style="font-weight: 500;">admin님 (관리자 모드)</span>
		<button class="btn btn-dark btn-sm">로그아웃</button>
		<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="50">
	</div>
</div>

<!--  요약 카드 -->
<div style="display: flex; gap: 20px; margin: 30px 0;">
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>총 퀘스트 수</h5><p>48건</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>진행 중 퀘스트</h5><p>21건</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>완료된 퀘스트</h5><p>27건</p>
	</div>
</div>

<!--  퀘스트 목록 테이블 -->
<h5>퀘스트 목록</h5>
<table id="questTable" class="display" style="width: 100%;">
	<thead>
		<tr>
			<th>번호</th>
			<th>사진</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>신청자 수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td><img src="/images/quest1.jpg" alt="퀘스트1" style="width: 48px; height: 48px; object-fit: cover; border-radius: 6px;"></td>
			<td><a href="#">첫 번째 퀘스트 제목</a></td>
			<td>2024-06-20</td>
			<td>123</td>
			<td>1 명</td>
		</tr>
		<tr>
			<td>2</td>
			<td><img src="/images/quest2.jpg" alt="퀘스트2" style="width: 48px; height: 48px; object-fit: cover; border-radius: 6px;"></td>
			<td><a href="#">두 번째 퀘스트 제목</a></td>
			<td>2024-06-18</td>
			<td>98</td>
			<td>아직 없음</td>
		</tr>
	</tbody>
</table>

<!--  운영 메모 -->
<div style="margin-top: 40px;">
	<h5>운영 메모</h5>
	<textarea placeholder="퀘스트 운영 관련 메모를 기록하세요"
		style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
	<button style="margin-top: 10px; float: right; background-color: #fcb80f; color: white; border: none; padding: 8px 16px; border-radius: 5px;">
		메모 저장
	</button>
</div>

<!--  DataTables -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script>
	$(document).ready(function () {
		$('#questTable').DataTable({
			language: {
				search: "검색:",
				lengthMenu: "_MENU_ 개씩 보기",
				info: "총 _TOTAL_개 중 _START_~_END_",
				paginate: {
					first: "처음",
					last: "마지막",
					next: "다음",
					previous: "이전"
				},
				emptyTable: "퀘스트가 없습니다.",
				zeroRecords: "검색 결과가 없습니다."
			}
		});
	});
</script>
