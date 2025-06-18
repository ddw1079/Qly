<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title></title>
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
    <select id="type" name="type" required>
      <option value="">문의 유형 선택</option>
      <option>퀘스트 진행 방법 문의</option>
      <option>의뢰 내용 변경/수정 요청</option>
      <option>코인 결제 / 충전 관련 문제</option>
      <option>퀘스트 수행자 불만 / 신고</option>
      <option>기타 문의 또는 시스템 오류 제보</option>
    </select>
  </div>

  <!-- 제목 먼저 -->
  <div class="form-group">
    <label for="title">문의 제목</label>
    <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
  </div>

  <!-- 내용 크게 -->
  <div class="form-group">
    <label for="content">문의 내용</label>
    <textarea id="content" name="content" placeholder="내용을 입력하세요" required></textarea>
  </div>

  <button class="btn-submit" type="submit">완료</button>
</form>


  <script>
    function handleSubmit(event) {
      event.preventDefault();
      const title = document.getElementById("title").value.trim();
      const content = document.getElementById("content").value.trim();

      if (!title || !content) {
        alert("제목과 내용을 모두 입력해주세요.");
        return;
      }

      alert("문의가 등록되었습니다.");
      window.location.href = "/mainpage"; // 필요시 URL 수정
    }
  </script>

</body>
</html>
