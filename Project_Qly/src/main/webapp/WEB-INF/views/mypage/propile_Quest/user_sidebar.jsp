<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");
if (loginUser == null) {
	response.sendRedirect(request.getContextPath() + "/login/loginForm.jsp");
	return;
}
String userName = loginUser.getUsername();
String userType = loginUser.getUserType();
String currentPage = request.getParameter("page");
if (currentPage == null) currentPage = "";
%>

<style>
.sidebar-container {
  background: #ffffff;
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
}
.user-badge {
  background-color: #f0faf9;
  color: #004d43;
  padding: 12px 18px;
  border-radius: 30px;
  font-size: 15px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}
.user-badge span.status-dot {
  display: inline-block;
  width: 10px;
  height: 10px;
  background-color: #28c2a0;
  border-radius: 50%;
  margin-left: 8px;
}
.sidebar-menu,
.sidebar-menu ul {
  list-style: none;
  padding: 0;
  margin: 0;
}
.sidebar-menu > li {
  padding: 12px 20px;
  cursor: pointer;
  border-radius: 10px;
  transition: background-color 0.2s ease;
  font-size: 17px;
  font-weight: 600;
  color: #004d43;
  margin-bottom: 8px;
}
.sidebar-menu > li:hover {
  background-color: #e0f7f4;
}
.submenu {
  display: none;
  padding-left: 1.5rem;
  margin-top: 5px;
  margin-bottom: 10px;
}
.submenu.show {
  display: block;
}
.submenu li {
  font-size: 15px;
  padding: 6px 14px;
  cursor: pointer;
  border-radius: 8px;
  transition: all 0.2s ease;
  color: #555;
}
.submenu li.active {
  font-weight: bold;
  background-color: #d4f3ef;
  color: #004d43;
}
.submenu li:hover {
  background-color: #f0fbfa;
  font-weight: 600;
  color: #00796b;
}
.logout-btn {
  width: 100%;
  margin-top: 24px;
  font-weight: bold;
  border-radius: 30px;
}
</style>


<div class="sidebar-container">
  <!-- 사용자 정보 -->
  <div class="user-badge">
    <%=userName%>님 (<%=userType%> 모드)
    <span class="status-dot" title="활동 중"></span>
  </div>

  <!-- 메뉴 -->
  <ul class="sidebar-menu">

    <!-- 개인 정보 -->
    <li onclick="toggleSubmenu('profileMenu')">개인 정보
      <ul id="profileMenu" class="submenu <%= (currentPage.startsWith("mypage/contents/personal_info") || currentPage.startsWith("mypage/contents/edit_personal_info")) ? "show" : "" %>">
        <li class="<%=currentPage.equals("mypage/contents/personal_info.jsp") ? "active" : ""%>"
            onclick="location.href='<%=request.getContextPath()%>/mypage/user.do'">정보 조회</li>
        <li class="<%=currentPage.equals("mypage/contents/edit_personal_info.jsp") ? "active" : ""%>"
            onclick="location.href='<%=request.getContextPath()%>/mypage/sujeug.do'">정보 수정</li>
      </ul>
    </li>

    <!-- 내 퀘스트 -->
    <li onclick="toggleSubmenu('questMenu')">내 퀘스트
      <ul id="questMenu" class="submenu <%= currentPage.contains("propile_Quest") ? "show" : "" %>">
        <% if ("의뢰인".equals(userType)) { %>
          <li class="<%=currentPage.equals("mypage/propile_Quest/questCard.jsp") ? "active" : ""%>"
              onclick="location.href='<%=request.getContextPath()%>/mypage/questcard.do'">퀘스트 목록</li>
          <li class="<%=currentPage.equals("mypage/propile_Quest/questHistory.jsp") ? "active" : ""%>"
              onclick="location.href='<%=request.getContextPath()%>/mypage/questhistory.do'">진행 상황</li>
          <li class="<%=currentPage.equals("mypage/propile_Quest/quest_completed.jsp") ? "active" : ""%>"
              onclick="location.href='<%=request.getContextPath()%>/mypage/questcompleted.do'">완료된 퀘스트</li>
        <% } else { %>
          <li class="<%=currentPage.equals("mypage/propile_Quest/heagual_questCard.jsp") ? "active" : ""%>"
              onclick="location.href='<%=request.getContextPath()%>/mypage/heagualquestcard.do'">해결사 퀘스트</li>
          <li class="<%=currentPage.equals("mypage/propile_Quest/heagual_questHistory.jsp") ? "active" : ""%>"
              onclick="location.href='<%=request.getContextPath()%>/mypage/questprogress.do'">퀘스트 진행 사항</li>
          <li class="<%=currentPage.equals("mypage/propile_Quest/solver_completed.jsp") ? "active" : ""%>"
              onclick="location.href='<%=request.getContextPath()%>/mypage/completedSolverQuests.do'">완료된 퀘스트</li>
        <% } %>
      </ul>
    </li>

    <!-- 코인 보기 -->
    <li onclick="toggleSubmenu('coinMenu')">코인 보기
      <ul id="coinMenu" class="submenu <%= currentPage.contains("mypage/coin") ? "show" : "" %>">
        <!-- <li class="<%=currentPage.equals("mypage/coin/charge.jsp") ? "active" : ""%>"
            onclick="selectMenu(this, '<%=request.getContextPath()%>/mypage/user?page=mypage/coin/charge.jsp')">코인 히스토리</li> -->
        <li onclick="window.location.href='<c:url value='/payments/history.do' />'">코인 / 결제 히스토리</li>
        <li class="<%=currentPage.equals("mypage/contents/exchangemain.jsp") ? "active" : ""%>"
					onclick="selectMenu(this, '<%=request.getContextPath()%>/mypage/coinExchange.do')">코인 환전</li>
      </ul>
    </li>
  </ul>

  <!-- 회원탈퇴 버튼 -->
  <div>
    <button class="btn btn-outline-danger logout-btn">회원탈퇴</button>
  </div>
</div>

<script>
function toggleSubmenu(id) {
  const menu = document.getElementById(id);
  const allMenus = document.querySelectorAll('.submenu');
  allMenus.forEach(m => {
    if (m !== menu) m.classList.remove('show');
  });
  menu.classList.toggle('show');
}
function selectMenu(clickedItem, targetUrl) {
  const allItems = document.querySelectorAll('.submenu li');
  allItems.forEach(item => item.classList.remove('active'));
  clickedItem.classList.add('active');
  location.href = targetUrl;
}
</script>