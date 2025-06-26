<!-- QLY 리디자인 버전: 로고 그래픽 강조 + 섹션 분할 라운드 물결형 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/template/menubar.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QLY - 누구나 요청하고 누구나 도와주는</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #ffffff;
	color: #333;
}

.container-fixed {
	max-width: 1100px;
	margin: 0 auto;
	padding: 0 20px;
}

.hero-section {
	background: linear-gradient(to bottom right, #e6fffb, #f4ffff);
	padding: 100px 0;
}

.hero-inner {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
}

.hero-text {
	max-width: 500px;
}

.hero-text h1 {
	font-size: 3rem;
	font-weight: 700;
	line-height: 1.4;
	color: #111;
}

.hero-text p {
	font-size: 1.1rem;
	margin-top: 20px;
	color: #00a88b;
}

.hero-img {
	position: relative;
	width: 440px;
	height: 440px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.logo-gradient-glow {
	position: absolute;
	width: 600px;
	height: 600px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(0, 255, 230, 0.4) 0%,
		rgba(0, 255, 230, 0.1) 50%, rgba(255, 255, 255, 0) 80%);
	z-index: 0;
}

.logo-white-circle {
	width: 380px;
	height: 380px;
	border-radius: 50%;
	background: #ffffff;
	border: 5px solid #00d4b4;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 1;
	position: relative;
	box-shadow: 0 0 12px rgba(0, 168, 139, 0.1);
}

.hero-img img {
	width: 360px;
	height: 360px;
	z-index: 2;
}

.section-title-wrap {
	text-align: center;
	margin-top: 100px;
	margin-bottom: 40px;
}

.section-title {
	display: inline-block;
	font-size: 1.8rem;
	color: #00a88b;
	font-weight: bold;
	padding: 14px 28px;
	border: 3px solid #00c9a7;
	border-radius: 50px;
	background-color: #ffffff;
	box-shadow: 0 4px 12px rgba(0, 168, 139, 0.15);
}

.feature-box {
	flex: 1 1 calc(33.333% - 30px);
	background: #fff;
	border-radius: 16px;
	padding: 30px;
	box-shadow: 0 6px 20px rgba(0, 168, 139, 0.15);
	text-align: center;
	transition: transform 0.2s ease, box-shadow 0.3s ease;
}

.feature-box:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 24px rgba(0, 168, 139, 0.2);
}

.feature-section {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	margin: 60px 0;
	gap: 30px;
}

.wave-divider {
	position: relative;
	top: 1px;
	line-height: 0;
	background: transparent;
}

.wave-divider svg {
	display: block;
	width: 100%;
	height: 100px;
}

.footer-section {
	background: linear-gradient(to right, #00c9a7, #00a88b);
	color: white;
	padding: 80px 0;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
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

	<!-- ✅ 히어로 영역 -->
	<section class="hero-section">
		<div class="container-fixed hero-inner">
			<div class="hero-text">
				<h1>
					누구나 요청하고,<br>누구나 도와주는<br>생활 퀘스트 플랫폼 QLY
				</h1>
				<p>복잡한 일상 속 사소한 요청까지도 QLY가 해결을 도와드립니다.</p>
			</div>
			<div class="hero-img">
				<div class="logo-gradient-glow"></div>
				<div class="logo-white-circle">
					<img src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="QLY 로고">
				</div>
			</div>
		</div>
	</section>

	<!-- ✅ 기능 설명 -->
	<section class="container-fixed">
		<div class="section-title-wrap">
			<h2 class="section-title">QLY에서 가능한 모든 것</h2>
		</div>
		<div class="feature-section">
			<div class="feature-box">
				<h5>간단한 요청 등록</h5>
				<p>번거로운 작업을 쉽게 등록하고 도움을 받을 수 있어요.</p>
			</div>
			<div class="feature-box">
				<h5>신뢰 기반 매칭</h5>
				<p>평점과 후기 기반으로 신뢰할 수 있는 프로를 매칭해요.</p>
			</div>
			<div class="feature-box">
				<h5>보상과 만족</h5>
				<p>큐빗 시스템으로 명확한 보상이 보장됩니다.</p>
			</div>
		</div>
	</section>
	<!-- ✅ 소개 섹션 -->
	<section style="text-align: center; margin: 80px 0 40px;">
		<h2 style="font-size: 2rem; font-weight: bold; color: #00a88b;">
			함께 만들어가는 일상의 연결</h2>
		<p style="font-size: 1.1rem; color: #555; margin-top: 16px;">소소한
			요청부터 진심어린 도움까지, QLY는 모두가 함께하는 연결의 시작입니다.</p>
	</section>


	<!-- ✅ 물결형 분할 SVG -->
	<div style="margin-top: -50px; position: relative; z-index: 1;">
		<svg viewBox="0 0 1440 150" preserveAspectRatio="none"
			style="display: block; width: 100%; height: 100px;">
    <path fill="#00c9a7" fill-opacity="1"
				d="M0,64L60,58.7C120,53,240,43,360,53.3C480,64,600,96,720,112C840,128,960,128,1080,117.3C1200,107,1320,85,1380,74.7L1440,64L1440,160L1380,160C1320,160,1200,160,1080,160C960,160,840,160,720,160C600,160,480,160,360,160C240,160,120,160,60,160L0,160Z"></path>
  </svg>
	</div>

	<!-- ✅ 브랜드 철학 -->
	<section class="footer-section">
		<div class="container-fixed">
			<h2>우리의 철학</h2>
			<p>
				도움이 필요한 이와 돕고자 하는 이가 자연스럽게 연결되어<br>누구도 소외되지 않는 세상을 만듭니다.
			</p>
		</div>
	</section>

</body>
</html>