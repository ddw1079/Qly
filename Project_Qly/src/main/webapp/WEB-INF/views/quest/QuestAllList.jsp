<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="com.qly.quest.Quest, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/template/menubar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴스트 목록</title>

<!-- ✅ Bootstrap & jQuery -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background: linear-gradient(to bottom right, #eafffa, #ffffff);
}

.hero-section {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 60px 20px 40px;
	flex-wrap: wrap;
	gap: 40px;
	text-align: center;
}

.hero-left {
	flex: 1;
	min-width: 320px;
}

.hero-right {
	flex: 1;
	min-width: 320px;
	text-align: center;
}

.hero-title {
	font-size: 2.4rem;
	font-weight: 700;
	margin-bottom: 10px;
	color: #1a1a1a;
}

.mint-gradient-text {
	background: linear-gradient(to right, #02665b, #004d44, #002d29);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	font-weight: 800;
	font-size: 2.8rem;
	line-height: 1.4;
	text-shadow: 0 1px 3px rgba(0, 50, 45, 0.15);
}

.hero-desc {
	font-size: 1rem;
	color: #444;
	margin-bottom: 30px;
}

.search-bar {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	margin-bottom: 30px;
}

.search-bar input {
	border: 2px solid #00c7ae;
	border-radius: 30px;
	padding: 12px 18px 12px 40px;
	font-size: 16px;
	width: 100%;
	max-width: 420px;
	background: url('https://cdn-icons-png.flaticon.com/512/751/751463.png')
		no-repeat 12px center;
	background-size: 20px;
	box-shadow: 0 4px 10px rgba(0, 199, 174, 0.1);
}

.register-circle-btn {
	display: inline-block;
	background-color: #ffffff;
	color: #00b39e;
	border: 2px solid #00c7ae;
	border-radius: 100px;
	padding: 12px 28px;
	font-size: 16px;
	font-weight: 600;
	text-decoration: none;
	box-shadow: 0 4px 10px rgba(0, 199, 174, 0.15);
	transition: all 0.3s ease;
}

.register-circle-btn:hover {
	background-color: #00c7ae;
	color: white;
	box-shadow: 0 6px 16px rgba(0, 199, 174, 0.3);
}

.card-section {
	margin-top: 20px;
	padding: 60px 30px;
	background: #ffffffee;
	backdrop-filter: blur(6px);
	border-radius: 24px;
	box-shadow: 0 12px 36px rgba(0, 0, 0, 0.08); /* 그림자 더 진하게 */
	max-width: 1300px;
	margin-left: auto;
	margin-right: auto;
}

.quest-card .card {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 20px;
	box-shadow: 0 12px 36px rgba(0, 0, 0, 0.14); /* 카드 그림자 진하게 */
	padding: 20px;
	height: 100%;
	transition: 0.3s;
	border: 1.5px solid #00c7ae;
}

.quest-card .card:hover {
	transform: translateY(-6px);
	box-shadow: 0 18px 48px rgba(0, 0, 0, 0.25);
}

.card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 14px;
	margin-bottom: 15px;
}

.badge-category {
	display: inline-block;
	background-color: #e0f7f4;
	color: #00a693;
	padding: 4px 12px;
	border-radius: 20px;
	font-size: 14px;
	font-weight: 500;
	margin-bottom: 10px;
}

.info-line {
	display: flex;
	align-items: center;
	margin-bottom: 6px;
	font-size: 15px;
	color: #333;
}

.info-line span.label {
	font-weight: bold;
	width: 70px;
	color: #555;
}

.status-dot {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 8px;
}

.dot-waiting {
	background-color: #6c757d;
}

.dot-progress {
	background-color: #ffc107;
}

.dot-complete {
	background-color: #28a745;
}

.btn-mint {
	background-color: #00c7ae;
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 6px 18px;
	font-weight: 500;
	margin-top: 16px;
	transition: background-color 0.2s ease;
}

.btn-mint:hover {
	background-color: #00b39e;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("searchInput2");
  const cards = document.querySelectorAll(".quest-card");

  searchInput.addEventListener("keyup", function () {
    const keyword = this.value.toLowerCase().trim();
    cards.forEach(card => {
      const title = card.querySelector(".title-text")?.innerText.toLowerCase() || "";
      const content = card.querySelector(".content-text")?.innerText.toLowerCase() || "";
      const category = card.querySelector(".badge-category")?.innerText.toLowerCase() || "";

      if (title.includes(keyword) || content.includes(keyword) || category.includes(keyword)) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });
  });
});
</script>

</head>
<body>
	<!-- ✅ Hero Section -->
	<div
		style="display: flex; justify-content: center; align-items: center; padding: 60px 0;">
		<div
			style="max-width: 1200px; width: 100%; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 40px;">

			<!-- 🔹 왼쪽 텍스트 영역 -->
			<div style="flex: 1; min-width: 300px;">
				<p class="mint-gradient-text" style="margin-bottom: 12px;">
					당신에게 꼭 맞는<br> 퀘스트를 찾아보세요
				</p>
				<p
					style="font-size: 1.1rem; color: #666; letter-spacing: 0.5px; line-height: 1.7; margin-bottom: 32px;">
					누구나 요청하고 누구나 도움을 주는<br> 생활 퀘스트 플랫폼 QLY
				</p>
				<a href="${pageContext.request.contextPath}/quest/registerForm.do"
					class="register-circle-btn"
					style="box-shadow: 0 6px 16px rgba(0, 199, 174, 0.25); font-weight: 600;">
					퀘스트 등록하러 가볼까요? </a>
			</div>

			<!-- 🔹 오른쪽 이미지 -->
			<div style="flex: 1; min-width: 300px; text-align: center;">
				<img
					src="https://i.postimg.cc/qqZQyJB4/family-caring-about-environment.png"
					alt="외부 이미지"
					style="max-width: 100%; height: auto; border-radius: 20px;">
			</div>

		</div>
	</div>

	<!-- ✅ 카드 섹션 -->
	<div class="container card-section"
		style="position: relative; margin-top: -20px; z-index: 1;">
		<!-- ✅ 검색창 다시 한 번 아래 배치 -->
		<div style="text-align: center; margin-bottom: 30px;">
			<input type="text" id="searchInput2" class="form-control"
				placeholder="🔍 퀘스트 제목, 내용, 카테고리 검색"
				style="width: 100%; max-width: 480px; margin: 0 auto; height: 46px; padding: 10px 18px; border-radius: 24px; border: 1px solid #00c7ae; box-shadow: 0 6px 12px rgba(0, 199, 174, 0.1);">
		</div>

		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="quest" items="${questList}">
				<div class="col quest-card">
					<div class="card">
						<c:if test="${not empty quest.photoPath}">
							<img src="${quest.photoPath}" alt="퀘스트 이미지">
						</c:if>
						<div class="badge-category">[${quest.category}]</div>
						<div class="info-line">
							<span class="label">제목:</span> <span
								class="status-dot ${quest.status == '대기중' ? 'dot-waiting' : quest.status == '진행중' ? 'dot-progress' : 'dot-complete'}"></span>
							<span class="title-text">${quest.title}</span>
						</div>
						<div class="info-line content-text">
							<span class="label">내용:</span> ${quest.content}
						</div>
						<div class="info-line">
							<span class="label">신청자:</span> ${quest.applicantCount}명
						</div>
						<div class="info-line">
							<span class="label">등록일:</span>
							<fmt:formatDate value="${quest.regDate}" pattern="yyyy년 M월 d일" />
						</div>
						<div class="text-center">
							<button class="btn btn-mint"
								onclick="location.href='${pageContext.request.contextPath}/quest/particularForm.do?questId=${quest.questId}'">
								상세보기</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>