<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료한 퀘스트</title>

<!-- Bootstrap & jQuery -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 상태 점 스타일 -->
<style>
.status-dot {
  display: inline-block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  margin-right: 6px;
  vertical-align: middle;
}
.dot-complete { background-color: #28a745; } /* 완료 */
</style>

<script>
  $(document).ready(function () {
    $("#searchInput").on("keyup", function () {
      const keyword = $(this).val().toLowerCase();
      $(".quest-card").each(function () {
        const cardText = $(this).text().toLowerCase();
        $(this).toggle(cardText.includes(keyword));
      });
    });
  });
</script>
</head>
<body>

<div class="container my-4">
  <h4 class="mb-4 fw-bold">내가 완료한 퀘스트</h4>

  <input type="text" id="searchInput" class="form-control mb-4" placeholder="제목, 카테고리 등 검색">

  <div class="row row-cols-1 row-cols-md-2 g-4">

    <!-- 카드 예시 1 -->
    <div class="col quest-card">
      <div class="card shadow-sm p-3">
        <div class="mb-2">
          <span class="fw-bold">[카테고리]</span> 생활 수리
        </div>
        <div class="mb-2 d-flex align-items-center">
          <div class="status-dot dot-complete" title="완료"></div>
          <span class="fw-bold">제목:</span> 수도꼭지 고쳐드렸어요
        </div>
        <div class="mb-3"><span class="fw-bold">신청일:</span> 2025-06-12</div>
        <div class="d-flex justify-content-end gap-2">
          <button class="btn btn-outline-primary btn-sm">상세보기</button>
        </div>
      </div>
    </div>

    <!-- 카드 예시 2 -->
    <div class="col quest-card">
      <div class="card shadow-sm p-3">
        <div class="mb-2">
          <span class="fw-bold">[카테고리]</span> 반려동물 산책
        </div>
        <div class="mb-2 d-flex align-items-center">
          <div class="status-dot dot-complete" title="완료"></div>
          <span class="fw-bold">제목:</span> 강아지 산책 도와주세요
        </div>
        <div class="mb-3"><span class="fw-bold">신청일:</span> 2025-06-10</div>
        <div class="d-flex justify-content-end gap-2">
          <button class="btn btn-outline-primary btn-sm">상세보기</button>
        </div>
      </div>
    </div>

    <!-- 카드 예시 3 -->
    <div class="col quest-card">
      <div class="card shadow-sm p-3">
        <div class="mb-2">
          <span class="fw-bold">[카테고리]</span> 청소
        </div>
        <div class="mb-2 d-flex align-items-center">
          <div class="status-dot dot-complete" title="완료"></div>
          <span class="fw-bold">제목:</span> 원룸 청소 부탁해요
        </div>
        <div class="mb-3"><span class="fw-bold">신청일:</span> 2025-06-05</div>
        <div class="d-flex justify-content-end gap-2">
          <button class="btn btn-outline-primary btn-sm">상세보기</button>
        </div>
      </div>
    </div>

  </div>
</div>

</body>
</html>
