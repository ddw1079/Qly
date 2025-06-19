<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>문의 상세</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #ffffff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .form-box {
      background: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 500px;
    }
    .form-group {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    .form-group label {
      width: 100px;
      font-weight: bold;
    }
    .form-group span {
      flex: 1;
      padding: 10px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 6px;
      background-color: #f5f5f5;
      box-sizing: border-box;
    }
    .btn-submit {
      display: block;
      margin-left: auto;
      background-color: #00FA9A;
      color: black;
      font-weight: bold;
      padding: 10px 20px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
    }
    .btn-submit:hover {
      background-color: #00e88e;
    }
  </style>
</head>
<body>

<div class="form-box">
  <div class="form-group">
    <label>문의 유형</label>
    <span id="type">-</span>
  </div>

  <div class="form-group">
    <label>문의 제목</label>
    <span id="title">-</span>
  </div>

  <div class="form-group">
    <label>문의 내용</label>
    <span id="content" style="white-space: pre-line;">-</span>
  </div>

  <div class="form-group">
    <label>작성일</label>
    <span id="date">-</span>
  </div>

  <button class="btn-submit" onclick="history.back()">← 목록으로</button>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const index = parseInt(urlParams.get("index"));
    const data = JSON.parse(localStorage.getItem("inquiries")) || [];
    if (!isNaN(index) && data[index]) {
      document.getElementById("type").textContent = data[index].type;
      document.getElementById("title").textContent = data[index].title;
      document.getElementById("content").textContent = data[index].content;
      document.getElementById("date").textContent = data[index].date;
    } else {
      document.querySelector(".form-box").innerHTML = "<p style='color:red;'>문의 데이터를 찾을 수 없습니다.</p>";
    }
  });
</script>

</body>
</html>
