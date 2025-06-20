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
            <%-- controller 유저 데이터 확인용--%>
            <div>
                <c:if test="${not empty user}">
                    <p class="text-center">안녕하세요, ${user.name}님!</p>
                <c:else>
                    <p class="text-center">로그인 후 코인을 충전할 수 있습니다.</p>
                </c:else>
                </c:if>
            </div>
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
                            <option value="kakaopay">카카오페이</option>
                            <option value="tosspay">토스페이</option>
                            <option value="naverpay">네이버페이</option>
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
                            let total = value * 10; // 1 코인 = 10원
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
                let paymentMethodText = document.querySelector("#paymentMethod option:checked").textContent;
                let totalAmount = document.getElementById("totalAmount").textContent;
                // 금액 문자열에서 '원' 제거 및 쉼표 제거 
                totalAmount = parseInt(totalAmount.replace(/[^0-9]/g, ''));
                

                switch (paymentMethod) {
                    case "kakaopay":
                        break;
                    case "tosspay":
                        alert("토스페이는 현재 지원하지 않습니다.");
                        return;
                    case "naverpay":
                        alert("네이버페이는 현재 지원하지 않습니다.");
                        return;
                    default:
                        alert("올바른 접근 방식이 아닙니다.");
                        return;
                }

                // 유효성 검사
                if (totalAmount <= 0 || !paymentMethod) {
                    alert("충전할 코인 수와 결제 방법을 올바르게 선택해주세요.");
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
                    name: '퀘스트 코인 충전 - ' + totalAmount + '코인',
                    buyer_name: ${user.username}, // 사용자 이름
                    buyer_tel: ${user.phone},
                    buyer_email: ${user.email},
                    buyer_addr: ${user.address},
                };
                IMP.request_pay(requestData, function(response) {
                    if (response.success) {
                        // 결제 성공
                        alert('결제가 완료되었습니다. 결제 금액: ' + response.paid_amount + '원');
                        
                        // 서버에 결제 정보 저장
                        $.post('/charge/success', {
                            userId: ${user.userId}, // 사용자 ID
                            paymentDate: , // 결제 날짜 (YYYY-MM-DD 형식)
                            amount: , // 결제 금액
                            paymentMethod: paymentMethod, // 결제 방법
                            status: '결제 성공', // 결제 상태
                            remainCoin:  // 잔여 코인 (선택적 필드)
                        }, function(data) {
                            console.log('결제 정보 저장 완료:', data);
                        }).fail(function(xhr, status, error) {
                            console.error('결제 정보 저장 실패:', error);
                        });

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
