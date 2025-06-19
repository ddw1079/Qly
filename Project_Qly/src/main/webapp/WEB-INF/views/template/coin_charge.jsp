<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS CDN (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<!-- Coin Charge Modal -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<div class="modal fade" id="chargeCoinModal" data-bs-backdrop="static"  tabindex="-1" aria-labelledby="chargeCoinModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="chargeCoinForm">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="chargeCoinModalLabel">코인 충전</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="coinAmount">충전할 코인 수</label>
                            <input type="number" class="form-control" id="coinAmount" name="coinAmount" min="0" value="0" required>
                            <span class="input-group-text">코인</span>
                        </div>

                        <div class="mt-2 d-flex justify-content-between">
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(1000)">+1천</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(5000)">+5천</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(10000)">+1만</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(100000)">+10만</button>
                            <button type="button" class="btn btn-outline-success" onclick="increaseCoin(1000000)">+100만</button>
                        </div>
                        <script>
                        function increaseCoin(amount) {
                            let coinInput = document.getElementById("coinAmount");
                            let currentValue = parseInt(coinInput.value) || 0;
                            coinInput.value = currentValue + amount;
                        }
                        </script>
                    </div>
                    <div class="mb-3">
                        <label for="paymentMethod" class="form-label">결제 방법</label>
                        <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                            <option value="">선택하세요</option>
                            <option value="credit_card">신용카드</option>
                            <option value="bank_transfer">계좌이체</option>
                            <option value="mobile">휴대폰 결제</option>
                        </select>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="text-muted fw-light">이용 약관을 확인하였으며 이에 동의합니다.</span>
                        <a href="/terms" class="text-decoration-none">이용 약관</a>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-flex justify-content-between w-100 mb-3">
                        
                        <label for="totalAmount">총 결제 금액</label>
                        <span id="totalAmount" class="fw-bold">0원</span>
                        <script>
                        function increaseCoin(amount) {
                            let coinInput = document.getElementById("coinAmount");
                            let currentValue = parseInt(coinInput.value) || 0;
                            coinInput.value = currentValue + amount;
                            updateTotal(); // 코인 수 변경 시 총 금액 업데이트
                        }
                        function updateTotal() {
                            let coinInput = document.getElementById("coinAmount");
                            let totalAmount = document.getElementById("totalAmount");

                            let value = parseInt(coinInput.value) || 0;
                            let total = value * 10; // 1 코인 = 10원 가정
                            totalAmount.textContent = total.toLocaleString() + "원"; // 쉼표 추가하여 금액 표시
                        }

                        // 입력 값이 변경될 때 자동으로 반영되도록 설정
                        document.getElementById("coinAmount").addEventListener("input", updateTotal);
                        </script>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-success">충전하기</button>
                    </div>
                </div>
            </form>
            <script>
            document.getElementById("chargeCoinForm").addEventListener("submit", async (event) => {
                event.preventDefault(); // 폼 제출 방지

                // 입력 값 가져오기
                let coinAmount = document.getElementById("coinAmount").value;
                let paymentMethod = document.getElementById("paymentMethod").value;
                let totalAmount = document.getElementById("totalAmount").textContent;
                // 금액 문자열에서 '원' 제거 및 쉼표 제거 
                totalAmount = parseInt(totalAmount.replace(/[^0-9]/g, ''));
                // 유효성 검사
                if (totalAmount <= 0 || !paymentMethod) {
                    alert("충전할 코인 수와 결제 방법을 올바르게 선택해주세요.");
                    return;
                }

                // 충전 로직 (예: AJAX 요청 등)
                const IMP = window.IMP;
                IMP.init('imp15327364'); // 가맹점 식별코드 입력
                const requestData = {
                    pg: 'kakaopay', // 결제 수단
                    pay_method: 'card',
                    merchant_uid: "order_" + new Date().getTime(), // 주문 고유 ID
                    amount: totalAmount, // 1 코인 = 10원 가정
                    name: '퀘스트 코인 충전 - ' + totalAmount + '코인',
                    buyer_name: '사용자 이름',
                    buyer_tel: '010-1234-5678',
                    buyer_email: 'email@email.co.kr',
                    buyer_addr: '서울특별시 강남구',
                    buyer_postcode: '12345',
                };
                IMP.request_pay(requestData, function(response) {
                        // 서버에 결제 정보 전송 (예: AJAX 요청)
                        $.post('/chargeCoin', {
                            coinAmount: coinAmount,
                            paymentMethod: paymentMethod,
                            totalAmount: totalAmount,
                            imp_uid: response.imp_uid, // 아임포트 결제 고유 ID
                            merchant_uid: response.merchant_uid // 주문 고유 ID
                        }, function(response) {
                            if (response.success) {
                                alert('코인 충전이 완료되었습니다. 충전된 코인 수: ' + response.coinAmount);
                                // 페이지 새로고침 또는 코인 잔액 업데이트 로직 추가
                                location.reload(); // 페이지 새로고침
                            } else {
                                alert('코인 충전에 실패하였습니다. 에러 메시지: ' + response.error_msg);
                            }
                        });
                    if (response.success) {

                        // 모달 닫기
                        $('#chargeCoinModal').modal('hide');
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
