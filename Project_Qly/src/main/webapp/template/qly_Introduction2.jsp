<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/template/menubar.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QLY 팀 소개</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #ffffff;
	margin: 0;
	padding: 0;
	color: #333;
}

.container-fixed {
	max-width: 1100px;
	margin: 0 auto;
	padding: 0 20px;
}

.hero-section {
	background: #e6fffb;
	padding: 100px 0 40px;
	text-align: center;
}

.hero-section h1 {
	font-size: 2.6rem;
	font-weight: bold;
	color: #00a88b;
}

.hero-section p {
	font-size: 1.1rem;
	margin-top: 20px;
	color: #555;
}

.team-section {
	padding: 60px 0;
	background-color: #fff;
}
.team-leader {
  background: #f8fefe;
  padding: 40px;
  width: 900px;
  display: flex;
  align-items: center;
  gap: 40px;
  border-radius: 40px;
  box-shadow: 0 4px 12px rgba(0, 168, 139, 0.15);
}
.team-leader img {
  width: 160px;
  height: 160px;
  border-radius: 50%;
  border: 4px solid #00c9a7;
}
.team-leader h5 {
  font-size: 1.5rem;
}
.team-member {
	background: #f8fefe;
	padding: 30px;
	width: 600px;
	box-shadow: 0 4px 12px rgba(0, 168, 139, 0.15);
	display: flex;
	align-items: center;
	gap: 20px;
}

.team-member img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	border: 4px solid #00c9a7;
}

.badge-bubble {
	display: inline-block;
	background: #00c9a7;
	color: white;
	font-weight: bold;
	padding: 6px 12px;
	border-radius: 30px;
	font-size: 0.9rem;
	margin-bottom: 8px;
}

.team-member h5 {
	margin: 0;
	font-size: 1.2rem;
	font-weight: bold;
}

.team-member p {
	font-size: 0.95rem;
	color: #555;
}

.team-member.left {
	border-top-right-radius: 40px;
	border-bottom-right-radius: 40px;
	border-top-left-radius: 12px;
	border-bottom-left-radius: 12px;
}

.team-member.right {
	flex-direction: row-reverse;
	border-top-left-radius: 40px;
	border-bottom-left-radius: 40px;
	border-top-right-radius: 12px;
	border-bottom-right-radius: 12px;
}

.wave-divider {
	margin-top: -50px;
}

.footer-section {
	background: linear-gradient(to right, #00c9a7, #00a88b);
	color: white;
	padding: 80px 0;
	text-align: center;
}

.footer-section h2 {
	font-size: 2rem;
	font-weight: bold;
}

.footer-section p {
	font-size: 1.1rem;
	margin-top: 20px;
	opacity: 0.9;
}
</style>
</head>
<body>

	<!-- ✅ 히어로 배너 -->
	<section class="hero-section">
		<div class="container-fixed">
			<h1>OUR TEAM</h1>
			<p>
				QLY는 “누구나 요청하고, 누구나 도와주는” 생활 퀘스트 플랫폼입니다.<br> 다양한 전문성과 따뜻한 협업을
				통해, 더 나은 일상을 함께 만듭니다.
			</p>
		</div>
	</section>

<!-- ✅ 팀장 영역 -->
<section class="team-section">
  <div class="container-fixed">
    <div class="d-flex justify-content-center mb-5">
      <div class="team-leader">
        <img src="https://i.postimg.cc/9fZSgvgP/Kakao-Talk-20250626-171806231.jpg" alt="팀장">
        <div>
          <div class="badge-bubble">팀장</div>
          <h5>김희상</h5>
          <p>
            <strong>Product Manager</strong><br>
            사용자 중심의 전략 기획과 로드맵 설계를 담당합니다.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>


	<!-- ✅ 팀원 지그재그 -->
	<section class="team-section">
		<div class="container-fixed">

			<!-- 팀원 1 -->
			<div class="d-flex justify-content-start mb-5">
				<div class="team-member left">
					<img src="https://i.postimg.cc/XYDsLGw7/user2.png"
						alt="UX Designer">
					<div>
						<div class="badge-bubble">UX 설계</div>
						<h5>조형진</h5>
						<p>
							<strong>UX Designer</strong><br> 문제 해결 중심의 UX 설계와 사용자 흐름
							최적화를 맡습니다.
						</p>
					</div>
				</div>
			</div>

			<!-- 팀원 2 -->
			<div class="d-flex justify-content-end mb-5">
				<div class="team-member right">
					<img src="https://i.postimg.cc/sg2b6Z8j/user3.png"
						alt="Frontend Engineer">
					<div>
						<div class="badge-bubble">프론트엔드</div>
						<h5>정종일</h5>
						<p>
							<strong>Frontend Engineer</strong><br> React 기반 인터페이스 구현과
							사용자 경험 개선을 담당합니다.
						</p>
					</div>
				</div>
			</div>

			<!-- 팀원 3 -->
			<div class="d-flex justify-content-start mb-5">
				<div class="team-member left">
					<img src="https://i.postimg.cc/4xNgRMHk/user4.png"
						alt="Backend Engineer">
					<div>
						<div class="badge-bubble">백엔드</div>
						<h5>박윤재</h5>
						<p>
							<strong>Backend Engineer</strong><br> API 설계 및 서버 로직 구현, 데이터
							흐름 관리를 담당합니다.
						</p>
					</div>
				</div>
			</div>

			<!-- 팀원 4 -->
			<div class="d-flex justify-content-end mb-5">
				<div class="team-member right">
					<img src="https://i.postimg.cc/dtdr1qVs/user5.png"
						alt="Marketing & Strategy">
					<div>
						<div class="badge-bubble">마케팅</div>
						<h5>김성진</h5>
						<p>
							<strong>Marketing & Strategy</strong><br> 콘텐츠 기획과 서비스 브랜딩,
							커뮤니케이션 전략을 이끕니다.
						</p>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- ✅ 물결형 분할 -->
	<div class="wave-divider">
		<svg viewBox="0 0 1440 150" preserveAspectRatio="none"
			style="display: block; width: 100%; height: 100px;">
      <path fill="#00c9a7" fill-opacity="1"
				d="M0,64L60,58.7C120,53,240,43,360,53.3C480,64,600,96,720,112C840,128,960,128,1080,117.3C1200,107,1320,85,1380,74.7L1440,64L1440,160L1380,160C1320,160,1200,160,1080,160C960,160,840,160,720,160C600,160,480,160,360,160C240,160,120,160,60,160L0,160Z">
      </path>
    </svg>
	</div>

	<!-- ✅ 브랜드 철학 -->
	<section class="footer-section">
		<div class="container-fixed">
			<h2>우리가 만드는 가치</h2>
			<p>모두의 일상 속, 요청과 도움이 자연스럽게 오가는 세상을 함께 만듭니다.</p>
		</div>
	</section>

</body>
</html>
