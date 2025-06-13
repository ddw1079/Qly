<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 현재 선택된 메뉴의 JSP 페이지명 (파라미터가 없으면 회원 관리로 기본 지정)
    String currentPage = request.getParameter("page");
    if (currentPage == null) currentPage = "admin_memberList.jsp";
%>

<!--
  ===============================================
   < Qly 관리자 사이드바 메뉴 (admin_sidebar.jsp) >

   ▸ Qly 관리자 페이지 좌측 고정 메뉴바입니다.
   ▸ 각 메뉴 클릭 시 admin_layout.jsp?page=파일명.jsp 로 이동
   ▸ 현재 활성화된 메뉴는 .active 클래스 적용으로 강조됨

    메뉴 구성:
      - 회원 관리
      - 퀘스트 관리
      - 코인 관리
      - 사내 일정
      - 매출 통계
      - 사내 정책
      - 보안 정책
      - 환경 설정
  ===============================================
-->

<!--  사이드바 메뉴 스타일 -->
<style>
    .sidebar-menu li {
        padding: 12px 24px;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.2s ease;
        font-size: 18px;
    }

    .sidebar-menu li:hover {
        background-color: #e8f9f7;
    }

    .sidebar-menu .active {
        font-weight: bold;
        background-color: #d4f3ef;
    }
</style>

<!--  Qly 로고 영역 -->
<div style="text-align: center; margin-bottom: 30px;">
    <img src="https://i.postimg.cc/0j1MDRhn/logo.png" alt="Qly 로고" width="250">
</div>

<!--  메뉴 리스트 영역 -->
<div style="background: white; color: #2f3542; border-radius: 12px; padding: 10px 0; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
    <ul class="sidebar-menu" style="list-style: none; padding: 0; margin: 0;">
        <li class="<%= currentPage.equals("admin_memberList.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_memberList.jsp'">
            회원 관리
        </li>

        <li class="<%= currentPage.equals("admin_questList.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_questList.jsp'">
            퀘스트 관리
        </li>

        <li class="<%= currentPage.equals("admin_coinList.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_coinList.jsp'">
            코인 관리
        </li>

        <li class="<%= currentPage.equals("admin_schedule.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_schedule.jsp'">
            사내 일정
        </li>

        <li class="<%= currentPage.equals("admin_sales.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_sales.jsp'">
            매출 통계
        </li>

        <li class="<%= currentPage.equals("admin_policy.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_policy.jsp'">
            사내 정책
        </li>

        <li class="<%= currentPage.equals("admin_security.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_security.jsp'">
            보안 정책
        </li>

        <li class="<%= currentPage.equals("admin_setting.jsp") ? "active" : "" %>"
            onclick="location.href='admin_layout.jsp?page=admin_setting.jsp'">
            환경 설정
        </li>
    </ul>
</div>
