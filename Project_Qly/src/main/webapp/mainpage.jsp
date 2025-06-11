<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QLY 메인페이지</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    
  
    <style>
        header {
            display: flex; /* 수평 */
            justify-content: space-between; /* 좌우 공간 분리 */
            padding: 10px;
            background: #eee;
        }
        nav ul {
            list-style: none; /* 점 없애기 */
            display: flex;
            padding: 0;
            margin: 0;
            background: #333; /* 네비 배경색 */
        }
        nav ul li {
            margin-right: 20px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
        }
        .search-bar {
            margin: 20px 0;
            display: flex;
            justify-content: center; /* 가운데 정렬 */
        }
        .search-bar input {
            width: 300px;
        }
        .tag-list span {
            margin-right: 10px;
            color: gray;
        }
        .section-container {
            display: flex;
            gap: 20px;
            margin: 20px;
        }
        .quest-section, .region-section {
            flex: 1; /* 동일한 너비로  */
        }
        .footer {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background: #333;
        }
    </style>
</head>

<body>
    <%-- 헤더 --%>
    <header>
        <div><h1>로고</h1></div>
        <div>
            <%-- 로그인된 사용자의 이름과 코인 정보를 출력. 없으면 기본값 출력 --%>
            <span>Qlee [<%= request.getAttribute("userName") != null ? request.getAttribute("userName") : "mina" %>]</span>
            <span>보유 코인: <%= request.getAttribute("Qubit") != null ? request.getAttribute("Qubit") : "100" %></span>
            <button>로그인</button>
        </div>
    </header>

    <%-- 메뉴바 --%>
    <nav>
        <ul>
            <li><a href="intro.jsp">QLY 소개</a></li>
            <li><a href="questList.jsp">퀘스트</a></li>
            <li><a href="coin.jsp">Qubit 충전소</a></li>
            <li><a href="help.jsp">고객센터</a></li>
        </ul>
    </nav>

    <div class="container">
        <%-- 검색창 --%>
        <div class="search-bar">
            <form action="search.jsp" method="get" class="d-flex">
                <input type="text" name="keyword" class="form-control" placeholder="검색어 입력">
                <button class="btn btn-primary ms-2">검색</button>
            </form>
        </div>

        <%-- 해시태그 리스트 --%>
        <div class="tag-list text-center">
            <span>#장소</span>
            <span>#이사</span>
            <span>#미션</span>
            <span>#에이전</span>
        </div>

        <%-- 퀘스트(원형 아이콘) --%>
        <div class="d-flex justify-content-center my-3">
            <div class="d-flex gap-3">
                <%-- 반복 가능한 추천 미션 아이콘 --%>
                <div class="rounded-circle bg-secondary" style="width:50px; height:50px;"></div>
                <div class="rounded-circle bg-secondary" style="width:50px; height:50px;"></div>
                <div class="rounded-circle bg-secondary" style="width:50px; height:50px;"></div>
                <div class="rounded-circle bg-secondary" style="width:50px; height:50px;"></div>
                <div class="rounded-circle bg-secondary" style="width:50px; height:50px;"></div>
            </div>
        </div>

        <div class="section-container">
            <%-- 인기 퀘스트 목록 --%>
            <div class="quest-section">
                <h3 style="background: gold; padding: 5px;">BEST QUEST</h3>
                <ul>
                    <li>퀘스트 1</li>
                    <li>퀘스트 2</li>
                    <li>퀘스트 3</li>
                </ul>
            </div>

            <%-- 지역별 퀘스트 목록 --%>
            <div class="region-section">
                <h3>서울지역 ▼</h3>
                <ul>
                    <li>강남 퀘스트</li>
                    <li>홍대 퀘스트</li>
                    <li>성수 퀘스트</li>
                </ul>
            </div>

            <%-- 지도 이미지 --%>
            <div>
                <h3>지도</h3>
                <img src="map-placeholder.png" alt="지도" style="width: 200px;">
            </div>
        </div>
    </div>

    <%-- 광고, 회사정보 --%>
    <footer class="footer">
        <div>광고1</div>
        <div>광고2</div>
        <div>광고3</div>
        <div>
            주소: 서울시 어딘가<br>
            FAX: 02-1234-5678<br>
            EMAIL: contact@qly.com
        </div>
    </footer>
</body>
</html>
