<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>코인 출금</title>
  <%
  com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");
  String phone = loginUser != null ? loginUser.getPhone() : "01000000000"; // 기본값 또는 예외 처리%>
  
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #e9f7f5;
      margin: 0;
      padding: 20px;
    }
    .withdrawal-container {
      background: white;
      max-width: 400px;
      margin: 0 auto;
      padding: 30px 20px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      color: #00897b;
    }
    .section {
      margin-bottom: 20px;
    }
    .balance {
      display: flex;
      justify-content: space-between;
      font-weight: bold;
      font-size: 16px;
    }
    .amount-input-group {
      display: flex;
    }
    .amount-input-group input {
      flex: 1;
      padding: 8px;
      font-size: 16px;
    }
    .amount-input-group button {
      background-color: #ccc;
      border: none;
      padding: 8px 12px;
      cursor: pointer;
    }
    .quick-buttons button {
      margin-top: 8px;
      margin-right: 8px;
      padding: 6px 10px;
      border: none;
      background-color: #d9f1ee;
      cursor: pointer;
    }
    .checkbox label {
      display: flex;
      align-items: center;
    }
    .checkbox input {
      margin-right: 8px;
    }
    .primary {
      background-color: #00bfa5;
      color: white;
      border: none;
      width: 100%;
      padding: 12px;
      font-size: 16px;
      cursor: pointer;
      border-radius: 6px;
      margin-bottom: 10px;
    }
    .cancel {
      background-color: #f0f0f0;
      color: #333;
      border: none;
      width: 100%;
      padding: 10px;
      font-size: 14px;
      cursor: pointer;
      border-radius: 6px;
    }
    .status-link {
      text-align: center;
      margin-top: 10px;
    }
    .status-link a {
      color: #00796b;
      text-decoration: none;
    }
  </style>
</head>
<% 
  if (loginUser == null || loginUser.getPhone() == null) {
%>
  <script>alert("로그인이 필요하거나 전화번호가 등록되어 있지 않습니다."); history.back();</script>
<%
    return;
  }
%>

<body>
  <div class="withdrawal-container">
    <h2>코인 출금</h2>

    <%
      int currentBalance = request.getAttribute("exchange") != null ?
          ((com.qly.dto.ExchangeDto) request.getAttribute("exchange")).getCurrentBalance() : 0;
    %>

    <div class="section">
      <label>잔액</label>
      <div class="balance">
        <strong id="coin-balance"><%= String.format("%,d", currentBalance) %> 코인</strong>
        <span id="won-balance">(<%= String.format("%,d", currentBalance * 10) %>원)</span>
      </div>
    </div>

    <div class="section">
      <label for="withdraw-amount">출금 금액</label>
      <div class="amount-input-group">
        <input type="number" id="withdraw-amount" placeholder="출금할 코인 입력" />
        <button onclick="setMax()">MAX</button>
      </div>
      <div class="quick-buttons">
        <button onclick="addAmount(1000)">+1천</button>
        <button onclick="addAmount(5000)">+5천</button>
        <button onclick="addAmount(100000)">+10만</button>
      </div>
    </div>

  
	
<div class="section">
  <label for="refund-method">환급 방법</label>
  <select id="refund-method" style="width: 100%; padding: 8px; font-size: 16px;">
    <option value="">선택하세요</option>
    <option value="bank">계좌이체</option>
    <option value="mobile">휴대폰 결제</option>
  </select>
</div>

<!-- 계좌번호 + 은행명 입력 영역 -->
<div class="section" id="bank-info-section" style="display: none;">
  <div style="margin-bottom: 12px;">
   
  <div>
    <label for="bank-name">은행명</label>
    <input type="text" id="bank-name" placeholder="은행명을 입력해주세요"
           style="width: 100%; padding: 8px; font-size: 16px;" />
  </div>
  
   <label for="account-number">계좌번호 입력</label>
    <input type="text" id="account-number" placeholder="계좌번호를 입력해주세요"
           style="width: 100%; padding: 8px; font-size: 16px;" />
  </div>
</div>

  
    <div class="section">
      <label for="withdraw-password">출금 비밀번호</label>
     <input type="password" id="withdraw-password" placeholder="비밀번호를 입력해주세요" style="width: 100%; padding: 8px; font-size: 16px;" />
	</div>

    <div class="section checkbox">
      <label><input type="checkbox" id="confirm" /> 이체 정보를 확인 후 신청합니다</label>
      <small style="color: gray;">※ 정산은 영업일 기준으로 최대 3일 정도 소요됩니다.</small>
    </div>

   <!-- 출금 hidden form -->
<form id="withdraw-form" action="/exchange/withdraw.do" method="post">
  <input type="hidden" name="amount" id="form-amount" />
  <input type="hidden" name="password" id="form-password" />
  <input type="hidden" name="bankName" id="form-bank-name" />
  <input type="hidden" name="accountNumber" id="form-account-number" />
</form>




    <div class="actions">
      <button class="primary" onclick="submitWithdraw()">출금 신청</button>
     <button class="cancel" onclick="location.href='../mainpage.jsp'">취소</button>



    </div>

   <div class="status-link">
  <a href="../coinpage/coin_history.jsp">최근 출금 상태 보기 ></a>
</div>


  </div>

 <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
  const input = document.getElementById("withdraw-amount");
  const COIN_TO_WON = 10;
  const myCoin = <%= currentBalance %>;

  function addAmount(value) {
    const current = parseInt(input.value || 0);
    input.value = current + value;
    calculate();
  }

  function setMax() {
    input.value = myCoin;
    calculate();
  }

  function calculate() {
    const amount = parseInt(input.value || 0);
    if (amount > myCoin) {
      alert("잔액보다 많은 금액을 입력했습니다.");
      input.value = myCoin;
      return;
    }
  }

  function submitWithdraw() {
    const amount = parseInt(input.value || 0);
    const password = document.getElementById("withdraw-password").value;
    const refundMethod = document.getElementById("refund-method").value;

    if (!document.getElementById("confirm").checked) {
      alert("보안 확인에 체크해주세요.");
      return;
    }
    if (amount <= 0) {
      alert("출금 금액을 입력해주세요.");
      return;
    }
    if (password.trim().length === 0) {
      alert("비밀번호를 입력해주세요.");
      return;
    }

    if (refundMethod === "bank") {
      const accountNumber = document.getElementById("account-number").value.trim();
      const bankName = document.getElementById("bank-name").value.trim();

      if (!accountNumber || !bankName) {
        alert("계좌번호와 은행명을 입력해주세요.");
        return;
      }

      document.getElementById("form-bank-name").value = bankName;
      document.getElementById("form-account-number").value = accountNumber;

      document.getElementById("form-amount").value = amount;
      document.getElementById("form-password").value = password;
      document.getElementById("withdraw-form").submit();

    } else if (refundMethod === "mobile") {
    	  IMP.init("channel-key-17d098c7-8f98-42b5-b35a-58f760f435c6");
    	  IMP.request_pay({
    	    pg: "kakaopay",
    	    pay_method: "card",
    	    merchant_uid: "refund_" + new Date().getTime(),
    	    name: "코인 환급",
    	    amount: amount * COIN_TO_WON,
    	    buyer_tel: "<%= phone %>"
    	  }, function (rsp) {
    	    if (rsp.success) {
    	      alert("출금 요청이 처리중입니다...");

    	      // ✅ 서버에 출금 금액 먼저 세션에 저장
    	      fetch("/exchange/saveMobileAmount", {
    	        method: "POST",
    	        headers: {
    	          "Content-Type": "application/x-www-form-urlencoded"
    	        },
    	        body: "amount=" + amount
    	      })
    	      .then(() => {
    	        // 금액 저장 후 거래 완료 확인 요청
    	        return fetch("/exchange/mobileSuccess.do?imp_uid=" + rsp.imp_uid + "&merchant_uid=" + rsp.merchant_uid);
    	      })
    	      .then(response => response.json())
    	      .then(data => {
    	        if (data.success) {
    	          alert(data.message); // 🎉 거래 완료 메시지
    	          location.href = "/exchange/history.jsp?latest=true";
    	        } else {
    	          alert("❗ " + data.message); // 실패 메시지
    	        }
    	      })
    	      .catch(error => {
    	        alert("⚠️ 오류가 발생했습니다: " + error);
    	      });

    	    } else {
    	      alert("결제가 취소되었습니다.");
    	    }
    	  });
    	}

  }

  input.addEventListener("input", calculate);
  document.getElementById("refund-method").addEventListener("change", function () {
    const selected = this.value;
    const bankInfoSection = document.getElementById("bank-info-section");
    bankInfoSection.style.display = selected === "bank" ? "block" : "none";
  });
</script>


</body>
</html>
