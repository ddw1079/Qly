<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
  const contextPath = "${pageContext.request.contextPath}"; // = /Qly

  $(document).ready(function () {
    $("#mainContainer").load(contextPath + "/mypage/contents/personal_info.jsp");

    $(".submenu-link").on("click", function (e) {
      e.preventDefault();
      const page = $(this).data("page");
      if (page) {
        $("#mainContainer").load(contextPath + "/" + page);
      } else {
        alert("페이지가 아직 연결되지 않았습니다.");
      }
    });
  });
</script>


  <meta charset="UTF-8">
  <title>마이 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
      
    }
.sidebar {
	width: 15%; /* 줄였습니다 */
	min-height: 100vh;
	background-color: #fcb80f;
	color: white;
	padding: 20px;
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
<img src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="Qly 로고" width="50" class="me-2">

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

      
        <!-- 기본 메뉴 -->
<ul class="list-group">
  <!-- 개인정보 -->
<!-- 개인정보 -->
<li class="list-group-item p-0 border-0">
  <div class="px-3 py-2 border-bottom" data-bs-toggle="collapse" data-bs-target="#profileSubMenu"
       aria-expanded="false" aria-controls="profileSubMenu" style="cursor: pointer;">
    개인정보
  </div>
  <div class="collapse" id="profileSubMenu">
    <ul class="list-group list-group-flush ms-3" style="background-color: #add8e6;">
      <li class="list-group-item">
        <a href="#" class="submenu-link text-decoration-none text-dark" data-page="mypage/contents/personal_info.jsp">내 정보 조회</a>
      </li>
      <li class="list-group-item">
        <a href="#" class="submenu-link text-decoration-none text-dark" data-page="mypage/contents/edit_personal_info.jsp">정보 수정</a>
      </li>
    </ul>
  </div>
</li>

<!-- 내 퀘스트 -->
<li class="list-group-item p-0 border-0">
  <div class="px-3 py-2 border-bottom" data-bs-toggle="collapse" data-bs-target="#questSubMenu"
       aria-expanded="false" aria-controls="questSubMenu" style="cursor: pointer;">
    내 퀘스트
  </div>
  <div class="collapse" id="questSubMenu">
    <ul class="list-group list-group-flush ms-3" style="background-color: #add8e6;">
      <li class="list-group-item">
        <a href="#" class="submenu-link text-decoration-none text-dark" data-page="">퀘스트 목록</a>
      </li>
      <li class="list-group-item">
        <a href="#" class="submenu-link text-decoration-none text-dark" data-page="">퀘스트 히스토리</a>
      </li>
    </ul>
  </div>
</li>

<!-- 내 코인 보기 -->
<li class="list-group-item p-0 border-0">
  <div class="px-3 py-2 border-bottom" data-bs-toggle="collapse" data-bs-target="#coinSubMenu"
       aria-expanded="false" aria-controls="coinSubMenu" style="cursor: pointer;">
    내 코인 보기
  </div>
  <div class="collapse" id="coinSubMenu">
    <ul class="list-group list-group-flush ms-3" style="background-color: #add8e6;">
      <li class="list-group-item">
        <a href="#" class="submenu-link text-decoration-none text-dark" data-page="">코인 잔액</a>
      </li>
      <li class="list-group-item">
        <a href="#" class="submenu-link text-decoration-none text-dark" data-page="">충전/출금 내역</a>
      </li>
    </ul>
  </div>
</li>

</ul>



      <button class="btn btn-dark logout-btn">회원탈퇴</button>
    </div>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="col-md-9 p-4" id="mainContainer">
      
    </div>

  </div>
</div>

</body>
</html>
