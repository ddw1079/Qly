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

 
<div class="form-group">
  <label for="type">문의 유형</label>
  <input type="text" id="type" name="type" placeholder="문의 유형을 입력하세요" required>
</div>

  <!-- ì ëª© ë¨¼ì  -->
  <div class="form-group">
    <label for="title">ë¬¸ì ì ëª©</label>
    <input type="text" id="title" name="title" placeholder="ì ëª©ì ìë ¥íì¸ì" required>
  </div>

  <!-- ë´ì© í¬ê² -->
  <div class="form-group">
    <label for="content">ë¬¸ì ë´ì©</label>
    <textarea id="content" name="content" placeholder="ë´ì©ì ìë ¥íì¸ì" required></textarea>
  </div>

  <button class="btn-submit" type="submit">ìë£</button>
</form>


  <script>
    function handleSubmit(event) {
      event.preventDefault();
      const title = document.getElementById("title").value.trim();
      const content = document.getElementById("content").value.trim();

      if (!title || !content) {
        alert("ì ëª©ê³¼ ë´ì©ì ëª¨ë ìë ¥í´ì£¼ì¸ì.");
        return;
      }

      alert("ë¬¸ìê° ë±ë¡ëììµëë¤.");
      window.location.href = "/mainpage"; // íìì URL ìì 
    }
  </script>

</body>
</html>
