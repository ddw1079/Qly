<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");

String userName = loginUser.getUsername();
String userType = loginUser.getUserType();

String currentPage = request.getParameter("page");
if (currentPage == null)
	currentPage = "";
%>

<style>
.sidebar-menu {
	list-style: none;
	padding: 0;
	margin: 0;
}

.sidebar-menu>li {
	padding: 12px 24px;
	cursor: pointer;
	border-radius: 8px;
	transition: background-color 0.2s ease;
	font-size: 18px;
	position: relative;
}

.sidebar-menu>li:hover {
	background-color: #e8f9f7;
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
	padding: 6px 12px;
	cursor: pointer;
	border-radius: 6px;
	transition: all 0.15s ease;
	user-select: none;
}

.submenu li.active {
	font-weight: bold;
	background-color: #d4f3ef;
}

.submenu li:hover {
	background-color: #f0fbfa;
	font-weight: 600;
	color: #00897b;
}
</style>

<!-- 상단 로고 -->
<div style="text-align: center; margin-bottom: 10px;">
	<img class="w-100" src="https://i.postimg.cc/0j1MDRhn/logo.png"
		alt="Qly 로고" width="250">
</div>

<!-- 사용자 정보 -->
<div style="text-align: center; margin-bottom: 20px;">
	<div
		style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); color: #2f3542; padding: 8px 16px; border-radius: 30px; font-size: 14px; font-weight: bold; box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);">
		<%=userName%>님 (<%=userType%>
		모드) <span
			style="display: inline-block; width: 10px; height: 10px; background-color: #2ecc71; border-radius: 50%; margin-left: 8px;"
			title="활동 중"></span>
	</div>
</div>

<!-- 메뉴 -->
<div
	style="background: white; color: #2f3542; border-radius: 12px; padding: 10px 0; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
	<ul class="sidebar-menu">

		<ul class="sidebar-menu">

			<!-- ✅ 개인 정보 -->
			<li onclick="toggleSubmenu('profileMenu')">개인 정보
				<ul id="profileMenu"
					class="submenu <%=currentPage.equals("../contents/personal_info.jsp") || currentPage.equals("../contents/edit_personal_info.jsp")
				? "show"
				: ""%>">
					<li
						class="<%=currentPage.equals("../contents/personal_info.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../contents/personal_info.jsp')">정보
						조회</li>
					<li
						class="<%=currentPage.equals("../contents/edit_personal_info.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../contents/edit_personal_info.jsp')">정보
						수정</li>
				</ul>
			</li>

			<!-- ✅ 내 퀘스트 -->
			<li onclick="toggleSubmenu('questMenu')">내 퀘스트
				<ul id="questMenu"
					class="submenu <%=currentPage.contains("quest") ? "show" : ""%>">
					<%
					if ("Qlee".equals(userType)) {
					%>
					<li
						class="<%=currentPage.endsWith("questCard.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../propile_Quest/questCard.jsp')">퀘스트
						목록</li>
					<li
						class="<%=currentPage.endsWith("questHistory.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../propile_Quest/questHistory.jsp')">진행
						상황</li>
					<%
					} else {
					%>
					<li
						class="<%=currentPage.endsWith("heagual_questCard.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../propile_Quest/heagual_questCard.jsp')">해결
						내역</li>
					<li
						class="<%=currentPage.endsWith("heagual_questHistory.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../propile_Quest/heagual_questHistory.jsp')">퀘스트
						신청 목록</li>
					<%
					}
					%>
				</ul>
			</li>

			<!-- ✅ 코인 보기 -->
			<li onclick="toggleSubmenu('coinMenu')">코인 보기
				<ul id="coinMenu"
					class="submenu <%=currentPage.contains("coin") ? "show" : ""%>">
					<li
						class="<%=currentPage.endsWith("charge.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../coin/charge.jsp')">코인
						충전</li>
					<li
						class="<%=currentPage.endsWith("refund.jsp") ? "active" : ""%>"
						onclick="selectMenu(this, 'user_layout.jsp?page=../coin/refund.jsp')">코인
						환불</li>
				</ul>
			</li>

		</ul>


		<!-- 회원탈퇴 버튼 -->
		<div style="text-align: center; margin-top: 20px;">
			<button class="btn btn-dark logout-btn">회원탈퇴</button>
		</div>
</div>

<!-- ✅ JavaScript -->
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
    // 모든 하위 메뉴에서 active 제거
    const allItems = document.querySelectorAll('.submenu li');
    allItems.forEach(item => item.classList.remove('active'));

    // 현재 항목만 active
    clickedItem.classList.add('active');

    // 페이지 이동
    location.href = targetUrl;
  }
</script>
