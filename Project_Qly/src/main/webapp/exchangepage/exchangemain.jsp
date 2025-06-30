<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>코인 출금</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f4f9f8;
      margin: 0;
      padding: 40px 20px;
    }

    .wide-card {
      max-width: 1000px;
      margin: 0 auto;
      background: #ffffff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      display: flex;
      gap: 40px;
      justify-content: space-between;
    }

    .wide-left, .wide-right {
      flex: 1;
    }

    .wide-left h2 {
      color: #00897b;
      margin-bottom: 30px;
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
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 6px 0 0 6px;
    }

    .amount-input-group button {
      padding: 10px 16px;
      border: 1px solid #ccc;
      background-color: #ddd;
      cursor: pointer;
      border-radius: 0 6px 6px 0;
    }

    .quick-buttons {
      display: flex;
      gap: 10px;
      margin-top: 10px;
    }

    .quick-buttons button {
      flex: 1;
      padding: 10px;
      background-color: #d9f1ee;
      border: none;
      cursor: pointer;
      border-radius: 6px;
    }

    select,
    input[type="password"],
    input[type="text"] {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }

    .checkbox {
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .primary, .cancel {
      width: 100%;
      padding: 12px;
      border-radius: 6px;
      font-size: 16px;
      margin-top: 10px;
    }

    .primary {
      background-color: #00bfa5;
      color: white;
      border: none;
    }

    .cancel {
      background-color: #f0f0f0;
      color: #333;
      border: none;
    }

    .status-link {
      text-align: right;
      margin-top: 12px;
    }

    .status-link a {
      color: #00796b;
      text-decoration: none;
    }
  </style>
</head>
<body>

<%
  int currentBalance = request.getAttribute("exchange") != null ?
      ((com.qly.dto.ExchangeDto) request.getAttribute("exchange")).getCurrentBalance() : 0;
%>

<div class="wide-card">
  <!-- 왼쪽 -->
  <div class="wide-left">
    <h2>코인 출금</h2>

    <div class="section">
      <label>잔액</label>
      <div class="balance">
        <strong id="coin-balance"><%= currentBalance %> 코인</strong>
        <span id="won-balance">(<%= currentBalance * 10 %>원)</span>
      </div>
    </div>

    <div class="section">
      <label for="withdraw-amount">출금 금액</label>
      <div class="amount-input-group">
        <input type="number" id="withdraw-amount" placeholder="출금할 코인 입력" />
        <button type="button" onclick="setMax()">MAX</button>
      </div>
    </div>

    <div class="quick-buttons">
      <button onclick="addAmount(1000)">+1천</button>
      <button onclick="addAmount(5000)">+5천</button>
      <button onclick="addAmount(100000)">+10만</button>
    </div>
  </div>

  <!-- 오른쪽 -->
  <div class="wide-right">
    <div class="section">
      <label for="refund-method">환급 방법</label>
      <select id="refund-method">
        <option value="">선택하세요</option>
        <option value="bank">계좌이체</option>
        <option value="mobile">휴대폰 결제</option>
      </select>
    </div>

    <div class="section" id="bank-info-section" style="display: none;">
      <label for="bank-name">은행명</label>
      <input type="text" id="bank-name" placeholder="은행명을 입력해주세요" />
      <label for="account-number" style="margin-top: 10px;">계좌번호</label>
      <input type="text" id="account-number" placeholder="계좌번호를 입력해주세요" />
    </div>

    <div class="section">
      <label for="withdraw-password">출금 비밀번호</label>
      <input type="password" id="withdraw-password" placeholder="비밀번호를 입력해주세요" />
    </div>

    <div class="section checkbox">
      <input type="checkbox" id="confirm" />
      <label for="confirm">이체 정보를 확인 후 신청합니다</label>
    </div>
    <small style="color: gray;">※ 정산은 영업일 기준으로 최대 3일 정도 소요됩니다.</small>

    <!-- form -->
    <form id="withdraw-form" action="/exchange/withdraw.do" method="post">
      <input type="hidden" name="amount" id="form-amount" />
      <input type="hidden" name="password" id="form-password" />
    </form>

    <button class="primary" onclick="submitWithdraw()">출금 신청</button>
    <button class="cancel" onclick="location.href='../mainpage.jsp'">취소</button>

    <div class="status-link">
      <a href="<c:url value='/payments/history.do' />">최근 출금 상태 보기 ></a>
    </div>
  </div>
</div>

<!-- JavaScript -->
<script>
  const input = document.getElementById("withdraw-amount");
  const myCoin = <%= currentBalance %>;

  function addAmount(value) {
    const current = parseInt(input.value || 0);
    input.value = current + value;
  }

  function setMax() {
    input.value = myCoin;
  }

  function submitWithdraw() {
    const amount = parseInt(input.value || 0);
    const password = document.getElementById("withdraw-password").value.trim();
    const refundMethod = document.getElementById("refund-method").value;

    if (!document.getElementById("confirm").checked) {
      alert("이체 정보를 확인해주세요.");
      return;
    }

    if (amount <= 0) {
      alert("출금 금액을 입력해주세요.");
      return;
    }

    if (!password) {
      alert("출금 비밀번호를 입력해주세요.");
      return;
    }

    if (refundMethod === "bank") {
      const account = document.getElementById("account-number").value.trim();
      const bank = document.getElementById("bank-name").value.trim();
      if (!account || !bank) {
        alert("은행명과 계좌번호를 입력해주세요.");
        return;
      }
    }

    document.getElementById("form-amount").value = amount;
    document.getElementById("form-password").value = password;
    document.getElementById("withdraw-form").submit();
  }

  document.getElementById("refund-method").addEventListener("change", function () {
    const selected = this.value;
    const bankInfoSection = document.getElementById("bank-info-section");
    bankInfoSection.style.display = selected === "bank" ? "block" : "none";
  });
</script>

</body>
</html>
