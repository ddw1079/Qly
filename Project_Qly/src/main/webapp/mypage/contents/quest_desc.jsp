<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>퀘스트 상세 페이지</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 40px; background: #f9f9f9; }
        .quest-container { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); max-width: 700px; margin: auto; padding: 32px; }
        .quest-title { font-size: 2rem; font-weight: bold; margin-bottom: 16px; }
        .quest-meta { color: #888; font-size: 0.95rem; margin-bottom: 24px; }
        .quest-desc { font-size: 1.1rem; margin-bottom: 32px; }
        .quest-reward { background: #f0f6ff; padding: 16px; border-radius: 6px; margin-bottom: 24px; }
        .quest-actions { text-align: right; }
        .quest-actions button { background: #1976d2; color: #fff; border: none; padding: 10px 22px; border-radius: 4px; font-size: 1rem; cursor: pointer; }
        .quest-actions button:disabled { background: #b0b0b0; cursor: not-allowed; }
    </style>
</head>
<body>
    <div class="quest-container">
        <div class="quest-title">[퀘스트 제목 예시]</div>
        <div class="quest-meta">
            <span>작성자: 홍길동</span> | 
            <span>등록일: 2024-06-20</span> | 
            <span>진행 상태: 진행중</span>
        </div>
        <div class="quest-desc">
            이곳에 퀘스트의 상세 설명이 들어갑니다. 퀘스트의 목적, 조건, 주의사항 등을 자세히 안내합니다.
        </div>
        <div class="quest-reward">
            <strong>보상:</strong> 1,000 포인트, 특별 아이템
        </div>
        <div class="quest-actions">
            <button type="button">퀘스트 수락</button>
            <button type="button" disabled>완료 제출</button>
        </div>
    </div>
</body>
</html>