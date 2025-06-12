<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!--  상단 정보 바 -->
<div style="display: flex; justify-content: space-between; align-items: center;">
	<h3>회원 관리 페이지</h3>
	<div style="display: flex; align-items: center; gap: 10px;">
		<span style="font-weight: 500;">admin님 (관리자 모드)</span>
		<button class="btn btn-dark btn-sm">로그아웃</button>
		<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="50">
	</div>
</div>

<!--  요약 카드 -->
<div style="display: flex; gap: 20px; margin: 30px 0;">
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>총 회원 수</h5><p>112명</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>총 퀘스트 수</h5><p>48건</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>보유 토큰 합계</h5><p>74,000 Qubit</p>
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
		<tr>
			<td>1</td>
			<td><img src="/images/quest1.jpg" alt="USER01" style="width: 48px; height: 48px; object-fit: cover; border-radius: 6px;"></td>
			<td><a href="#">2024-06-20</a></td>
			<td>의뢰인</td>
			<td>5000</td>
			<td>2024-06-20</td>
		</tr>
		<tr>
			<td>2</td>
			<td><img src="/images/quest2.jpg" alt="USER02" style="width: 48px; height: 48px; object-fit: cover; border-radius: 6px;"></td>
			<td><a href="#">2024-06-20</a></td>
			<td>해결사</td>
			<td>3500</td>
			<td>2024-06-25</td>
		</tr>
	</tbody>
</table>

<!--  운영 메모 -->
<div style="margin-top: 40px;">
	<h5>운영 메모</h5>
	<textarea placeholder="관리자 간 메모를 기록하세요" style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
	<button style="margin-top: 10px; float: right; background-color: #fcb80f; color: white; border: none; padding: 8px 16px; border-radius: 5px;">메모 저장</button>
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