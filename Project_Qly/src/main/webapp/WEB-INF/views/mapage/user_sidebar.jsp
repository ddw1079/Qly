<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto)session.getAttribute("loginUser");
    String userName = loginUser.getUsername();
    String userType = loginUser.getUserType();
    String currentPage = request.getParameter("page");
    if (currentPage == null) currentPage = "";
%>

<style>
    .sidebar-menu { list-style: none; padding: 0; margin: 0; }
    .sidebar-menu > li {
        padding: 12px 24px;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.2s ease;
        font-size: 18px;
        position: relative;
    }
    .sidebar-menu > li:hover { background-color: #e8f9f7; }
    .sidebar-menu > li.active { font-weight: bold; background-color: #d4f3ef; }
    .submenu {
        list-style: none;
        padding-left: 1.5rem;
        margin-top: 5px;
        margin-bottom: 10px;
        display: none;
    }
    .submenu.show { display: block; }
    .submenu li {
        font-size: 16px;
        padding: 6px 0;
    }
    .submenu li a {
        color: inherit;
        text-decoration: none;
        display: inline-block;
        width: 100%;
    }
    .submenu li.active a {
        font-weight: bold;
        color: #3498db;
    }
</style>

<div style="text-align: center; margin-bottom: 10px;">
    <img class="w-100" src="https://i.postimg.cc/0j1MDRhn/logo.png" alt="Qly 로고" width="250">
</div>

<div style="text-align: center; margin-bottom: 20px;">
    <div style="display: inline-block; background-color: rgba(255,255,255,0.9); color: #2f3542;
                padding: 8px 16px; border-radius: 30px; font-size: 14px; font-weight: bold;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
        <%= userName %>님(<%= userType %> 모드)
        <span style="display: inline-block; width: 10px; height: 10px;
                    background-color: #2ecc71; border-radius: 50%; margin-left: 8px;" title="활동 중"></span>
    </div>
</div>

<div style="background: white; color: #2f3542; border-radius: 12px; padding: 10px 0; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
    <ul class="sidebar-menu">
        <li class="<%= currentPage.equals("personal_info.jsp") || currentPage.equals("edit_personal_info.jsp") ? "active" : "" %>" onclick="toggleSubmenu('profileMenu')">
            개인 정보
            <ul id="profileMenu" class="submenu <%= currentPage.equals("personal_info.jsp") || currentPage.equals("edit_personal_info.jsp") ? "show" : "" %>">
                <li class="<%= currentPage.equals("personal_info.jsp") ? "active" : "" %>">
                    <a href="${pageContext.request.contextPath}/mypage/user_layout.do?page=personal_info.jsp">정보 조회</a>
                </li>
                <li class="<%= currentPage.equals("edit_personal_info.jsp") ? "active" : "" %>">
                    <a href="${pageContext.request.contextPath}/mypage/user_layout.do?page=edit_personal_info.jsp">정보 수정</a>
                </li>
            </ul>
        </li>

        <li class="<%= currentPage.equals("questCard.jsp") || currentPage.equals("questHistory.jsp") || currentPage.equals("heagual_questCard.jsp") || currentPage.equals("heagual_questHistory.jsp") ? "active" : "" %>" onclick="toggleSubmenu('questMenu')">
            내 퀘스트
            <ul id="questMenu" class="submenu <%= currentPage.contains("quest") || currentPage.contains("heagual") ? "show" : "" %>">
                <% if ("의뢰인".equals(userType)) { %>
                    <li class="<%= currentPage.equals("questCard.jsp") ? "active" : "" %>">
                        <a href="${pageContext.request.contextPath}/mypage/user_layout.do?page=questCard.jsp">퀘스트 목록</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/quest/quest_history.do?userId=<%= loginUser.getUserId() %>">퀘스트 진행 상황</a>
                    </li>
                <% } else { %>
                    <li class="<%= currentPage.equals("heagual_questCard.jsp") ? "active" : "" %>">
                        <a href="${pageContext.request.contextPath}/mypage/user_layout.do?page=heagual_questCard.jsp">해결 내역</a>
                    </li>
                    <li class="<%= currentPage.equals("heagual_questHistory.jsp") ? "active" : "" %>">
                        <a href="${pageContext.request.contextPath}/mypage/user_layout.do?page=heagual_questHistory.jsp">퀘스트 신청 목록</a>
                    </li>
                <% } %>
            </ul>
        </li>

        <li class="<%= currentPage.equals("charge.jsp") || currentPage.equals("refund.jsp") ? "active" : "" %>" onclick="toggleSubmenu('coinMenu')">
            코인 보기
            <ul id="coinMenu" class="submenu <%= currentPage.equals("charge.jsp") || currentPage.equals("refund.jsp") ? "show" : "" %>">
                <li class="<%= currentPage.equals("charge.jsp") ? "active" : "" %>">
                    <a href="${pageContext.request.contextPath}/mypage/user_layout.do?page=charge.jsp">코인 충전</a>
                </li>
                <li class="<%= currentPage.equals("refund.jsp") ? "active" : "" %>">
                    <a href="${pageContext.request.contextPath}/mypage/user_layout.do?page=refund.jsp">코인 환불</a>
                </li>
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
</script>
