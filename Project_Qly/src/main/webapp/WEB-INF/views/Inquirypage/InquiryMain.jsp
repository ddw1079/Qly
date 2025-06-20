<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ include file="/template/menubar.jsp"%> 

<%-- 
  ✅ QLY 고객센터 메인 페이지 (InquiryMain.jsp)
  ---------------------------------------------
  - 공지사항, FAQ(자주 묻는 질문), 1:1 문의 작성, 내 문의 보기 탭으로 구성
  - 탭 전환 방식으로 콘텐츠 영역이 바뀜 (페이지 이동 없이 JS로 처리)
  - 내 문의 보기 영역은 추후 DB 연동 가능하도록 구조 구성 (JSTL <c:forEach> 기반)
  - FAQ는 카드형 UI, 문의는 테이블 형태로 표시됨
--%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>고객센터</title> 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8fdfa;
	margin: 0;
	padding-bottom: 100px;
}

.cs-container {
	max-width: 1000px;
	margin: 80px auto 30px;
	padding: 0 20px;
}

.cs-title {
	font-size: 38px;
	font-weight: bold;
	text-align: center;
	color: #333;
}

.cs-subtitle {
	text-align: center;
	color: #666;
	font-size: 16px;
	margin-bottom: 40px;
}

.tab-buttons {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-bottom: 40px;
}

.tab-buttons button {
	background-color: white;
	border: 1.5px solid #49847e;
	color: #49847e;
	font-weight: 600;
	padding: 10px 24px;
	border-radius: 999px;
	transition: 0.2s;
}

.tab-buttons button.active, .tab-buttons button:hover {
	background-color: #49847e;
	color: white;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
}

.card-body p {
	margin-bottom: 0;
}

.form-group {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.form-group label {
	width: 100px;
	font-weight: bold;
}

.form-group select, .form-group input, .form-group textarea {
	flex: 1;
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

textarea {
	height: 200px;
	resize: vertical;
}

.btn-submit {
	display: block;
	margin-left: auto;
	background-color: #00FA9A;
	color: black;
	font-weight: bold;
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
}

.btn-submit:hover {
	background-color: #00e88e;
}
</style>
</head>
<body>
	<div class="cs-container">
		<div class="cs-title">CS CENTER</div>
		<div class="cs-subtitle">궁금한 모든 것을 확인해보세요.</div>

		<div class="tab-buttons">
			<button id="tab-notice" class="active" onclick="showTab('notice')">공지사항</button>
			<button id="tab-faq" onclick="showTab('faq')">자주 묻는 질문</button>
			<button id="tab-inquiry" onclick="showTab('inquiry')">1:1 문의</button>
			<button id="tab-my" onclick="showTab('my')">내 문의 보기</button>
		</div>

		<!-- 공지사항 -->
		<div id="notice" class="tab-content active">
			<table class="table table-hover bg-white">
				<thead class="table-light">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<tbody>
					<tr>
						<td>3</td>
						<td class="title-col"><a href="noticeDetail.jsp?id=3"
							style="text-decoration: none; color: #333;">[업데이트] QLY v2.0
								기능 개선 안내</a></td>
						<td>2025-06-15</td>
					</tr>
					<tr>
						<td>2</td>
						<td class="title-col"><a href="noticeDetail.jsp?id=2"
							style="text-decoration: none; color: #333;">[점검] 6월 20일 시스템
								정기 점검 안내</a></td>
						<td>2025-06-12</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="title-col"><a href="noticeDetail.jsp?id=1"
							style="text-decoration: none; color: #333;">[이벤트] 시스템 개선 안내</a></td>
						<td>2025-06-10</td>
					</tr>
				</tbody>

				</tbody>

			</table>
		</div>

		<!-- FAQ 카드형 -->
		<!-- FAQ -->
		<div id="faq" class="tab-content">
			<div class="row row-cols-1 row-cols-md-2 g-4">
				<!-- 카드 1 -->
				<div class="col">
					<div class="card h-100 shadow-sm">
						<div class="card-body">
							<h5 class="card-title">
								<i class="fa-solid fa-credit-card text-success me-2"></i> 결제 수단은
								어떤 것이 있나요?
							</h5>
							<p class="card-text text-muted mt-2">현재 카드 결제, 계좌 이체,
								간편결제(Qubit)를 지원합니다.</p>
						</div>
					</div>
				</div>

				<!-- 카드 2 -->
				<div class="col">
					<div class="card h-100 shadow-sm">
						<div class="card-body">
							<h5 class="card-title">
								<i class="fa-solid fa-undo text-success me-2"></i> 퀘스트를 취소하고
								싶어요.
							</h5>
							<p class="card-text text-muted mt-2">진행 전이라면 [마이페이지 > 내
								퀘스트]에서 직접 취소할 수 있습니다.</p>
						</div>
					</div>
				</div>

				<!-- 카드 3 -->
				<div class="col">
					<div class="card h-100 shadow-sm">
						<div class="card-body">
							<h5 class="card-title">
								<i class="fa-solid fa-lock text-success me-2"></i> 개인정보는 안전하게
								보호되나요?
							</h5>
							<p class="card-text text-muted mt-2">QLY는 암호화 및 보안 서버를 통해 회원
								정보를 안전하게 보호합니다.</p>
						</div>
					</div>
				</div>

				<!-- 카드 4 -->
				<div class="col">
					<div class="card h-100 shadow-sm">
						<div class="card-body">
							<h5 class="card-title">
								<i class="fa-solid fa-comment text-success me-2"></i> 수행자와 연락은
								어떻게 하나요?
							</h5>
							<p class="card-text text-muted mt-2">퀘스트 매칭 이후, 채팅 기능을 통해 직접
								소통할 수 있습니다.</p>
						</div>
					</div>
				</div>

				<!-- 카드 5 -->
				<div class="col">
					<div class="card h-100 shadow-sm">
						<div class="card-body">
							<h5 class="card-title">
								<i class="fa-solid fa-phone text-success me-2"></i> 고객센터 운영시간은
								언제인가요?
							</h5>
							<p class="card-text text-muted mt-2">평일 10:00 ~ 18:00 운영, 주말
								및 공휴일은 휴무입니다.</p>
						</div>
					</div>
				</div>

				<!-- 카드 6 -->
				<div class="col">
					<div class="card h-100 shadow-sm">
						<div class="card-body">
							<h5 class="card-title">
								<i class="fa-solid fa-user-shield text-success me-2"></i> 비매너
								사용자는 어떻게 신고하나요?
							</h5>
							<p class="card-text text-muted mt-2">리뷰 작성 시 신고 기능을 통해 신고하실 수
								있습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 1:1 문의작성 -->
<div id="inquiry" class="tab-content">
	<form action="${pageContext.request.contextPath}/inquiry/inquiry2.do" method="post">

		<!-- ✅ hidden input 추가 -->
		<input type="hidden" name="userId" value="<%= userId %>" /> 
		<input type="hidden" name="userType" value="<%= userType %>" />

		<div class="form-group">
			<label for="type">문의 유형</label>
			<select id="type" name="type" required>
				<option value="문의 유형 선택">문의 유형 선택</option>
				<option value="퀘스트 진행 방법 문의">퀘스트 진행 방법 문의</option>
				<option value="의뢰 내용 변경/수정 요청">의뢰 내용 변경/수정 요청</option>
				<option value="코인 결제 / 충전 관련 문제">코인 결제 / 충전 관련 문제</option>
				<option value="퀘스트 수행자 불만 / 신고">퀘스트 수행자 불만 / 신고</option>
				<option value="기타 문의 또는 시스템 오류 제보">기타 문의 또는 시스템 오류 제보</option>
			</select>
		</div>

		<div class="form-group">
			<label for="title">문의 제목</label>
			<input type="text" id="title" name="title" required />
		</div>

		<div class="form-group">
			<label for="content">문의 내용</label>
			<textarea id="content" name="content" required></textarea>
		</div>

		<button type="submit" class="btn-submit">등록</button>
	</form>
</div> 

		<!-- ✅ 등록 성공 메시지 출력 -->
		<c:if test="${not empty message}">
			<div class="alert alert-success text-center" role="alert"
				style="margin-top: 20px;">${message}</div>
		</c:if>
		<c:if test="${not empty message}">
			<script>
  window.addEventListener("DOMContentLoaded", function() {
    showTab('my'); // 등록 성공 시 "내 문의 보기" 탭 활성화
  });
</script>
		</c:if>


		<div class="cs-title">CS CENTER</div>
		<div class="cs-subtitle">궁금한 모든 것을 확인해보세요.</div>

		<!-- 내 문의 보기 -->
		<div id="my" class="tab-content">
			<table class="table table-bordered table-hover bg-white">
				<thead class="table-light">
					<tr>
						<th>번호</th>
						<th>문의 유형</th>
						<th>제목</th>
						<th>등록일</th>
						<th>상태</th>
						<th>상세</th>
					</tr>
				</thead>
				<tbody id="inquiryCardContainer">
					<c:forEach var="inq" items="${inquiryList}">
						<tr>
							<td>${inq.questionId}</td>
							<td>${inq.type}</td>
							<td>${inq.title}</td>
							<td>${inq.createdDate}</td>
							<td><c:choose>
									<c:when test="${inq.answerStatus eq '답변완료'}">
										<span class="badge bg-success">답변 완료</span>
									</c:when>
									<c:when test="${inq.answerStatus eq '미답변'}">
										<span class="badge bg-warning text-dark">미답변</span>
									</c:when>
									<c:otherwise>
										<span class="badge bg-danger">에러 상태</span>
										<%-- 예외 처리용 --%>
									</c:otherwise>
								</c:choose></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
  function showTab(tabId) {
    document.querySelectorAll(".tab-buttons button").forEach(btn => btn.classList.remove("active"));
    document.getElementById("tab-" + tabId).classList.add("active");

    document.querySelectorAll(".tab-content").forEach(el => el.classList.remove("active"));
    document.getElementById(tabId).classList.add("active");
  }

  function submitInquiry(event) {
    event.preventDefault();
    const type = document.getElementById("type").value;
    const title = document.getElementById("title").value.trim();
    const content = document.getElementById("content").value.trim();

    if (!type || !title || !content) {
      alert("모든 항목을 입력해주세요.");
      return;
    }

    alert("문의가 등록되었습니다.");
    showTab('my');

    document.getElementById("type").value = "";
    document.getElementById("title").value = "";
    document.getElementById("content").value = "";
  }
  
  
</script>
</body>
</html>