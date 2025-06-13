<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String currentPage = request.getParameter("page");
    if (currentPage == null) currentPage = "mypage/contents/personal_info.jsp";
%>

<style>
    .sidebar-menu {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .sidebar-menu > li {
        padding: 12px 24px;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.2s ease;
        font-size: 18px;
        position: relative;
    }

    .sidebar-menu > li:hover {
        background-color: #e8f9f7;
    }

    .sidebar-menu > li.active {
        font-weight: bold;
        background-color: #d4f3ef;
    }

    .submenu {
        display: none;
        list-style: none;
        padding-left: 1.5rem;
        margin-top: 5px;
        margin-bottom: 10px;
    }

    .submenu.show {
        display: block;
    }

    .submenu li {
        font-size: 16px;
        padding: 6px 0;
        cursor: pointer;
    }
</style>

<div style="text-align: center; margin-bottom: 30px;">
    <img src="https://i.postimg.cc/0j1MDRhn/logo.png" alt="Qly 로고" width="250">
</div>

<div style="background: white; color: #2f3542; border-radius: 12px; padding: 10px 0; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
    <ul class="sidebar-menu">

        <li onclick="toggleSubmenu('profileMenu')">
            개인 정보
            <ul id="profileMenu" class="submenu">
                <li onclick="location.href='user_layout.jsp?page=../contents/personal_info.jsp'">정보 조회</li>
                <li onclick="location.href='user_layout.jsp?page=../contents/edit_personal_info.jsp'">정보 수정</li>
            </ul>
        </li>

        <li onclick="toggleSubmenu('questMenu')">
            내 퀘스트
            <ul id="questMenu" class="submenu">
                <li id="subQuest1" onclick="location.href='user_layout.jsp?page=../propile_Quest/questCard.jsp'">퀘스트 목록</li>
                <li id="subQuest2" onclick="location.href='user_layout.jsp?page=../propile_Quest/questHistory.jsp'">퀘스트 진행 상황</li>
            </ul>
        </li>

        <li onclick="toggleSubmenu('coinMenu')">
            코인 보기
            <ul id="coinMenu" class="submenu">
                <li onclick="location.href='user_layout.jsp?page='">코인 충전</li>
                <li onclick="location.href='user_layout.jsp?page='">코인 환불</li>
            </ul>
        </li>

    </ul>

    <div style="text-align: center; margin-top: 20px;">
        <button class="btn btn-dark logout-btn">회원탈퇴</button>
    </div>
</div>

<script>
  function toggleSubmenu(id) {
    const menu = document.getElementById(id);
    menu.classList.toggle('show');
  }

  // 해결사 메뉴 변경
  const urlParams = new URLSearchParams(window.location.search);
  const role = urlParams.get("role");
  if (role === "helper") {
    document.getElementById("subQuest1").innerHTML = "해결 내역";
    document.getElementById("subQuest2").innerHTML = "퀘스트 신청 목록";
  }
</script>
