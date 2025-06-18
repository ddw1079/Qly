<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>퀘스트 진행 상황 - 해결사</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <!-- Bootstrap Bundle JS (includes Popper.js for modal) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    .map-placeholder {
      width: 100%;
      height: 120px;
      background-color: #e0e0e0;
      text-align: center;
      line-height: 120px;
      color: #888;
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <div class="text-center mb-4">
    <h3 class="fw-bold">퀘스트 진행 상황</h3>
  </div>

  <form method="post">
    <div class="row">
      <!-- 왼쪽: 퀘스트 카드 -->
      <div class="col-md-8 mb-4">
        <div class="card shadow">
          <div class="card-header fw-bold fs-5">제목</div>
          <img src="cat.jpg" alt="고양이" class="card-img-top">
          <div class="card-body">
            <p class="card-text fs-5">사진</p>
            <!-- 진행률 바 -->
            <div class="mb-3">
              <label class="form-label fw-bold">전체 진행도 37%</label>
              <div class="progress">
                <div class="progress-bar bg-success" role="progressbar" style="width: 37%;"
                     aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 오른쪽: 위치 + 보상 -->
      <div class="col-md-4">
        <!-- 위치 카드 -->
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">위치: 곰곰시 능농로 둠둠길</h5>
            <div class="map-placeholder">지도</div>
            <p class="mt-3" style="font-size: 0.9em;">
              퀘스트 일정: ㅇㅇ일 ㅇㅇ시<br>
              퀘스트 현황: 시작전 / 진행중 / 종료 - 실패 / 종료 - 성공
            </p>
          </div>
        </div>

        <!-- 보상 카드 -->
        <div class="card">
          <div class="card-body text-center">
            <p class="mb-1 fw-bold">보상</p>
            <h5 class="text-primary">500 Qubit</h5>
            <button
              type="button"
              id="rewardBtn"
              class="btn btn-success mt-2"
              data-bs-toggle="modal"
              data-bs-target="#rewardModal">
              보상 받기
            </button>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>

<!-- 보상 모달 -->
<div class="modal fade" id="rewardModal" tabindex="-1" aria-labelledby="rewardModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content text-center">
      <div class="modal-header border-0">
        <h5 class="modal-title w-100 fw-bold text-uppercase" id="rewardModalLabel">Quest Clear! Reward Delivered!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      </div>
      <div class="modal-body">
        <p class="text-success fw-semibold">퀘스트 클리어!!<br>보상 지급이 완료되었습니다.</p>
        <img src="https://i.postimg.cc/7hNhpBZn/coin.png" alt="보상 이미지" class="img-fluid my-3" style="max-width: 150px;">500
        <p class="fw-bold">[06.13] 500큐빗</p>
        <div class="text-muted small mt-3">
          ⚠ 보상은 개인 내 [코인 보기 ▶ 보유 코인]으로 지급되며 최대 10분까지 소요될 수 있습니다.
        </div>
      </div>
      <div class="modal-footer border-0">
        <button type="button" class="btn btn-success w-100 fw-bold" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
