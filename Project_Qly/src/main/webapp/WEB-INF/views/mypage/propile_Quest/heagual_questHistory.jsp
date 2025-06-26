<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 진행 상황 - 해결사</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<!-- Kakao Map SDK (autoload=false 설정) -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffded417f5d8a057e299cf7acb7c310a&autoload=false&libraries=services"></script>

<style>
.map-placeholder {
	width: 100%;
	height: 200px;
}
</style>
</head>

<body>
<c:forEach var="quest" items="${questList}">
	<div class="container mt-4">
		<div class="text-center mb-4">
			<h3 class="fw-bold">퀘스트 진행 상황</h3>
		</div>

		<form action="${pageContext.request.contextPath}/mypage/giveReward.do" method="post">
			<input type="hidden" name="questId" value="${quest.questId}">

			<div class="row">
				<!-- 퀘스트 카드 -->
				<div class="col-md-8 mb-4">
					<div class="card shadow">
						<div class="card-header fw-bold fs-5">${quest.title}</div>
						<img src="${quest.photoPath}" class="card-img-top" style="height: 300px; object-fit: cover;" alt="이미지">
						<div class="card-body">
							<p class="card-text fs-5">사진</p>

							<!-- 진행률 -->
							<div class="mb-3">
								<label class="form-label fw-bold">전체 진행도 ${progressMap[quest.questId]}%</label>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: ${progressMap[quest.questId]}%"
										aria-valuenow="${progressMap[quest.questId]}" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

							<!-- 할 일 목록 -->
							<div class="mb-3">
								<label class="form-label fw-bold">할 일 목록</label>
								<ul class="list-group">
									<c:forEach var="task" items="${taskMap[quest.questId]}">
										<li class="list-group-item d-flex justify-content-between align-items-center">
											${task.description}
											<span class="badge bg-${task.isChecked == '1' ? 'success' : 'secondary'}">
												${task.isChecked == '1' ? '완료' : '미완료'}
											</span>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- 위치 및 보상 -->
				<div class="col-md-4">
					<div class="card mb-3">
						<div class="card-body">
							<h5 class="card-title">위치: ${quest.address}&nbsp;${quest.location}</h5>
							<div id="map-${quest.questId}" class="map-placeholder"></div>
							<p class="mt-3" style="font-size: 0.9em;">
								퀘스트 일정:
								<fmt:formatDate value="${quest.startDate}" pattern="yyyy-MM-dd" /> ~
								<fmt:formatDate value="${quest.endDate}" pattern="yyyy-MM-dd" />
								<br>퀘스트 현황: ${quest.status}
							</p>
						</div>
					</div>

					<div class="card">
						<div class="card-body text-center">
							<p class="mb-1 fw-bold">보상</p>
							<h5 class="text-primary">${quest.rewardTokens} Qubit</h5>

							<!-- 버튼 조건부 제어 -->
							<c:choose>
								<c:when test="${quest.status eq '완료' and (rewardGivenMap[quest.questId] == false or rewardGivenMap[quest.questId] == null)}">
									<button type="submit"
										class="btn btn-success mt-2 w-100 fw-bold"
										data-bs-toggle="modal"
										data-bs-target="#rewardModal-${quest.questId}">
										보상 받기
									</button>
								</c:when>
								<c:otherwise>
									<button type="button"
										class="btn btn-secondary mt-2 w-100 fw-bold"
										disabled>
										지급 완료
									</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</form>

		<!-- 보상 모달 -->
		<div class="modal fade" id="rewardModal-${quest.questId}" tabindex="-1"
			aria-labelledby="rewardModalLabel-${quest.questId}" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content text-center">
					<div class="modal-header border-0">
						<h5 class="modal-title w-100 fw-bold text-uppercase" id="rewardModalLabel-${quest.questId}">
							Quest Clear! Reward Delivered!
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
					</div>
					<div class="modal-body">
						<p class="text-success fw-semibold">
							퀘스트 클리어!!<br>보상 지급이 완료되었습니다.
						</p>
						<img src="https://i.postimg.cc/7hNhpBZn/coin.png" alt="보상 이미지" class="img-fluid my-3" style="max-width: 150px;">
						<p class="fw-bold">
							[<fmt:formatDate value="${quest.endDate}" pattern="MM.dd" />] ${quest.rewardTokens} 큐빗
						</p>
						<div class="text-muted small mt-3">
							⚠ 보상은 [내 코인 보기 ▶ 보유 코인]에 지급되며 최대 10분까지 소요될 수 있습니다.
						</div>
					</div>
					<div class="modal-footer border-0">
						<button type="button" class="btn btn-success w-100 fw-bold" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<!-- Kakao 지도 생성 -->
<script>
kakao.maps.load(function () {
  <c:forEach var="quest" items="${questList}">
    (function() {
      const lat = parseFloat("${quest.latitude}");
      const lng = parseFloat("${quest.longitude}");
      const mapId = "map-${quest.questId}";

      if (!isNaN(lat) && !isNaN(lng) && lat !== 0 && lng !== 0) {
        const container = document.getElementById(mapId);
        const map = new kakao.maps.Map(container, {
          center: new kakao.maps.LatLng(lat, lng),
          level: 3
        });
        new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(lat, lng),
          title: "${quest.title}"
        });
      }
    })();
  </c:forEach>
});
</script>

</body>
</html>
