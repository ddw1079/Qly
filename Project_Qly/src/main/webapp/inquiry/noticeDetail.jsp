<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/template/menubar.jsp" %>

<%
    String id = request.getParameter("id"); // ?id=1 같은 형태
    String title = "";
    String content = "";
    String date = "";

    // 예시용 하드코딩 데이터 (실제 연동 시 DB에서 조회)
    if ("1".equals(id)) {
        title = "[이벤트] 시스템 개선 안내";
        content = "시스템 성능이 향상되어 더 쾌적한 QLY 사용이 가능합니다.";
        date = "2025-06-10";
    } else if ("2".equals(id)) {
        title = "[점검] 6월 20일 시스템 정기 점검 안내";
        content = "6월 20일 오전 2시 ~ 5시까지 서비스 이용이 일시 중단됩니다.";
        date = "2025-06-12";
    } else if ("3".equals(id)) {
        title = "[업데이트] QLY v2.0 기능 개선 안내";
        content = "UI 개선 및 퀘스트 신청 프로세스가 더 쉬워졌습니다.";
        date = "2025-06-15";
    } else {
        title = "공지사항 정보 없음";
        content = "해당 공지사항 정보를 찾을 수 없습니다.";
        date = "";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-3">공지사항 상세</h2>
    <div class="card shadow-sm">
        <div class="card-body">
            <h4 class="card-title"><%= title %></h4>
            <p class="text-muted"><%= date %></p>
            <hr>
            <p class="card-text" style="white-space: pre-line;"><%= content %></p>
        </div>
    </div>
    <div class="mt-4">
        <a href="${pageContext.request.contextPath}/inquiry/list.do" class="btn btn-outline-secondary">← 목록으로</a>
    </div>
</div>
</body>
</html>
