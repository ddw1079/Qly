<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS CDN (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<!-- Coin Charge Modal -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%-- 세션의 유저 데이터를 사용하기 위한 구문 --%>
<% 	com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser"); %>
<div class="modal fade" id="chargeCoinModal" data-bs-backdrop="static"  tabindex="-1" aria-labelledby="chargeCoinModalLabel" aria-hidden="true">
<script>
const modal = document.getElementById("chargeCoinModal");
modal.addEventListener("hidden.bs.modal", () => {
    document.getElementById("chargeCoinForm").reset();
});
</script>
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <%-- controller 유저 데이터 확인용--%>
            <div>
            	<c:choose>
            		<c:when test="${not empty loginUser}">
            			<p class="text-center">안녕하세요, ${loginUser.username}님!</p>
            		</c:when>
            		<c:otherwise>
            			<p class="text-center">로그인 후 코인을 충전할 수 있습니다.</p>
            		</c:otherwise>
            	</c:choose>
            </div>
            <form id="chargeCoinForm" method="post" action="/payments/success" accept-charset="UTF-8">
            	<input type="hidden" id="reason" name="reason" />
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="chargeCoinModalLabel">코인 충전</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="coinAmount">충전할 코인 수</label>
                            <input type="number" class="form-control" id="coinAmount" name="coinAmount" 
                            oninput="updateTotal()" min="0" value="0" autocomplete="off" required />
                            <span class="input-group-text">코인</span>
                            <script>
                            
                            window.addEventListener("pageshow", function(event) {
                            	  if (event.persisted) {
                            	    // 캐시된 페이지가 뒤로가기로 다시 로드된 경우
                            	    document.getElementById("chargeCoinForm").reset();
                            	    document.getElementById("totalAmount").textContent = "0원";
                            	    document.getElementById("submitBtn").disabled = true;
                            	  }
                           	});
                            </script>
                        </div>

                        <div class="mt-2 d-flex justify-content-between">
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(1000)">+1천</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(5000)">+5천</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(10000)">+1만</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(100000)">+10만</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(1000000)">+100만</button>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="paymentMethod" class="form-label">결제 방법</label>
                        <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                            <option value="">선택하세요</option>
                            <option value="kakaopay">카카오페이</option>
                            <option value="tosspay">토스페이</option>
                            <option value="naverpay">네이버페이</option>
                        </select>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="text-muted fw-light">이용 약관을 확인하였으며 이에 동의합니다.</span>
                        <a href="javascript:void(0)" onclick="window.open('/template/termsAndConditions.jsp', 'termsPopup', 'width=800,height=600,scrollbars=yes,resizable=yes');" class="text-decoration-none">이용 약관</a>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-flex justify-content-between w-100 mb-3">
                        
                        <label for="totalAmount">총 결제 금액</label>
                        <span id="totalAmount" class="fw-bold">0원</span>
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
                            let coinInput = document.getElementById("coinAmount");
                            let currentValue = parseInt(coinInput.value) || 0;
                            coinInput.value = currentValue + amount;
                            updateTotal();
                            checkFormValidity();
                        }
                        function updateTotal() {
                            let coinInput = document.getElementById("coinAmount");
                            let totalAmount = document.getElementById("totalAmount");

                            let value = parseInt(coinInput.value) || 0;
                            let total = value * 10; // 1 코인 = 10원
                            totalAmount.textContent = total.toLocaleString() + "원"; // 쉼표 추가하여 금액 표시
                        }

                        // 입력값이 바뀔 때마다 체크되도록 연결
                        document.getElementById("coinAmount").addEventListener("input", checkFormValidity);
                        document.getElementById("paymentMethod").addEventListener("change", checkFormValidity);
                        </script>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" id="submitBtn" class="btn btn-success" disabled>충전하기</button>
                    </div>
                </div>
            </form>
            <script>
            document.getElementById("chargeCoinForm").addEventListener("submit", (event) => {
            	event.preventDefault(); // 기본 form 제출 막기
                const coinAmount = document.getElementById("coinAmount").value;
                const paymentMethod = document.getElementById("paymentMethod").value;
                const reason = "퀘스트 코인 충전 - " + paymentMethod + " - ${coinAmount}코인";

                const totalText = document.getElementById("totalAmount").textContent;
                const totalAmount = parseInt(totalText.replace(/[^0-9]/g, ''));
                document.getElementById("reason").value = "퀘스트 코인 충전 - ${coinAmount}코인";
                if (!paymentMethod || totalAmount <= 0) {
                    alert("충전할 코인 수와 결제 방법을 올바르게 선택해주세요.");
                    event.preventDefault();
                    return;
                }

                switch (paymentMethod) {
                    case "kakaopay":
                        break; // 통과
                    case "tosspay":
                    case "naverpay":
                        alert(`${document.querySelector("#paymentMethod option:checked").textContent}은 현재 지원하지 않습니다.`);
                        event.preventDefault();
                        return;
                    default:
                        alert("올바른 결제 방법을 선택해주세요.");
                        event.preventDefault();
                        return;
                }
				
                // 충전 로직 (예: AJAX 요청 등)
                const IMP = window.IMP;
                IMP.init('imp15327364'); // 가맹점 식별코드 입력
                const requestData = {
                    pg: paymentMethod, // 결제 수단
                    pay_method: 'card',
                    merchant_uid: "order_" + new Date().getTime(), // 주문 고유 ID
                    amount: totalAmount, // 1 코인 = 10원 가정
                    name: '퀘스트 코인 충전 - ' + coinAmount + '코인',
                    buyer_name: "${loginUser.username}", // 사용자 이름
                    buyer_tel: "${loginUser.phone}", // 사용자 전화번호
                    buyer_email: "${loginUser.email}", // 사용자 이메일
                    buyer_addr: "${loginUser.address}", // 사용자 주소
                };
                IMP.request_pay(requestData, function(response) {
                    if (response.success) {
                        // 결제 성공
                        document.getElementById("chargeCoinForm").submit(); // 수동 제출
                        alert('결제가 완료되었습니다. 결제 금액: ' + response.paid_amount + '원');
                    } else {
                        // 결제 실패
                        alert('결제에 실패하였습니다. 에러 메시지: ' + response.error_msg);
                    }
                });            
            });
            </script>
        </div>
    </div>
</div>
