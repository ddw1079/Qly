<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QLY 메인페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Malgun Gothic', sans-serif;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: #eee;
        }

        .nav-menu {
            background-color: #000;
        }

        .nav-menu a {
            color: white;
            padding: 12px 20px;
            display: inline-block;
            text-decoration: none;
        }

        .nav-menu a:hover {
            background-color: #444;
        }

        .slogan-section {
            text-align: center;
            padding: 50px 0 30px 0;
        }

        .slogan-section img {
            width: 80px;
        }

        .slogan-text {
            font-size: 24px;
            margin-top: 10px;
        }

        .search-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-bar {
            width: 500px;
            margin: 0 auto;
            display: flex;
        }

        .circle-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .circle-icons a div {
            width: 50px;
            height: 50px;
            background-color: #ccc;
            border-radius: 50%;
            transition: background 0.3s;
        }

        .circle-icons a div:hover {
            background-color: #aaa;
            cursor: pointer;
        }

        .quest-section {
            padding: 20px 40px;
        }

        .quest-section h3 {
            background-color: #d9ecff;
            padding: 10px;
            font-weight: bold;
        }

        .ads {
            display: flex;
            justify-content: space-around;
            background-color: #ddd;
            padding: 20px;
            margin-top: 30px;
        }

        .footer-info {
            text-align: right;
            padding: 10px 40px;
            font-size: 14px;
            color: gray;
        }
    </style>
</head>
<body>

    <!-- 헤더 -->
    <header>
        <div><h2>로고</h2></div>
        <div>
            <button class="btn btn-outline-primary btn-sm">로그인</button>
            <button class="btn btn-outline-secondary btn-sm">회원가입</button>
        </div>
    </header>

  
               <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">
                퀘스트 등록
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">퀘스트 작성</a></li>
                <li><a class="dropdown-item" href="#">진행 현황</a></li>
            </ul>
        </li>
        <li class="nav-item"><a class="nav-link text-white" href="coin.jsp">코인 충전소</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="help.jsp">고객센터</a></li>
    </ul>
</nav>
    <!-- 슬로건 -->
    <div class="slogan-section">
        <img src="resources/images/logo.png" alt="로고">
        
    </div>

    <!-- 검색 -->
    <div class="search-section">
        <div class="search-bar">
            <input type="text" id="searchInput" class="form-control" placeholder="검색어 입력">
            <button class="btn btn-dark ms-2">검색</button>
        </div>
        <div class="text-center mt-2 text-secondary small">#장소 #이사 #미션 #에이전</div>

        <div class="circle-icons mt-4">
            <a href="#"><div title="추천 1"></div></a>
            <a href="#"><div title="추천 2"></div></a>
            <a href="#"><div title="추천 3"></div></a>
            <a href="#"><div title="추천 4"></div></a>
            <a href="#"><div title="추천 5"></div></a>
        </div>
    </div>

    <!-- BEST QUEST -->
    <div class="quest-section">
        <h3>BEST QUEST</h3>
        <table class="table table-bordered">
            <tbody id="questTable">
                <tr><td>강남 퀘스트</td></tr>
                <tr><td>홍대 미션</td></tr>
                <tr><td>성수 페인트</td></tr>
                <tr><td>이사 도우미</td></tr>
                <tr><td>전단지 배포</td></tr>
            </tbody>
        </table>
    </div>

    <!-- 광고 -->
    <div class="ads">
        <img src="resources/images/ad1.jpg" alt="광고1" width="150">
        <img src="resources/images/ad2.jpg" alt="광고2" width="150">
        <img src="resources/images/ad3.jpg" alt="광고3" width="150">
    </div>

    <!-- 하단 정보 -->
    <div class="footer-info">
        주소: 서울시 어딘가 | FAX: 02-1234-5678 | EMAIL: contact@qly.com
    </div>

    <!-- 검색 필터 JS -->
    <script>
        document.getElementById("searchInput").addEventListener("keyup", function () {
            const keyword = this.value.toLowerCase();
            const rows = document.querySelectorAll("#questTable tr");

            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(keyword) ? "" : "none";
            });
        });
    </script>

</body>
</html>
