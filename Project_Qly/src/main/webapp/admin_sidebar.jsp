<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String currentPage = request.getParameter("page");
    if (currentPage == null) currentPage = "admin_memberList.jsp";
%>

<div style="text-align: center; margin-bottom: 30px;">
    <img src="https://cdn-icons-png.flaticon.com/512/2584/2584674.png" alt="로고" style="width: 100px;">
</div>

<div style="background: white; color: #2f3542; border-radius: 12px; padding: 10px 0; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <ul style="list-style: none; padding: 0; margin: 0;">
        <li style="padding: 12px 24px; cursor: pointer; <%= currentPage.equals("admin_memberList.jsp") ? "font-weight: bold;" : "" %>" 
            onclick="location.href='admin_layout.jsp?page=admin_memberList.jsp'">회원 관리</li>

        <li style="padding: 12px 24px; cursor: pointer; <%= currentPage.equals("admin_questList.jsp") ? "font-weight: bold;" : "" %>" 
            onclick="location.href='admin_layout.jsp?page=admin_questList.jsp'">퀘스트 관리</li>

        <li style="padding: 12px 24px; cursor: pointer; <%= currentPage.equals("admin_coinList.jsp") ? "font-weight: bold;" : "" %>" 
            onclick="location.href='admin_layout.jsp?page=admin_coinList.jsp'">코인 관리</li>

        <li style="padding: 12px 24px; cursor: pointer; <%= currentPage.equals("admin_setting.jsp") ? "font-weight: bold;" : "" %>" 
            onclick="location.href='admin_layout.jsp?page=admin_setting.jsp'">설정</li>
    </ul>
</div>
