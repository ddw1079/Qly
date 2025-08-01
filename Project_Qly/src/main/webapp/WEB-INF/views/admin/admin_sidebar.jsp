<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String currentPage = request.getParameter("page");
if (currentPage == null)
	currentPage = "admin_memberList.jsp";
%>

<!--  공통 스타일 (강제 적용용) -->
<style>
.sidebar-menu li {
	padding: 12px 24px !important;
	cursor: pointer;
	border-radius: 8px;
	transition: background-color 0.2s ease;
	font-size: 18px !important;
	line-height: 1.6;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.sidebar-menu li:hover {
	background-color: #e8f9f7;
}

.sidebar-menu .active {
	font-weight: bold;
	background-color: #d4f3ef;
}

.sidebar-menu {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

<!--  Qly 로고 -->
<div style="text-align: center; margin-bottom: 10px;">
<a href="${pageContext.request.contextPath}/mainpage">
	<img src="https://i.postimg.cc/0j1MDRhn/logo.png" alt="Qly 로고"
		width="200" style="max-width: 80%;">
		</a>
</div>

<style>
/*  사이드바 접속 정보 통일 스타일 */
.sidebar-user-info {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 8px 16px;
	border-radius: 30px;
	font-size: 14px !important;
	font-weight: 500 !important;
	font-family: 'Noto Sans KR', sans-serif !important;
	background-color: rgba(255, 255, 255, 0.95);
	color: #2f3542 !important;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	line-height: 1.4;
	width: 220px;
	max-width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin: 0 auto;
}

.sidebar-user-info span {
	font-size: 14px !important;
	font-weight: 500 !important;
	font-family: 'Noto Sans KR', sans-serif !important;
	color: #2f3542 !important;
}

.sidebar-user-info .status-dot {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #2ecc71;
	margin-left: 8px;
}
</style>


<!--  로그인 상태 박스 -->
<div style="text-align: center; margin-bottom: 20px;">
	<div class="sidebar-user-info">
		<span>관리자(admin)님 접속 중</span> <span class="status-dot" title="활동 중"></span>
	</div>
</div>




<!--  메뉴 리스트 -->
<div
	style="background: white; color: #2f3542; border-radius: 12px; padding: 10px 0; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); font-size: 16px;">
	<ul class="sidebar-menu"
		style="list-style: none; padding: 0; margin: 0;">

		<li class="${page eq 'admin_memberList.jsp' ? 'active' : ''}"
			onclick="location.href='<%= request.getContextPath() %>/admin/memberList.do'">회원 관리</li>

		<li class="${page eq 'admin_questList.jsp' ? 'active' : ''}"
			onclick="location.href='<%= request.getContextPath() %>/admin/questList.do'">퀘스트 관리</li>

		<li class="${page eq 'admin_coinList.jsp' ? 'active' : ''}"
			onclick="location.href='<%= request.getContextPath() %>/admin/coinList.do'">코인 관리</li>

		<li class="${page eq 'admin_question.jsp' ? 'active' : ''}"
			onclick="location.href='<%= request.getContextPath() %>/admin/questionList.do'">사용자
			문의</li>


		<li class="disabled" style="pointer-events: none; opacity: 0.5;">🔒
			매출 통계</li>
		<li class="disabled" style="pointer-events: none; opacity: 0.5;">🔒
			사내 게시판</li>
		<li class="disabled" style="pointer-events: none; opacity: 0.5;">🔒
			보안 정책</li>
		<li class="disabled" style="pointer-events: none; opacity: 0.5;">🔒
			환경 설정</li>
	</ul>

</div>
