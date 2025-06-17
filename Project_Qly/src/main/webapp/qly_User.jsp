<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<!-- Bootstrap & jQuery -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
<body class="container mt-5">
    <h3 class="mb-4">회원가입 약관 동의</h3>
    
    <form id="agreementForm" action="qly_Join.jsp" method="post"> <!-- 회원가입페이지로 -->
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" id="agreeAll" onclick="toggleAll(this)">
            <label class="form-check-label fw-bold" for="agreeAll">
                전체 동의하기
            </label>
        </div>

        <div class="border rounded p-3 mb-3">
            <div class="form-check">
                <input class="form-check-input required" type="checkbox" id="terms1" name="terms1">
                <label class="form-check-label" for="terms1">
                    [Qly] 이용약관 동의
                </label>
            </div>
            <div class="mt-2 border p-2 bg-light" style="height: 100px; overflow-y: scroll;">
                본 약관은 회원님의 서비스 이용과 관련된 기본적인 권리, 의무 및 책임사항을 규정하고 있습니다.
                서비스를 원활하게 이용하시려면 약관 내용을 충분히 숙지하신 후 동의해 주세요.
            </div>
        </div>

        <div class="border rounded p-3 mb-3">
            <div class="form-check">
                <input class="form-check-input required" type="checkbox" id="terms2" name="terms2">
                <label class="form-check-label" for="terms2">
                    [Qly] 개인정보 수집 및 이용 동의
                </label>
            </div>
            <div class="mt-2 border p-2 bg-light" style="height: 100px; overflow-y: scroll;">
                Qly 서비스 제공을 위해 아래와 같은 개인정보를 수집·이용합니다.
                서비스 이용을 위해 꼭 필요한 정보이니, 내용을 확인하신 후 동의해 주세요.

                수집 항목: 이름, 연락처(전화번호/이메일), 아이디, 비밀번호

                수집 목적: 회원 식별 및 본인 인증, 서비스 제공 및 고객 응대

                보유 기간: 회원 탈퇴 시까지 (관련 법령에 따라 일정 기간 보관될 수 있음)

                ※ 개인정보 수집 및 이용에 동의하지 않을 경우, 회원가입이 제한될 수 있습니다.
            </div>
        </div>

        <div class="border rounded p-3 mb-3">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="terms3" name="terms3">
                <label class="form-check-label" for="terms3">
                    [Qly] 마케팅 정보 수신 동의
                </label>
            </div>
            <div class="mt-2 border p-2 bg-light" style="height: 100px; overflow-y: scroll;">
                Qly의 이벤트, 신규 서비스, 할인 혜택 등의 소식을 받아보시겠습니까?
                알림 수신에 동의하시면 다양한 프로모션과 맞춤형 정보를 빠르게 안내해 드립니다.

                수신 항목: 이메일, 문자(SMS), 앱 알림(Push) 등

                수신 목적: 이벤트 안내, 신규 서비스 소개, 맞춤형 혜택 제공

                수신 거부: 언제든지 마이페이지에서 수신을 거부하실 수 있습니다.

                ※ 본 항목은 선택 사항이며, 동의하지 않아도 서비스 이용에는 제한이 없습니다.
            </div>
        </div>

        <button type="button" class="btn btn-success w-100" id="nextBtn" onclick="validateAgreement()" disabled>다음</button>
    </form>
</body>
</html>
