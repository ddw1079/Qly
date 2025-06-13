<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인 정보</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 스타일 -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
        }
        h2 {
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
        label {
            font-weight: 500;
        }
        .card {
            border-radius: 0.75rem;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
        }
    </style>
</head>
<div style="display: flex; justify-content: space-between; align-items: center;">
	<h3>정보 조회</h3>
	<div style="display: flex; align-items: center; gap: 10px;">
		<span style="font-weight: 500;">admin님 (의뢰인 모드)</span>
		<button class="btn btn-dark btn-sm">로그아웃</button>
		<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="프로필" width="50">
	</div>
</div>
<body style="min-height: 100vh; background-color: #f1f2f6;">
<div class="container-fluid p-5">
  <div class="card w-100" style="max-width: 1200px; margin: auto; padding: 2rem;">
    <h4 class="fw-bold mb-4">개인정보 조회</h4>
    <form>
      <div class="mb-4 row align-items-center">
        <label for="name" class="col-sm-2 col-form-label fs-5 fw-semibold">이름</label>
        <div class="col-sm-10">
          <input type="text" readonly class="form-control form-control-lg" id="name" value="홍길동">
        </div>
      </div>

      <div class="mb-4 row align-items-center">
        <label for="phone" class="col-sm-2 col-form-label fs-5 fw-semibold">전화번호</label>
        <div class="col-sm-10">
          <input type="text" readonly class="form-control form-control-lg" id="phone" value="010-1234-5678">
        </div>
      </div>

      <div class="mb-4 row align-items-center">
        <label for="address" class="col-sm-2 col-form-label fs-5 fw-semibold">주소</label>
        <div class="col-sm-10">
          <input type="text" readonly class="form-control form-control-lg" id="address" value="서울특별시 강남구 테헤란로 123">
        </div>
      </div>

      <div class="mb-4 row align-items-center">
        <label for="email" class="col-sm-2 col-form-label fs-5 fw-semibold">이메일</label>
        <div class="col-sm-10">
          <input type="email" readonly class="form-control form-control-lg" id="email" value="honggildong@example.com">
        </div>
      </div>
    </form>
  </div>
</div>

</body>

</html>
