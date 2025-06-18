<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>문의사항 목록</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f7f7f7;
      padding: 50px;
    }
    .container {
      max-width: 1000px;
      margin: 0 auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .search-box {
      display: flex;
      margin-bottom: 20px;
    }
    .search-box input {
      flex: 1;
      padding: 10px 14px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 6px 0 0 6px;
      outline: none;
    }
    .search-box button {
      padding: 10px 16px;
      background-color: #333;
      color: white;
      border: none;
      border-radius: 0 6px 6px 0;
      cursor: pointer;
    }
    .btn-register {
      margin-left: 10px;
      padding: 10px 16px;
      background-color: #00FA9A;
      color: black;
      font-weight: bold;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
    .btn-register:hover {
      background-color: #00e88e;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      border: 1px solid #ccc;
      padding: 12px;
      text-align: center;
    }
    th {
      background-color: #f0f0f0;
    }
    td a {
      color: #007bff;
      text-decoration: none;
    }
    td a:hover {
      text-decoration: underline;
    }
    .more-btn {
      display: block;
      margin: 20px auto;
      font-size: 22px;
      color: #333;
      text-align: center;
      cursor: pointer;
    }
  </style>
</head>
<body>

<div class="container">

  <!-- 검색창 + 등록 버튼 -->
  <div class="search-box">
    <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
    <button onclick="filterTable()">🔍</button>

<button class="btn-register" onclick="location.href='InquiryForm.jsp'">등록</button>



  </div>

  <!-- 문의 목록 테이블 -->
  <table>
    <thead>
      <tr>
        <th>번호</th>
        <th>문의 유형</th>
        <th>문의 제목</th>
        <th>문의 상황</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody id="inquiryTableBody"></tbody>
  </table>
  
  <!-- 결과 없음 메시지 -->
  <p id="noResult" style="display:none; text-align:center; margin-top:20px; color:gray;">
    검색 결과가 없습니다.
  </p>

  <!-- 더보기 버튼 -->
  <div class="more-btn">•••</div>

</div>

<!-- 스크립트 -->
<script>
  // 목록 데이터 렌더링
  document.addEventListener("DOMContentLoaded", function () {
    const tbody = document.getElementById("inquiryTableBody");
    const storedData = JSON.parse(localStorage.getItem("inquiries")) || [];

    storedData.forEach((item, index) => {
      const row = document.createElement("tr");
      row.innerHTML = `
        <td>${index + 1}</td>
        <td>${item.type}</td>
        <td><a href="inquiryDetail.jsp?index=${index}">${item.title}</a></td>
        <td>답변 대기</td>
        <td>${item.date}</td>
      `;
      tbody.appendChild(row);
    });
  });

  // 검색 필터
  function filterTable() {
    const keyword = document.getElementById("searchInput").value.toLowerCase();
    const rows = document.querySelectorAll("#inquiryTableBody tr");
    const noResult = document.getElementById("noResult");

    let visibleCount = 0;

    rows.forEach(row => {
      const cells = row.querySelectorAll("td");
      let match = false;

      cells.forEach(cell => {
        if (cell.textContent.toLowerCase().includes(keyword)) {
          match = true;
        }
      });

      row.style.display = match ? "" : "none";
      if (match) visibleCount++;
    });

    noResult.style.display = visibleCount === 0 ? "block" : "none";
  }
</script>

</body>
</html>
