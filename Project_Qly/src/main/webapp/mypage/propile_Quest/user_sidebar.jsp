<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String userId = (String) session.getAttribute("loginId");
    String userType = (String) session.getAttribute("userType");
    if (userId == null) userId = "비회원";
    if (userType == null) userType = "Qlel"; // 기본값
%> <!-- 지금은 DB없어서 NULL값일때 기본값으로 줫음 -->

<style>
    .sidebar-menu { list-style: none; padding: 0; margin: 0; }
    .sidebar-menu > li {
        padding: 12px 24px; cursor: pointer;
        border-radius: 8px; transition: background-color 0.2s ease;
        font-size: 18px; position: relative;
    }
    .sidebar-menu > li:hover { background-color: #e8f9f7; }
    .sidebar-menu > li.active { font-weight: bold; background-color: #d4f3ef; }
    .submenu { display: none; list-style: none; padding-left: 1.5rem; margin-top: 5px; margin-bottom: 10px; }
    .submenu.show { display: block; }
    .submenu li { font-size: 16px; padding: 6px 0; cursor: pointer; }
</style>

<div style="text-align: center; margin-bottom: 10px;">
    <img class="w-100" src="https://i.postimg.cc/0j1MDRhn/logo.png" alt="Qly 로고" width="250">
</div>

<div style="text-align: center; margin-bottom: 20px;">
    <div style="display: inline-block; background-color: rgba(255,255,255,0.9); color: #2f3542;
                padding: 8px 16px; border-radius: 30px; font-size: 14px; font-weight: bold;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
        <%= userType.equals("Qlee") ? "의뢰인" : "해결사" %>(<%= userId %>)님 접속 중
        <span style="display: inline-block; width: 10px; height: 10px;
                    background-color: #2ecc71; border-radius: 50%; margin-left: 8px;" title="활동 중"></span>
    </div>
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
            <% if ("Qlee".equals(userType)) { %>
                <li id="subQuest1" onclick="location.href='user_layout.jsp?page=../propile_Quest/questCard.jsp'">퀘스트 목록</li>
                <li id="subQuest2" onclick="location.href='user_layout.jsp?page=../propile_Quest/questHistory.jsp'">퀘스트 진행 상황</li>
            <% } else { %>
                <li id="subQuest1" onclick="location.href='user_layout.jsp?page=../propile_Quest/heagual_questCard.jsp'">해결 내역</li>
                <li id="subQuest2" onclick="location.href='user_layout.jsp?page=../propile_Quest/heagual_questHistory.jsp'">퀘스트 신청 목록</li>
            <% } %>
            </ul>
        </li>

        <li onclick="toggleSubmenu('coinMenu')">
            코인 보기
            <ul id="coinMenu" class="submenu">
                <li onclick="location.href='user_layout.jsp?page=../coin/charge.jsp'">코인 충전</li>
                <li onclick="location.href='user_layout.jsp?page=../coin/refund.jsp'">코인 환불</li>
            </ul>
        </li>
    </ul>

    <div style="text-align: center; margin-top: 20px;">
        <button class="btn btn-dark logout-btn">회원탈퇴</button>
    </div>
</div>

<script>
  function toggleSubmenu(id) { //onclick으로 toggleSubmenu되어있는곳의 아이디를 가져와서 show로 하위메뉴를 보여준다 show가 되어있으면9행에서 21행사이에있는 done이랑 block으로 show를 지운다
    const menu = document.getElementById(id);
    menu.classList.toggle('show');
  }
</script>
