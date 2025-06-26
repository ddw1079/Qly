package com.qly.vo;

import java.util.Date;

public class PaymentHistoryVo {
    private int paymentId; // 결제 ID
    private int userId; // 사용자 ID
    private Date paymentDate; // 결제 날짜
    private double amount; // 결제 금액
    private String type; // 결제 방법 (예: 카드, 계좌이체 등)
    private String status; // 결제 상태 (예: 완료, 취소 등)
    private String remainCoin; // 잔여 코인 (선택적 필드)

    // Getter 및 Setter 메소드
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemainCoin() {
        return remainCoin;
    }

    public void setRemainCoin(String remainCoin) {
        this.remainCoin = remainCoin;
    }

}
