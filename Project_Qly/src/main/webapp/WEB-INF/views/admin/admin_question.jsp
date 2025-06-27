<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 문의 관리</title>

<!-- CDN -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0px;
}
.section-title {
	font-weight: bold;
	font-size: 1.2rem;
	border-left: 5px solid #6aaea7;
	padding-left: 10px;
	margin-bottom: 20px;
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
.summary-cards {
	display: flex;
	gap: 20px;
	margin: 30px 0;
	flex-wrap: wrap;
}
.step-guide-card {
	background: #f5f7ff;
	padding: 20px;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	gap: 10px;
	min-width: 200px;
}
.step-box {
	background: linear-gradient(to right, #6dc8f3, #73a1f9);
	color: white;
	padding: 10px 16px;
	border-radius: 8px;
}
.dataTables_filter label {
	display: flex;
	align-items: center;
	gap: 5px;
}
.dataTables_filter input {
	margin-left: 4px;
	padding-left: 24px;
	background-image: url('https://cdn-icons-png.flaticon.com/512/622/622669.png');
	background-size: 18px;
	background-position: 4px center;
	background-repeat: no-repeat;
}
.floating-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	background-color: #fcb80f;
	color: white;
	padding: 12px 20px;
	border-radius: 50px;
	border: none;
	font-weight: bold;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	z-index: 1000;
}
</style>
</head>
<body>

<!-- 상단 바 -->
<div class="d-flex justify-content-between align-items-center mb-4">
	<h2>사용자 문의 관리</h2>
	<div class="d-flex align-items-center gap-2">
		<span>admin님 (관리자 모드)</span>
		<button class="btn btn-dark btn-sm" onclick="location.href='<c:url value="/login/logout.do" />'">로그아웃</button>
		<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="50">
	</div>
</div>

<!-- 요약 카드 + 스텝 가이드 -->
<div class="d-flex gap-4 flex-wrap mb-5">
	<div class="d-flex flex-column gap-3" style="flex: 1;">
		<div class="card-common">
			<h5 class="section-title">총 문의 수</h5>
			<p>25건</p>
			<img src="https://cdn-icons-png.flaticon.com/512/561/561127.png" alt="문의 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 40px; opacity: 0.2;">
		</div>
		<div class="card-common">
			<h5 class="section-title">미답변 문의 수</h5>
			<p>5건</p>
			<img src="https://cdn-icons-png.flaticon.com/512/564/564619.png" alt="경고 아이콘"
				style="position: absolute; bottom: 10px; right: 10px; width: 40px; opacity: 0.2;">
		</div>
	</div>

	<div class="step-guide-card" style="min-width: 400px;">
		<div class="step-box">1. 미답변 처리<br><small style="opacity: 0.8;">답변 안 된 문의 확인</small></div>
		<div class="step-box" style="background: linear-gradient(to right, #a18cd1, #fbc2eb);">2. FAQ 등록<br><small style="opacity: 0.8;">반복 문의 정리</small></div>
		<div class="step-box" style="background: linear-gradient(to right, #ff758c, #ff7eb3);">3. 메모 작성<br><small style="opacity: 0.8;">운영 정책 기록</small></div>
	</div>
</div>


<!-- 문의 내역 테이블 -->
<div class="card p-4 mb-4">
<h5 class="section-title">문의 내역</h5>
<table id="questionTable" class="display" style="width: 100%;">
	<thead>
		<tr>
			<th>문의 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>답변 상태</th>
			<th>관리</th> <!-- 여기에 적용됨 -->
		</tr>
	</thead>
	<tbody>
		<c:forEach var="inq" items="${inquiryList}">
			<tr>
				<td>${inq.questionId}</td>
				<td>${inq.title}</td>
				<td>${inq.userId}</td>
				<td><fmt:formatDate value="${inq.createdDate}" pattern="yyyy-MM-dd" /></td>
				<td>
					<c:choose>
						<c:when test="${fn:trim(inq.answerStatus) eq '답변완료'}">
							<span class="badge bg-success">✅ 답변 완료</span>
						</c:when>
						<c:otherwise>
							<span class="badge bg-warning text-dark">⚠ 미답변</span>
						</c:otherwise>
					</c:choose>
				</td>

				<!-- ✅ 관리자 버튼 활성화 비활성화 부분-->
				<td>
				  <button
				    class="btn btn-sm btn-outline-primary"
				    data-bs-toggle="modal"
				    data-bs-target="#answerModal"
				    data-id="${inq.questionId}"
				    <c:if test="${fn:trim(inq.answerStatus) eq '답변완료'}">disabled</c:if>>
				    답변
				  </button>

				  <a href="${pageContext.request.contextPath}/inquiry/${inq.questionId}"
				     class="btn btn-sm btn-outline-secondary ms-1">
				    보기
				  </a>
				</td>
				<!-- ✅  끝 -->
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>


<!-- FAQ -->
<div class="card p-4 mb-4">
	<div class="d-flex justify-content-between align-items-center mb-2">
		<h5 class="section-title">자주 묻는 질문 관리</h5>
		<button class="btn btn-warning btn-sm">+ 새 FAQ 등록</button>
	</div>
	<table id="faqTable" class="display" style="width: 100%;">
		<thead>
			<tr>
				<th>질문</th>
				<th>답변</th>
				<th>등록일</th>
				<th>노출</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>비밀번호는 어떻게 변경하나요?</td>
				<td>마이페이지 > 내 정보 수정에서 가능합니다.</td>
				<td>2025-06-10</td>
				<td><span class="badge bg-success">ON</span></td>
				<td><button class="btn btn-sm btn-outline-secondary">수정</button>
					<button class="btn btn-sm btn-outline-danger">삭제</button></td>
			</tr>
			<tr>
				<td>충전 후 환불이 가능한가요?</td>
				<td>구매 후 7일 이내 미사용 시 환불 가능합니다.</td>
				<td>2025-06-05</td>
				<td><span class="badge bg-secondary">OFF</span></td>
				<td><button class="btn btn-sm btn-outline-secondary">수정</button>
					<button class="btn btn-sm btn-outline-danger">삭제</button></td>
			</tr>
		</tbody>
	</table>
</div>

<!-- 메모 -->
<div class="section-title">운영 메모</div>
<textarea placeholder="문의 응대 정책, 처리 방법 등을 기록하세요"
	style="width: 100%; height: 100px; padding: 10px; border-radius: 6px; border: 1px solid #ccc;"></textarea>
<button class="floating-btn">메모 저장</button>

<!-- 모달 (답변 작성) -->
<div class="modal fade" id="answerModal" tabindex="-1" aria-labelledby="answerModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="${pageContext.request.contextPath}/admin/insertqustion.do" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="answerModalLabel">답변 작성</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="questionId" id="modalQuestionId">
          <div class="mb-3">
            <label for="questionContent" class="form-label">답변 내용</label>
            <textarea class="form-control" name="questionContent" id="questionContent" rows="5" required></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">등록</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- DataTables 초기화 -->
<script>
$(document).ready(function() {
	// 기존 초기화 방지 후 재초기화
	if ($.fn.DataTable.isDataTable('#questionTable')) {
		$('#questionTable').DataTable().destroy();
	}
	$('#questionTable').DataTable({
		destroy: true,
		language: {
			search: "검색:",
			lengthMenu: "페이지당 _MENU_건 보기",
			info: "총 _TOTAL_건 중 _START_~_END_",
			paginate: { previous: "이전", next: "다음" },
			emptyTable: "등록된 문의가 없습니다.",
			zeroRecords: "일치하는 결과가 없습니다."
		}
	});

	if ($.fn.DataTable.isDataTable('#faqTable')) {
		$('#faqTable').DataTable().destroy();
	}
	$('#faqTable').DataTable({
		destroy: true,
		language: {
			search: "검색:",
			lengthMenu: "페이지당 _MENU_건 보기",
			info: "총 _TOTAL_건 중 _START_~_END_",
			paginate: { previous: "이전", next: "다음" },
			emptyTable: "등록된 FAQ가 없습니다.",
			zeroRecords: "일치하는 FAQ가 없습니다."
		}
	});

	// 모달에 questionId 값 주입
	const answerModal = document.getElementById('answerModal');
	answerModal.addEventListener('show.bs.modal', function (event) {
		const button = event.relatedTarget;
		const questionId = button.getAttribute('data-id');
		document.getElementById('modalQuestionId').value = questionId;
	});
});
</script>

</body>
</html>
