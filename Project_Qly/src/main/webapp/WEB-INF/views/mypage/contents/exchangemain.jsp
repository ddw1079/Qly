<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qly.dto.UserDto, com.qly.dto.ExchangeDto" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>코인 출금</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #e9f7f5;
      margin: 0;
    }

    .coin-page-wrapper {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      gap: 48px;
      margin-top: 80px;
      padding: 0 20px;
    }

    .card-box {
      width: 500px;
      background: white;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      padding: 30px 20px;
    }

    h2, h3 {
      text-align: center;
      color: #00897b;
      margin-bottom: 20px;
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

    .notice-box ul {
      list-style-type: disc;
      padding-left: 18px;
      color: #333;
      font-size: 15px;
    }

    .notice-box li {
      margin-bottom: 10px;
      line-height: 1.5;
    }
  </style>
</head>
<body>

<%
  UserDto loginUser = (UserDto) session.getAttribute("loginUser");
  int currentBalance = request.getAttribute("exchange") != null
      ? ((ExchangeDto) request.getAttribute("exchange")).getCurrentBalance()
      : 0;
%>

<div class="coin-page-wrapper">

  <!-- 출금 카드 -->
  <div class="card-box">
    <h2>코인 출금</h2>

    <div class="section">
      <label>잔액</label>
      <div class="balance">
        <strong id="coin-balance"><%= loginUser.getTotalTokens() %></strong>
        <span id="won-balance">(<%= loginUser.getTotalTokens() * 10 %>원)</span>
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

    <!-- 계좌 정보 -->
    <div class="section" id="bank-info-section" style="display: none;">
      <div style="margin-bottom: 12px;">
        <label for="bank-name">은행명</label>
        <input type="text" id="bank-name" placeholder="은행명을 입력해주세요"
               style="width: 100%; padding: 8px; font-size: 16px;" />
      </div>
      <label for="account-number">계좌번호 입력</label>
      <input type="text" id="account-number" placeholder="계좌번호를 입력해주세요"
             style="width: 100%; padding: 8px; font-size: 16px;" />
    </div>

    <div class="section">
      <label for="withdraw-password">출금 비밀번호</label>
      <input type="password" id="withdraw-password" placeholder="비밀번호를 입력해주세요"
             style="width: 100%; padding: 8px; font-size: 16px;" />
    </div>

    <div class="section checkbox">
      <label><input type="checkbox" id="confirm" /> 이체 정보를 확인 후 신청합니다</label>
      <small style="color: gray;">※ 정산은 영업일 기준으로 최대 3일 정도 소요됩니다.</small>
    </div>

    <form id="withdraw-form" action="/exchange/withdraw.do" method="post">
      <input type="hidden" name="amount" id="form-amount" />
      <input type="hidden" name="password" id="form-password" />
    </form>

    <div class="actions">
      <button class="primary" onclick="submitWithdraw()">출금 신청</button>
      <button class="cancel" onclick="location.href='../mainpage.jsp'">취소</button>
    </div>

    <div class="status-link">
      <a href="../coinpage/coin_history.jsp">최근 출금 상태 보기 ></a>
    </div>
  </div>

  <!-- 유의사항 카드 -->
  <div class="card-box notice-box">
    <h3>출금 전 확인사항</h3>
    <ul>
      <li>출금은 최소 1,000코인 이상부터 가능합니다.</li>
      <li>출금 신청 후 평일 기준 최대 3일이 소요될 수 있습니다.</li>
      <li>부정확한 계좌 정보 입력 시 출금이 지연될 수 있습니다.</li>
      <li>비밀번호 5회 오류 시 보안 잠금이 설정됩니다.</li>
    </ul>
  </div>
</div>

<script>
  const input = document.getElementById("withdraw-amount");
  const myCoin = <%= loginUser.getTotalTokens() %>;

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
    }

    document.getElementById("form-amount").value = amount;
    document.getElementById("form-password").value = password;
    document.getElementById("withdraw-form").submit();
  }

  input.addEventListener("input", calculate);
  document.getElementById("refund-method").addEventListener("change", function () {
    const selected = this.value;
    const bankInfoSection = document.getElementById("bank-info-section");
    bankInfoSection.style.display = (selected === "bank") ? "block" : "none";
  });
</script>
</body>
</html>
