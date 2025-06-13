<%@ page contentType="text/html;charset=UTF-8" %>
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
      background-color: #f9f9f9;
      font-family: 'Malgun Gothic', sans-serif;
      margin-bottom: 120px;
    }

    .main-wrapper {
      max-width: 900px;
      margin: 0 auto;
    }

    header {
      background-color: #e6e6e6;
      position: relative;
      height: 80px;
    }

    .nav-menu {
      background-color: #01705a;
      display: flex;
      justify-content: center;
    }

    .nav-menu a {
      color: white;
      padding: 12px 20px;
      display: inline-block;
      text-decoration: none;
    }

    .nav-menu a:hover {
      background-color: #1b5e20;
    }

    .search-bar {
      width: 500px;
      margin: 0 auto;
      display: flex;
      justify-content: center;
    }

    .circle-icons {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 20px;
    }

    .circle-icons a {
      display: inline-block;
      margin: 0 15px;
    }

    .circle-icons a div {
      width: 50px;
      height: 50px;
      background-color: #01705a;
      border-radius: 50%;
    }

    .section-title {
      background-color: #01705a;
      color: white;
      padding: 10px;
      font-weight: bold;
      margin: 40px 0 20px;
    }

    .quest-section,
    .region-section {
      padding: 0 40px;
    }

    .map-container {
      display: flex;
      gap: 30px;
      padding: 40px;
    }

    .map-box {
      width: 300px;
      height: 300px;
      background-color: #ccc;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
    }

    .footer-bar {
      position: fixed;
      bottom: 0;
      left: 0;
      right: 0;
      background-color: #01705a;
      color: white;
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding: 15px;
      font-size: 14px;
      z-index: 999;
    }

    .footer-bar div {
      text-align: center;
    }
  </style>
</head>
<body>

<header>
  <div style="display: flex; justify-content: space-between; align-items: flex-end; height: 100%; padding: 0 20px;">
    <div style="position: absolute; top: 0px; left: 10px;">
      <img src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="Qly 로고" style="height: 95px;">
    </div>
    <div style="position: absolute; bottom: 5px; right: 10px;">
      <button class="btn btn-outline-dark btn-sm me-2">로그인</button>
      <button class="btn btn-outline-success btn-sm">회원가입</button>
    </div>
  </div>
</header>

<div class="nav-menu">
  <a href="#">QLY 소개</a>
  <a href="#">퀘스트 등록</a>
  <a href="#">코인 충전소</a>
  <a href="#">고객센터</a>
</div>

<!-- 검색 + 추천 아이콘 -->
<div class="text-center" style="margin-top: 40px;">
  <img src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="Qly 로고" style="width: 300px; display: block; margin: 0 auto;">
  <div class="search-bar d-flex justify-content-center mt-2">
    <input type="text" id="searchInput" class="form-control" style="max-width: 400px;" placeholder="검색어 입력">
    <button class="btn btn-success ms-2">검색</button>
  </div>
  <div class="d-flex justify-content-center mt-1">
    <div style="width: 400px; text-align: left;" id="suggestedTags">
      <span class="text-muted">#</span>
    </div>
  </div>

  <div class="circle-icons">
    <a href="#"><div title="추천1"></div></a>
    <a href="#"><div title="추천2"></div></a>
    <a href="#"><div title="추천3"></div></a>
    <a href="#"><div title="추천4"></div></a>
    <a href="#"><div title="추천5"></div></a>
    <a href="#"><div title="추천6"></div></a>
  </div>
</div>

<!-- BEST QUEST -->
<div class="quest-section" style="width: 550px; margin: 40px auto 20px;">
  <h3 class="section-title text-center">BEST QUEST</h3>
  <table class="table table-bordered" id="questTable">
    <tbody>
      <tr><td><a href="#" class="text-decoration-none text-dark d-block">강남 퀘스트</a></td></tr>
      <tr><td><a href="#" class="text-decoration-none text-dark d-block">홍대 미션</a></td></tr>
      <tr><td><a href="#" class="text-decoration-none text-dark d-block">성수 페인트</a></td></tr>
      <tr><td><a href="#" class="text-decoration-none text-dark d-block">이사 도우미</a></td></tr>
      <tr><td><a href="#" class="text-decoration-none text-dark d-block">전단지 배포</a></td></tr>
    </tbody>
  </table>
</div>

<!-- 지역/지도 선택 -->
<div class="map-container">
  <div class="region-section" style="width: 300px;">
    <div style="border: 2px solid #2196F3; border-radius: 4px;">
      <div style="background-color: #019267; color: white; padding: 8px 10px; display: flex; justify-content: space-between; align-items: center;">
        <span id="regionLabel" style="font-weight: bold;">지역 선택</span>
        <div style="display: flex; align-items: center; gap: 5px;">
        
        </div>
      </div>

      <!-- 지역/구 드롭다운 -->
      <div style="padding: 10px;">
        <div class="d-flex gap-2">
          <select id="regionSelect" class="form-select">
            <option value="">-- 지역 선택 --</option>
            <option value="seoul">서울</option>
            <option value="busan">부산</option>
            <option value="daegu">대구</option>
          </select>
          <select id="districtSelect" class="form-select">
            <option value="">-- 구 선택 --</option>
          </select>
        </div>
      </div>
    </div>
  </div>

  <div class="map-box">지도 자리</div>
</div>

<!-- 하단 푸터 -->
<div class="footer-bar">
  <div>광고1</div>
  <div>광고2</div>
  <div>광고3</div>
  <div>
    주소: 서울시 어딘가<br>
    FAX: 02-1234-5678<br>
    EMAIL: contact@qly.com
  </div>
</div>

<!-- SCRIPT: 태그 추천 및 지역/구 동기화 -->
<script>
  const tagDatabase = {
    "이사": ["#이사", "#이사도우미", "#짐정리"],
    "강남": ["#강남", "#강남퀘스트", "#서울남부"],
    "홍대": ["#홍대", "#예술거리", "#홍대맛집"],
    "미션": ["#미션", "#퀘스트", "#일일도전"],
    "페인트": ["#페인트", "#도색작업", "#리폼"]
  };

  const searchInput = document.getElementById("searchInput");
  const tagContainer = document.getElementById("suggestedTags");

  searchInput.addEventListener("input", function () {
    const input = this.value.trim().toLowerCase();
    tagContainer.innerHTML = "";

    if (!input) {
      tagContainer.innerHTML = "<span class='text-muted'>관련 태그가 여기에 표시됩니다</span>";
      return;
    }

    let matchedTags = [];
    Object.keys(tagDatabase).forEach(key => {
      if (key.includes(input)) {
        matchedTags = matchedTags.concat(tagDatabase[key]);
      }
    });

    if (matchedTags.length === 0) {
      tagContainer.innerHTML = "<span class='text-muted'>관련 태그 없음</span>";
    } else {
      matchedTags.forEach(tag => {
        const span = document.createElement("span");
        span.textContent = tag;
        span.classList.add("badge", "bg-light", "text-dark", "me-1");
        span.style.cursor = "pointer";

        span.addEventListener("click", function () {
          searchInput.value = tag.replace("#", "");
          searchInput.dispatchEvent(new Event("input"));
        });

        tagContainer.appendChild(span);
      });
    }
  });

  searchInput.addEventListener("keyup", function () {
    const keyword = this.value.toLowerCase();
    const rows = document.querySelectorAll("#questTable tr");
    rows.forEach(row => {
      row.style.display = row.textContent.toLowerCase().includes(keyword) ? "" : "none";
    });
  });

  // ✅ 지역 선택 → 구 자동 채우기
  const regionData = {
    seoul: ["강남구", "마포구", "종로구", "성수동"],
    busan: ["해운대구", "수영구", "중구"],
    daegu: ["중구", "달서구", "수성구"]
  };

  const regionSelect = document.getElementById("regionSelect");
  const districtSelect = document.getElementById("districtSelect");
  const regionLabel = document.getElementById("regionLabel");

  regionSelect.addEventListener("change", () => {
    const selected = regionSelect.value;

    regionLabel.textContent = selected
      ? regionSelect.options[regionSelect.selectedIndex].text + " 지역"
      : "지역 선택";

    districtSelect.innerHTML = '<option value="">-- 구 선택 --</option>';
    if (regionData[selected]) {
      regionData[selected].forEach(name => {
        const option = document.createElement("option");
        option.value = name;
        option.textContent = name;
        districtSelect.appendChild(option);
      });
    }
  });
</script>

</body>
</html>
