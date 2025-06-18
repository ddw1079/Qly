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

    <!--  검색창 -->
    <div class="search-box">
      <input type="text" placeholder="검색어를 입력하세요" />
      <button>🔍</button>
    </div>

    <!--  문의 목록 테이블 -->
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
      <tbody>
        <tr>
          <td>1</td>
          <td>유형</td>
          <td><a href="#">제목1</a></td>
          <td>답변 대기</td>
          <td>2024-08-12</td>
        </tr>
        <tr>
          <td>2</td>
          <td>유형</td>
          <td><a href="#">제목2</a></td>
          <td>답변 완료</td>
          <td>2024-08-13</td>
        </tr>
        <tr>
          <td>3</td>
          <td>유형</td>
          <td><a href="#">제목3</a></td>
          <td>답변 대기</td>
          <td>2024-08-14</td>
        </tr>
      </tbody>
    </table>

    <!-- 더보기 버튼 -->
    <div class="more-btn">•••</div>

  </div>

</body>
</html>
