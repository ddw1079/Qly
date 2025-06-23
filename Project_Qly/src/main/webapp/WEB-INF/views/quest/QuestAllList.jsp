<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="com.qly.quest.Quest, java.util.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/template/menubar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
.status-dot {
	display: inline-block;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	margin-right: 6px;
	vertical-align: middle;
}

.dot-waiting {
	background-color: #000;
}

.dot-progress {
	background-color: #ffc107;
}

.dot-complete {
	background-color: #28a745;
}

/* 카드 높이 통일 */
.card {
	min-height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

/* 이미지 고정 높이 및 정렬 */
.card img {
	height: 300px;
	object-fit: cover;
	border-radius: 6px;
}
</style>

<script>
	$(function() {
		$("#searchInput").on("keyup", function() {
			const keyword = $(this).val().toLowerCase();
			$(".quest-card").each(function() {
				$(this).toggle($(this).text().toLowerCase().includes(keyword));
			});
		});
	});
</script>
</head>
<body>

	<div class="container my-4">
		<div class="d-flex justify-content-center mb-4">
			<input type="text" id="searchInput" class="form-control"
				placeholder="제목" style="max-width: 400px; border-radius: 12px;">
		</div>

		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="quest" items="${questList}">
				<div class="col quest-card">
					<div class="card shadow-sm p-3">

						<!-- 이미지 -->
						<c:if test="${not empty quest.photoPath}">
							<img src="${quest.photoPath}" class="card-img-top mb-3"
								alt="퀘스트 이미지" />
						</c:if>

						<!-- 카드 본문 -->
						<div
							class="card-body d-flex flex-column justify-content-between p-0">

							<!-- 퀘스트 정보 -->
							<div>
								<div class="mb-2">
									<span class="fw-bold">[카테고리]</span> ${quest.category}
								</div>
								<div class="mb-2 d-flex align-items-center">
									<div
										class="status-dot 
										${quest.status == '대기중' ? 'dot-waiting' : 
										  quest.status == '진행중' ? 'dot-progress' : 
										  quest.status == '완료' ? 'dot-complete' : ''}"
										title="${quest.status}"></div>
									<span class="fw-bold me-1">제목:</span> ${quest.title}
								</div>
								<div class="mb-2">
									<span class="fw-bold">신청자:</span> ${quest.applicantCount}명
								</div>
								<div class="mb-3">
									<span class="fw-bold">등록일:</span>
									<fmt:formatDate value="${quest.regDate}" pattern="yyyy년 M월 d일" />
								</div>
							</div>

							<!-- 하단 버튼 -->
							<div class="text-end mt-auto">
								<button class="btn btn-sm"
									style="background-color: #00FA9A; color: black;"
									onclick="location.href='${pageContext.request.contextPath}/quest/particularForm.do?questId=${quest.questId}'">
									상세보기</button>
							</div>
						</div>
						<!-- card-body 끝 -->

					</div>
					<!-- card 끝 -->
				</div>
				<!-- col 끝 -->
			</c:forEach>
		</div>
	</div>

</body>
</html>
