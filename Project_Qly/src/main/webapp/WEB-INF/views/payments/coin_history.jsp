<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/template/menubar.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>고용 코인 및 히스토리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- ✅ Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- ✅ DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<!-- ✅ Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coin_history.css" type="text/css"/>

</head>
<body>
	<%
	com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");
	%>

	<div id="modalContainer">
		<jsp:include page="../template/coin_charge.jsp" />
	</div>

	<div class="container my-5">
		<h2 class="mb-4">코인 정보</h2>
		<div class="card p-4">
			<div class="mb-4 row">
				<div class="col-lg d-flex justify-content-start align-items-center">
					<span class="fs-4 fw-bold">보유 코인: <%=loginUser.getTotalTokens()%>
						코인
					</span>
				</div>
				<div class="col-lg d-flex align-items-center justify-content-end">
					<button class="btn btn-mint"
						onclick="$('#chargeCoinModal').modal('show');">
						<i class="bi bi-plus-circle me-2"></i>코인 충전하기
					</button>
				</div>
			</div>

			<ul class="nav nav-tabs" id="coinTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="holdings-tab"
						data-bs-toggle="tab" data-bs-target="#holdings" type="button"
						role="tab">코인 내역</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="history-tab" data-bs-toggle="tab"
						data-bs-target="#history" type="button" role="tab">충전 내역</button>
				</li>
			</ul>

			<div class="tab-content mt-3" id="coinTabContent">
				<div class="tab-pane fade show active" id="holdings" role="tabpanel"
					aria-labelledby="holdings-tab">
					<table id="coinTable" class="table table-bordered table-hover">
						<thead class="table-success">
							<tr>
								<th>일자</th>
								<th>수량</th>
								<th>거래 유형</th>
								<th>잔여 코인</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ch1" items="${coinHistories}">
								<tr>
									<td><fmt:formatDate value="${ch1.transactionDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
									<td><c:choose>
											<c:when test="${ch1.amount > 0}">
												<span class="text-danger">+</span> ${ch1.amount} 코인</c:when>
											<c:otherwise>
												<span class="text-primary">-</span> ${Math.abs(ch1.amount)} 코인</c:otherwise>
										</c:choose></td>
									<td>${ch1.type}</td>
									<td>${ch1.remainCoin}</td>
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="tab-pane fade" id="history" role="tabpanel"
					aria-labelledby="history-tab">
					<table id="paymentTable" class="table table-striped">
						<thead class="table-success">
							<tr>
								<th>일자</th>
								<th>상세</th>
								<th>결제 상황</th>
								<th>결제 금액</th>
								<th>충전 수량</th>
								<th>잔여 코인</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ch2" items="${paymentHistories}">
								<tr>
									<td><fmt:formatDate value="${ch2.paymentDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
									<td>${ch2.type}</td>
									<td>${ch2.status}</td>
									<td class="text-end">${(ch2.amount * 10).intValue()}원</td>
									<td class="text-end">${ch2.amount.intValue()}코인</td>
									<td class="text-end">${ch2.remainCoin}코인</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<c:if test="${not empty chargeMessage}">
			<div class="toast" role="alert" aria-live="assertive"
				aria-atomic="true">
				<div class="toast-header">
					<strong class="me-auto">결제 완료 알림!</strong>
					<button type="button" class="btn-close" data-bs-dismiss="toast"
						aria-label="Close"></button>
				</div>
				<div class="toast-body">${chargeMessage}</div>
			</div>
		</c:if>
	</div>

	<div class="container mt-4">
		<div class="row g-4">
			<div class="col-md-6">
				<div class="card-box" style="background-color: #e8f9f7;">
					<div>
						<div class="card-title">
							<i class="bi bi-bullseye"></i> <span style="margin-left: 8px;">하루
								한 퀘스트 도전!</span>
						</div>
						<ul class="card-content mt-2">
							<li>오늘의 퀘스트, 지금 확인하고 도전하세요!</li>
							<li>완료 시 즉시 토큰 보상 지급</li>
							<li>매일 새로운 미션 갱신</li>
						</ul>
					</div>
					<a href="#" class="card-button">퀘스트 확인하기</a>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card-box" style="background-color: #fffbe6;">
					<div style="display: flex; align-items: center;">
						<img src="https://i.postimg.cc/G25vGkcZ/quest.png"
							class="card-icon" alt="등록 아이콘">
						<div>
							<div class="card-title">퀘스트 등록하러 가볼까요?</div>
							<div class="card-content mt-2">지금 바로 나만의 퀘스트를 만들어 보세요!</div>
						</div>
					</div>
					<a href="#" class="card-button btn-yellow">퀘스트 등록하기</a>
				</div>
			</div>
		</div>
	</div>




	<!-- ✅ FAQ/문의는 아래로 이동 -->
	<div class="container mt-5">
		<div class="row g-4">
			<div class="col-md-6">
				<div class="p-4 border rounded shadow-sm bg-light h-100">
					<div class="d-flex align-items-center mb-3">
						<i class="bi bi-question-circle-fill fs-4 text-mint me-2"></i>
						<div>
							<h6 class="mb-1 fw-bold">코인 관련 문의</h6>
							<small class="text-muted">충전, 이력 등 궁금한 점은 고객센터로</small>
						</div>
					</div>
					<a href="${pageContext.request.contextPath}/inquiry/form#inquiry"
						class="btn btn-mint-filled w-100 mt-3">1:1 문의하기</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="p-4 border rounded shadow-sm bg-light h-100">
					<div class="d-flex align-items-center mb-3">
						<i class="bi bi-info-circle-fill fs-4 text-mint me-2"></i>
						<div>
							<h6 class="mb-1 fw-bold">FAQ 자주 묻는 질문</h6>
							<small class="text-muted">궁금한 내용을 빠른시간에 찾아보세요</small>
						</div>
					</div>
					<a href="${pageContext.request.contextPath}/inquiry/form#faq"
						class="btn btn-mint-filled w-100 mt-3">자주 묻는 질문 보기</a>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#coinTable').DataTable({
				language : {
					emptyTable : "결과가 없습니다.",
					zeroRecords : "검색 결과가 없습니다.",
					info : "총 _TOTAL_개의 결과 중 _START_부터 _END_까지 표시",
					infoEmpty : "검색 결과가 없습니다.",
					infoFiltered : "(전체 _MAX_개 중 필터링됨)",
					paginate : {
						first : "첫번째",
						last : "마지막",
						next : "다음",
						previous : "이전"
					}
				}
			});
			$('#paymentTable').DataTable({
				language : {
					emptyTable : "결과가 없습니다.",
					zeroRecords : "검색 결과가 없습니다.",
					info : "총 _TOTAL_개의 결과 중 _START_부터 _END_까지 표시",
					infoEmpty : "검색 결과가 없습니다.",
					infoFiltered : "(전체 _MAX_개 중 필터링됨)",
					paginate : {
						first : "첫번째",
						last : "마지막",
						next : "다음",
						previous : "이전"
					}
				}
			});
		});
	</script>
</body>
</html>
