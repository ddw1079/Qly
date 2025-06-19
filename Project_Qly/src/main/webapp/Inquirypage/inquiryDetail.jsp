<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/template/menubar.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8fdfa;
	padding: 40px 0;
}

.detail-container {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
}

.detail-header {
	border-bottom: 1px solid #ddd;
	margin-bottom: 24px;
	padding-bottom: 10px;
}

.detail-title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

.detail-meta {
	font-size: 14px;
	color: #888;
}

.detail-content {
	font-size: 16px;
	line-height: 1.8;
	white-space: pre-wrap;
	margin-top: 20px;
}

.status-badge {
	font-size: 14px;
	font-weight: bold;
	padding: 6px 12px;
	border-radius: 20px;
}

.detail-container {
	max-width: 800px;
	margin: 80px auto; /* ← 기존 margin에 상단 여백 포함 */
	background-color: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
}
</style>
</head>
<body>

	<div class="detail-container">
		<div
			class="detail-header d-flex justify-content-between align-items-center">
			<div>
				<div class="detail-title">[결제 오류] 결제가 완료되지 않습니다</div>
				<div class="detail-meta mt-1">작성일: 2025-06-19 | 문의유형: 결제 오류</div>
			</div>
			<span class="status-badge bg-warning text-dark">답변 대기</span>
			<!-- ✅ 상태값에 따라 색상 변경:
         - 대기: bg-warning text-dark
         - 완료: bg-success
    -->
		</div>

		<div class="detail-content">결제를 시도했는데, 자꾸 결제 완료 후에도 상태가 대기중으로
			나옵니다. 처리 부탁드립니다.</div>

		<!-- 답변이 있다면 여기에 표시 -->
		<div class="mt-5 p-3 border rounded bg-light">
			<strong class="text-success">관리자 답변</strong>
			<div class="mt-2" style="white-space: pre-wrap;">안녕하세요, 고객님. 결제
				시스템 점검 중으로 인한 일시 오류였으며 현재 정상 처리되었습니다. 이용에 불편을 드려 죄송합니다.</div>
		</div>
	</div>

</body>
</html>
