<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<!-- CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
/* 모달 디자인 */
.modal-content {
	border-radius: 15px;
	border: none;
	overflow: hidden;
	background-color: #ffffff;
}

/* 상단 제목 박스 */
.coin-header-top {
	width: 100%;
	background-color: #ffffff;
	padding: 16px 0;
	text-align: center;
	font-size: 1.4rem;
	font-weight: bold;
	color: #2ca89d;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.05);
	border-top-left-radius: 16px;
	border-top-right-radius: 16px;
}

/* 인사영역 */
.coin-header {
	background-color: #e1f8f4;
	padding: 20px 24px 12px;
	text-align: left;
}

.coin-header .subtitle {
	font-size: 1.2rem;
	font-weight: 700;
	color: #08685e;
	margin-bottom: 6px;
}

.coin-header .description {
	font-size: 0.95rem;
	color: #555;
}

/* 코인 이미지 */
.coin-image {
	display: flex;
	justify-content: center;
	margin: 20px 0;
}

/* 민트 버튼 스타일 */
.btn-primary-mint {
	background-color: #3cbfae;
	color: white;
	font-weight: bold;
	border: none;
	width: 100%;
	padding: 14px;
	border-radius: 10px;
}

.btn-primary-mint:hover {
	background-color: #35a89e;
}

.btn-secondary-mint {
	background-color: #f0f0f0;
	color: #08685e;
	font-weight: bold;
	border: none;
	width: 100%;
	padding: 14px;
	border-radius: 10px;
	margin-top: 10px;
}
</style>

<%-- 세션의 유저 데이터를 사용하기 위한 구문 --%>
<%
com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");
%>
<script>
const modal = document.getElementById("chargeCoinModal");
modal.addEventListener("hidden.bs.modal", () => {
    document.getElementById("chargeCoinForm").reset();
});
</script>
<!-- 💰 코인 충전 모달 -->
<div class="modal fade" id="chargeCoinModal" data-bs-backdrop="static"
	tabindex="-1" aria-hidden="true" aria-labelledby="chargeCoinModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- 상단 제목 -->
			<div class="coin-header-top">QLY 코인 충전</div>

			<!-- 인사말 + 설명 -->
			<div class="coin-header">
				<div class="subtitle">안녕하세요, ${loginUser.username}님!</div>
				<div class="description">충전한 코인은 퀘스트 수행, 보상 등에 사용할 수 있습니다.</div>
			</div>

			<!-- 코인 이미지 -->
			<div class="coin-image">
				<img src="https://i.postimg.cc/RZGZ6gFZ/coin.png" width="100px" />
			</div>

			<!-- 충전 폼 -->
			<form id="chargeCoinForm" method="post"
				action="${pageContext.request.contextPath}/payments/success"
				accept-charset="UTF-8">
				<div class="px-4 pb-4">
					<!-- 충전 수 -->
					<div class="input-group mb-2">
						<label class="input-group-text">충전 수</label> <input type="number"
							class="form-control" id="coinAmount" name="coinAmount" min="0"
							value="0" oninput="updateTotal()" required> <span
							class="input-group-text">코인</span>
					</div>

					<!-- 빠른 선택 버튼 -->
					<div class="d-flex justify-content-between flex-wrap gap-2 mb-3">
						<button type="button" class="btn btn-outline-success"
							onclick="increaseCoin(1000)">+1천</button>
						<button type="button" class="btn btn-outline-success"
							onclick="increaseCoin(5000)">+5천</button>
						<button type="button" class="btn btn-outline-success"
							onclick="increaseCoin(10000)">+1만</button>
						<button type="button" class="btn btn-outline-success"
							onclick="increaseCoin(100000)">+10만</button>
					</div>

					<!-- 결제 방식 -->
					<select class="form-select mb-3" id="paymentMethod"
						name="paymentMethod" required>
						<option value="">결제 방법 선택</option>
						<option value="kakaopay">카카오페이</option>
						<option value="tosspay">토스페이</option>
					</select>

					<!-- 약관 -->
					<div class="mb-2 d-flex justify-content-between align-items-center">
						<small class="text-muted">이용 약관에 동의합니다</small> <a
							href="${pageContext.request.contextPath}/template/termsAndConditions.jsp" target="_blank"
							class="text-decoration-none">약관 보기</a>
					</div>

					<!-- 총 결제 금액 -->
					<div class="d-flex justify-content-between mb-3">
						<span>총 결제 금액</span> <strong id="totalAmount">0원</strong>
					</div>

					<!-- 버튼 -->
					<button type="submit" id="submitBtn" class="btn-primary-mint">충전하기</button>
					<button type="button" class="btn-secondary-mint"
						data-bs-dismiss="modal">다음에 할게요</button>
				</div>
			</form>

			<!-- 💳 결제 스크립트 -->
			<script>
                function checkFormValidity() {
                    const coinAmount = parseInt(document.getElementById("coinAmount").value) || 0;
                    const paymentMethod = document.getElementById("paymentMethod").value;
                    const submitBtn = document.getElementById("submitBtn");

                    if (coinAmount > 0 && paymentMethod) {
                        submitBtn.disabled = false;
                    } else {
                        submitBtn.disabled = true;
                    }
                }

				function increaseCoin(amount) {
					const coinInput = document.getElementById("coinAmount");
					const currentValue = parseInt(coinInput.value) || 0;
					coinInput.value = currentValue + amount;
					updateTotal();
				}

				function updateTotal() {
					const coinInput = document.getElementById("coinAmount");
					const totalAmount = document.getElementById("totalAmount");
					const value = parseInt(coinInput.value) || 0;
					const total = value * 10;
					totalAmount.textContent = total.toLocaleString() + "원";
				}

				document.getElementById("coinAmount").addEventListener("input", updateTotal);

				document.getElementById("chargeCoinForm").addEventListener("submit", function (event) {
                    event.preventDefault(); // 기본 form 제출 막기
					const coinAmount = document.getElementById("coinAmount").value;
					const paymentMethod = document.getElementById("paymentMethod").value;
					const totalText = document.getElementById("totalAmount").textContent;
					const totalAmount = parseInt(totalText.replace(/[^0-9]/g, ''));

					// document.getElementById("description").value = `퀘스트 코인 충전 - ${coinAmount}코인`;
					// console.log(document.getElementById("description").value);
					if (!paymentMethod || totalAmount <= 0) {
						alert("충전할 코인 수와 결제 방법을 올바르게 선택해주세요.");
						event.preventDefault();
						return;
					}

					if (paymentMethod !== "kakaopay") {
						alert("현재는 카카오페이만 지원됩니다.");
						event.preventDefault();
						return;
					}
					document.charset = "UTF-8";
					// document.getElementById("chargeCoinForm").submit(); // 수동 제출
					
					const IMP = window.IMP;
					IMP.init('imp15327364');
					IMP.request_pay({
						pg: paymentMethod,
						pay_method: 'card',
						merchant_uid: "order_" + new Date().getTime(),
						amount: totalAmount,
						name: '퀘스트 코인 충전 - ' + coinAmount + '코인',
						buyer_name: "${loginUser.username}",
						buyer_tel: "${loginUser.phone}",
						buyer_email: "${loginUser.email}",
						buyer_addr: "${loginUser.address}"
					}, function (rsp) {
						if (rsp.success) {
	                        document.getElementById("chargeCoinForm").submit(); // 수동 제출
							alert("결제가 완료되었습니다.");
						} else {
							alert("결제 실패: " + rsp.error_msg);
						}
					});
				});

			</script>
		</div>
	</div>
</div>
