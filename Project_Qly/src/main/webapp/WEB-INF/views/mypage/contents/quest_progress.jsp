<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>퀘스트 진행 내역 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background: #f8f9fa; margin: 0; padding: 0; }
        h2 { margin-top: 0; color: #2d3748; }
        .quest-info { margin-bottom: 24px; }
        .quest-info dt { font-weight: bold; color: #4a5568; margin-top: 12px; }
        .quest-info dd { margin: 0 0 8px 0; color: #2d3748; }
    </style>
</head>
<body>
    <div class="container">
        <div class="card my-4">
            <div class="card-body">
                <h2 class="card-title">퀘스트 진행 내역 상세</h2>
                <dl class="quest-info">
                    <dt>퀘스트명</dt>
                    <dd>예시 퀘스트 제목</dd>
                    <dt>설명</dt>
                    <dd>이 퀘스트는 사용자가 특정 목표를 달성하면 완료됩니다.</dd>
                    <dt>진행 상태</dt>
                    <dd>
                        <span class="badge text-bg-primary">진행중</span>
                    </dd>
                    <dt>진행률</dt>
                    <dd>
                        <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 75%"></div>
                        </div>
                    </dd>
                    <dt>시작일</dt>
                    <dd>2024-06-01</dd>
                    <dt>마감일</dt>
                    <dd>2024-06-30</dd>
                </dl>
                <a href="/mypage/quest_progress" class="btn btn-primary">목록으로</a>
            </div>
        </div>

    </div>
</body>
</html>