<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="com.qly.quest.Quest, java.util.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/template/menubar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
			<!-- 3개씩 표시 -->

			<c:forEach var="quest" items="${questList}">
				<div class="col quest-card">
					<div class="card shadow-sm p-3 h-100">
						<!-- 이미지 추가 -->
						<img src="${pageContext.request.contextPath}${quest.photoPath}"
							alt="${quest.title}" class="img-fluid mb-3" />

						<%-- <img src="${quest.imageUrl}" class="card-img-top mb-3"
							alt="퀘스트 이미지" style="height: 180px; object-fit: cover;"> --%>
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
							<span class="fw-bold">등록일:</span> ${quest.regDate}
						</div>
						<div class="text-end">
							<button class="btn btn-sm"
								style="background-color: #00FA9A; color: black;"
								onclick="location.href=' .... ' ">상세보기</button>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>

</body>
</html>
