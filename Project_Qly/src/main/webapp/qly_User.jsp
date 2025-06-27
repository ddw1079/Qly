<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<!-- Bootstrap & jQuery -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	height: 100vh;
	background: linear-gradient(135deg, #f8fefc, #d2f9f3);
	display: flex;
	align-items: center;
	justify-content: center;
}

.agree-box {
	width: 800px;
	backdrop-filter: blur(20px);
	background: rgba(255, 255, 255, 0.35);
	border: 2px solid #5bd6c7;
	border-radius: 20px;
	box-shadow: 0 12px 28px rgba(0, 0, 0, 0.1);
	padding: 40px 50px;
}

.agree-box h3 {
	margin-bottom: 30px;
	font-weight: bold;
	color: #104b47;
	text-align: center;
}

.form-check-label {
	font-weight: 500;
	color: #104b47;
}

.agreement-content {
	height: 120px;
	overflow-y: scroll;
	background-color: rgba(255, 255, 255, 0.85);
	padding: 10px;
	border-radius: 10px;
	border: 1px solid #cceee8;
	margin-top: 10px;
	font-size: 0.95rem;
	color: #333;
}

.btn-next {
	width: 100%;
	padding: 14px;
	border: none;
	border-radius: 10px;
	background: linear-gradient(to right, #5de6c7, #42c7b1);
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease;
}
.btn-next:disabled {
	opacity: 0.6;
	cursor: not-allowed;
}
.btn-next:hover:enabled {
	background: linear-gradient(to right, #4bd2b5, #34b7a2);
}
</style>
<script>
    function toggleAll(source) {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(cb => cb.checked = source.checked);
        checkNextButton();
    }

    function checkNextButton() {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        const allChecked = Array.from(checkboxes).every(cb => cb.checked);
        document.getElementById("nextBtn").disabled = !allChecked;
    }

    function validateAgreement() {
        document.getElementById("agreementForm").submit();
    }

    $(document).ready(function () {
        $('input[type="checkbox"]').on('change', checkNextButton);
    });
</script>
</head>
<body>
<div class="agree-box">
    <h3>회원가입 약관 동의</h3>
    
    <form id="agreementForm" action="qly_Join.jsp" method="post">
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" id="agreeAll" onclick="toggleAll(this)">
            <label class="form-check-label fw-bold" for="agreeAll">
                전체 동의하기
            </label>
        </div>

        <div class="border rounded p-3 mb-3 bg-white bg-opacity-75">
            <div class="form-check">
                <input class="form-check-input required" type="checkbox" id="terms1" name="terms1">
                <label class="form-check-label" for="terms1">
                    [Qly] 이용약관 동의
                </label>
            </div>
            <div class="agreement-content">
                본 약관은 회원님의 서비스 이용과 관련된 기본적인 권리, 의무 및 책임사항을 규정하고 있습니다.
                서비스를 원활하게 이용하시려면 약관 내용을 충분히 숙지하신 후 동의해 주세요.
            </div>
        </div>

        <div class="border rounded p-3 mb-3 bg-white bg-opacity-75">
            <div class="form-check">
                <input class="form-check-input required" type="checkbox" id="terms2" name="terms2">
                <label class="form-check-label" for="terms2">
                    [Qly] 개인정보 수집 및 이용 동의
                </label>
            </div>
            <div class="agreement-content">
                Qly 서비스 제공을 위해 아래와 같은 개인정보를 수집·이용합니다.
                서비스 이용을 위해 꼭 필요한 정보이니, 내용을 확인하신 후 동의해 주세요.
                <br><br>
                수집 항목: 이름, 연락처(전화번호/이메일), 아이디, 비밀번호<br>
                수집 목적: 회원 식별 및 본인 인증, 서비스 제공 및 고객 응대<br>
                보유 기간: 회원 탈퇴 시까지 (관련 법령에 따라 일정 기간 보관될 수 있음)<br><br>
                ※ 개인정보 수집 및 이용에 동의하지 않을 경우, 회원가입이 제한될 수 있습니다.
            </div>
        </div>

        <div class="border rounded p-3 mb-4 bg-white bg-opacity-75">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="terms3" name="terms3">
                <label class="form-check-label" for="terms3">
                    [Qly] 마케팅 정보 수신 동의
                </label>
            </div>
            <div class="agreement-content">
                Qly의 이벤트, 신규 서비스, 할인 혜택 등의 소식을 받아보시겠습니까?
                알림 수신에 동의하시면 다양한 프로모션과 맞춤형 정보를 빠르게 안내해 드립니다.
                <br><br>
                수신 항목: 이메일, 문자(SMS), 앱 알림(Push) 등<br>
                수신 목적: 이벤트 안내, 신규 서비스 소개, 맞춤형 혜택 제공<br>
                수신 거부: 언제든지 마이페이지에서 수신을 거부하실 수 있습니다.
                <br><br>
                ※ 본 항목은 선택 사항이며, 동의하지 않아도 서비스 이용에는 제한이 없습니다.
            </div>
        </div>

        <button type="button" class="btn-next" id="nextBtn" onclick="validateAgreement()" disabled>다음</button>
    </form>
</div>
</body>
</html>
