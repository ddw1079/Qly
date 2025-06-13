<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--
  admin_qusetion.jsp - 사용자 문의 관리 페이지

  ✅ 기능 요약:
  - 관리자 모드에서 사용자 문의 내역을 확인 및 답변 처리
  - 총 문의 수 / 미답변 수 / 최근 등록일 통계 카드 표시
  - DataTables를 활용한 문의 테이블 정렬, 검색, 페이징 기능
  - 운영 메모 기록 기능 포함
-->

<!-- ✅ CDN 링크 (최상단으로 이동) -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<!-- ✅ 상단 정보 바 -->
<div style="display: flex; justify-content: space-between; align-items: center;">
	<h3>사용자 문의 관리</h3>
	<div style="display: flex; align-items: center; gap: 10px;">
		<span style="font-weight: 500;">admin님 (관리자 모드)</span>
		<button class="btn btn-dark btn-sm">로그아웃</button>
		<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="50">
	</div>
</div>

<!-- ✅ 문의 통계 카드 -->
<div style="display: flex; gap: 20px; margin: 30px 0;">
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>총 문의 수</h5><p>25건</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>미답변 문의</h5><p>5건</p>
	</div>
	<div style="flex: 1; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1);">
		<h5>최근 문의 등록</h5><p>2025-06-13</p>
	</div>
</div>

<!-- ✅ 문의 목록 테이블 -->
<h5>문의 내역</h5>
<table id="questionTable" class="display" style="width: 100%;">
	<thead>
	<tr>
		<th>문의 번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>답변 상태</th>
		<th>관리</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>Q2025001</td>
		<td>로그인이 안 돼요</td>
		<td>user001</td>
		<td>2025-06-13</td>
		<td><span class="badge bg-warning text-dark">미답변</span></td>
		<td><button class="btn btn-sm btn-outline-primary">답변</button></td>
	</tr>
	<tr>
		<td>Q2025002</td>
		<td>충전 내역이 사라졌어요</td>
		<td>user008</td>
		<td>2025-06-12</td>
		<td><span class="badge bg-success">답변 완료</span></td>
		<td><button class="btn btn-sm btn-outline-secondary">보기</button></td>
	</tr>
	</tbody>
</table>

<!-- ✅ 운영 메모 -->
<div style="margin-top: 40px;">
	<h5>운영 메모</h5>
	<textarea placeholder="문의 응대 정책, 처리 방법 등을 기록하세요"
			  style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
	<button style="margin-top: 10px; float: right; background-color: #fcb80f; color: white; border: none; padding: 8px 16px; border-radius: 5px;">
		메모 저장
	</button>
</div>

<!-- ✅ 테이블 설정 -->
<script>
	$(document).ready(function () {
		$('#questionTable').DataTable({
			language: {
				search: "검색:",
				lengthMenu: "페이지당 _MENU_건 보기",
				info: "총 _TOTAL_건 중 _START_~_END_",
				paginate: {
					previous: "이전",
					next: "다음"
				},
				emptyTable: "등록된 문의가 없습니다.",
				zeroRecords: "일치하는 결과가 없습니다."
			}
		});
	});
</script>
