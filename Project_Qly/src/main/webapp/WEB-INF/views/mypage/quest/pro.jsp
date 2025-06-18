<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>마이 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  <script>
 
  $(document).ready(function () {
    $(".quest-item").on("click", function () {
      const page = $(this).data("page");
      $("#mainContainer").load(page); // 해당 JSP 파일을 mainContainer에 삽입
    });
  });

  </script>
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }
    .sidebar {
      position: relative;
      min-height: 100vh;
      background-color: #add8e6;
      padding: 2rem;
    }
    .profile-img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%;
    }
    .logout-btn {
      position: absolute;
      bottom: 2rem;
      left: 1rem;
      width: calc(100% - 2rem);
    }
  </style>
</head>
<body>

<!-- 상단 헤더 -->
<nav class="navbar navbar-light bg-light px-3">
  <span class="navbar-brand mb-0 h5">
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="로고" width="30" class="me-2">
    세상에 문제는 많지만 해결사는 하나라능~
  </span>
</nav>

<!-- 본문 -->
<div class="container-fluid">
  <div class="row">

    <!-- 사이드바 -->
    <div class="col-md-3 sidebar position-relative">
      <div class="text-center">
        <img src="https://via.placeholder.com/100" alt="프로필" class="profile-img mb-2">
        <h6>Jane</h6>
      </div>

      <div class="mt-4">
        <button class="btn btn-outline-secondary w-100 mb-2">의뢰인</button>
        <button class="btn btn-outline-secondary w-100 mb-3">해결사</button>

        <!-- 기본 메뉴 -->
<ul class="list-group">
  <li class="list-group-item">정보수정</li>

  <!-- 내 퀘스트 -->
  <li class="list-group-item p-0 border-0">
    <div class="px-3 py-2 border-bottom"
         data-bs-toggle="collapse"
         data-bs-target="#questSubMenu"
         aria-expanded="false"
         aria-controls="questSubMenu"
         style="cursor: pointer;">
      내 퀘스트
    </div>
    <div class="collapse" id="questSubMenu">
      <ul class="list-group list-group-flush ms-3" style="background-color: #add8e6;">
        <li class="list-group-item">해결 내역</li>
        <li class="list-group-item">퀘스트 신청 목록</li>
      </ul>
    </div>
  </li>

  <!-- 내 코인 보기 -->
  <li class="list-group-item p-0 border-0">
    <div class="px-3 py-2 border-bottom"
         data-bs-toggle="collapse"
         data-bs-target="#coinSubMenu"
         aria-expanded="false"
         aria-controls="coinSubMenu"
         style="cursor: pointer;">
      내 코인 보기
    </div>
    <div class="collapse" id="coinSubMenu">
      <ul class="list-group list-group-flush ms-3" style="background-color: #add8e6;">
        <li class="list-group-item">코인 잔액</li>
        <li class="list-group-item">충전/출금 내역</li>
      </ul>
    </div>
  </li>
</ul>



      <button class="btn btn-dark logout-btn">회원탈퇴</button>
    </div>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="col-md-9 p-4">
      <h3>컨테이너</h3>
      <p>이곳에 유저의 정보를 동적으로 출력할 수 있습니다.</p>
    </div>

  </div>
</div>

</body>
</html>
