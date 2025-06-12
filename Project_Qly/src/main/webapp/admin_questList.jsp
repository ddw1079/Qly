<%@ include file="admin_sidebar.jsp" %> <%-- 고정 사이드바 분리 시 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>퀘스트 관리</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
  <style>
    body {
      margin: 0;
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f1f2f6;
    }
    .container {
      display: flex;
    }
    .main {
      flex: 1;
      padding: 30px;
    }
    .top-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
  </style>
</head>
<body>
  <div class="container">
    
    <!-- ✅ 좌측 사이드바 (admin_sidebar.jsp에서 불러오거나 복제 가능) -->
    <div class="sidebar">
      <div class="logo">
        <img src="https://cdn-icons-png.flaticon.com/512/2584/2584674.png" alt="로고" width="100">
      </div>
      <div class="menu-box">
        <ul>
          <li onclick="location.href='admin_memberList.jsp'">회원 관리</li>
          <li><b>퀘스트 관리</b></li>
          <li>코인 관리</li>
          <li>설정</li>
        </ul>
      </div>
    </div>

    <!-- ✅ 메인 콘텐츠 -->
    <div class="main">
      <div class="top-bar">
        <h3>퀘스트 관리 페이지</h3>
        <div style="display: flex; align-items: center; gap: 10px;">
          <span style="font-weight: 500;">admin님 (관리자 모드)</span>
          <button class="btn btn-dark btn-sm">로그아웃</button>
          <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" width="50">
        </div>
      </div>

      <!-- ✅ 퀘스트 목록 테이블 -->
      <table id="questTable" class="display mt-4">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>보상</th>
            <th>상태</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="dt-center">1</td>
            <td>물건 옮기기 도와주세요</td>
            <td>user001</td>
            <td>1,000 Qubit</td>
            <td>모집 중</td>
            <td>2024-06-20</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

  <script>
    $(document).ready(function () {
      $('#questTable').DataTable({
        language: {
          search: "검색:",
          lengthMenu: "페이지당 _MENU_ 개씩 보기",
          info: "총 _TOTAL_개 중 _START_~_END_",
          paginate: { previous: "이전", next: "다음" },
          emptyTable: "퀘스트가 없습니다.",
          zeroRecords: "검색 결과가 없습니다."
        }
      });
    });
  </script>
</body>
</html>
