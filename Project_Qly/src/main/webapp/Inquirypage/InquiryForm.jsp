<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>문의 등록</title>
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

    .form-group select,
    .form-group input,
    .form-group textarea {
      flex: 1;
      padding: 10px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }

    textarea {
      height: 200px;
      resize: vertical;
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

<form class="form-box" onsubmit="handleSubmit(event)">
  <div class="form-group">
    <label for="type">문의 유형</label>
    <select id="type" required>
      <option value="">선택</option>
      <option>회원 정보 수정</option>
      <option>퀘스트 오류</option>
      <option>기타 문의</option>
    </select>
  </div>

  <div class="form-group">
    <label for="title">제목</label>
    <input type="text" id="title" placeholder="제목 입력" required />
  </div>

  <div class="form-group">
    <label for="content">내용</label>
    <textarea id="content" placeholder="문의 내용을 입력하세요" required></textarea>
  </div>

  <button class="btn-submit" type="submit">완료</button>
</form>

<script>
  function handleSubmit(event) {
    event.preventDefault();

    const type = document.getElementById("type").value.trim();
    const title = document.getElementById("title").value.trim();
    const content = document.getElementById("content").value.trim();

    if (!type || !title || !content) {
      alert("모든 항목을 입력해주세요.");
      return;
    }

    const date = new Date().toISOString().split('T')[0]; // YYYY-MM-DD
    const newInquiry = { type, title, content, date };

    // 기존 데이터 불러오기
    const inquiries = JSON.parse(localStorage.getItem("inquiries")) || [];

    // 새 데이터 추가
    inquiries.push(newInquiry);

    // 저장
    localStorage.setItem("inquiries", JSON.stringify(inquiries));

    alert("문의가 등록되었습니다.");
    window.location.href = "InquiryList.jsp";
  }
</script>

</body>
</html>
