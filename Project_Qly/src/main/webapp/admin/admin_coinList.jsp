<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!-- ✅ 상단 정보 바 -->
<div style="display: flex; justify-content: space-between; align-items: center;">
	<h3>코인 관리 페이지</h3>
	<div style="display: flex; align-items: center; gap: 10px;">
		<span style="font-weight: 500;">admin님 (관리자 모드)</span>
		<button class="btn btn-dark btn-sm">로그아웃</button>
		<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="50">
	</div>
</div>

<!-- ✅ 요약 카드 -->
<div style="display: flex; gap: 20px; margin: 30px 0;">
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>총 회원 수</h5><p>112명</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>전체 보유 토큰</h5><p>128,000 Qubit</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>최근 7일 충전합</h5><p>6,000 Qubit</p>
	</div>
</div>

<!-- ✅ DataTables 라이브러리 -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<!-- ✅ 토큰 내역 테이블 -->
<h5>회원별 토큰 관리 내역</h5>
<table id="coinTable" class="display" style="width: 100%;">
	<thead>
		<tr>
			<th>회원 ID</th>
			<th>닉네임</th>
			<th>현재 보유</th>
			<th>누적 충전</th>
			<th>누적 환급</th>
			<th>최근 충전 일시</th>
			<th>최근 환급 일시</th>
			<th>상태</th>
			<th>관리</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>user001</td>
			<td>희상</td>
			<td>3,000</td>
			<td>15,000</td>
			<td>0</td>
			<td>2025-06-10 14:20</td>
			<td>-</td>
			<td><span class="badge bg-success">정상</span></td>
			<td><button class="btn btn-sm btn-outline-warning">조정</button></td>
		</tr>
		<tr>
			<td>user002</td>
			<td>성진</td>
			<td>5,800</td>
			<td>20,000</td>
			<td>2,000</td>
			<td>2025-06-08 16:50</td>
			<td>2025-06-09 09:15</td>
			<td><span class="badge bg-warning text-dark">환급 요청</span></td>
			<td><button class="btn btn-sm btn-outline-warning">조정</button></td>
		</tr>
	</tbody>
</table>

<!-- ✅ 메모 작성 -->
<div style="margin-top: 40px;">
	<h5>운영 메모</h5>
	<textarea placeholder="코인 정책, 환급 요청 등 관련 메모를 기록하세요"
		style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
	<button style="margin-top: 10px; float: right; background-color: #fcb80f; color: white; border: none; padding: 8px 16px; border-radius: 5px;">
		메모 저장
	</button>
</div>

<!-- ✅ 테이블 기능 -->
<script>
	$(document).ready(function () {
		$('#coinTable').DataTable({
			language: {
				search: "검색:",
				lengthMenu: "페이지당 _MENU_명 보기",
				info: "총 _TOTAL_명 중 _START_~_END_",
				paginate: {
					previous: "이전",
					next: "다음"
				},
				emptyTable: "토큰 내역이 없습니다.",
				zeroRecords: "일치하는 기록이 없습니다."
			}
		});
	});
</script>
