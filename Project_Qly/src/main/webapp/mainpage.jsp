<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QLY 메인페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  
    
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        /* 상단 로고와 사용자 정보 */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: #f5f5f5;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        
        nav ul {
            list-style: none;
            display: flex;
            padding: 0;
            margin: 0;
            background-color: #1a1a1a;
        }
        nav ul li a {
            display: block;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
        }

        /* 검색창 및 해시태그 */
        .search-section {
            padding: 20px;
            text-align: center;
        }
        .tag-list span {
            margin-right: 10px;
            color: gray;
            font-size: 14px;
        }

        /* 콘텐츠 메뉴바 */
        .main-section {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            padding: 20px;
        }

        .quest-section, .region-section {
            width: 30%;
        }

        .map-section {
            width: 40%;
            text-align: center;
        }

        .map-section img {
            width: 100%;
            max-width: 300px;
        }

        h3.section-title {
            background-color: gold;
            padding: 8px;
            font-weight: bold;
        }

        /* 원형 아이콘 */
        .circle-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 20px 0;
        }

        .circle-icons div {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: #ccc;
        }

        /* 광고 및 하단 */
        footer {
            display: flex;
            justify-content: space-around;
            background: #333;
            color: white;
            padding: 20px;
            font-size: 14px;
        }

    </style>
</head>
<body>

  <!-- 헤더 -->
    <header>
        <div class="logo">로고</div>
        <div class="user-info">
            <span>Qlee [<%= request.getAttribute("userName") != null ? request.getAttribute("userName") : "mina" %>]</span>
            <span>보유Qubit : <%= request.getAttribute("Qubit") != null ? request.getAttribute("Qubit") : "100" %> Q</span>
           <button class="btn btn-outline-secondary d-flex align-items-center justify-content-center p-0 rounded-circle" style="width: 40px; height: 40px;">
    <i class="bi bi-box-arrow-right"></i>
</button>

        </div>
    </header>

    <!-- 메뉴바 -->
    <nav>
        <ul class="w-100 justify-content-center d-flex">
            <li><a href="intro.jsp">QLY 소개</a></li>
            <li><a href="questList.jsp">퀘스트 </a></li>
            <li><a href="coin.jsp">Qubit 충전소</a></li>
            <li><a href="help.jsp">고객센터</a></li>
        </ul>
    </nav>

    <!-- 검색 영역 -->
    <div class="search-section">
        <form action="search.jsp" method="get" class="d-flex justify-content-center">
            <input type="text" name="keyword" class="form-control w-25" placeholder="검색어 입력">
            <button class="btn btn-dark ms-2">검색</button>
        </form>
        <div class="tag-list mt-2">
            <span>#장소</span>
            <span>#이사</span>
            <span>#미션</span>
            <span>#에이전</span>
        </div>
    </div>

    <!-- 추천 퀘스트 아이콘 -->
    <div class="circle-icons">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="main-section">
        <!-- BEST QUEST -->
        <div class="quest-section">
            <h3 class="section-title">BEST QUEST</h3>
            <ul>
                <li>퀘스트 1</li>
                <li>퀘스트 2</li>
                <li>퀘스트 3</li>
            </ul>
        </div>

        <!-- 서울지역 -->
        <div class="region-section">
            <h3 class="section-title">서울지역 ▼</h3>
            <ul>
                <li>강남 퀘스트</li>
                <li>홍대 퀘스트</li>
                <li>성수 퀘스트</li>
            </ul>
        </div>

        <!-- 지도 -->
        <div class="map-section">
            <h3>지도</h3>
            <img src="map-placeholder.png" alt="지도">
        </div>
    </div>

    <!-- 푸터 -->
  <footer class="footer">
    
        <div>광고1</div>
        <div>광고2</div>
        <div>광고3</div>
    </div>
    <div class="company-info mt-4 text-center text-white">
        주소: 서울시 어딘가<br>
        FAX: 02-1234-5678<br>
        EMAIL: contact@qly.com
    </div>
</footer>


</body>
</html>
