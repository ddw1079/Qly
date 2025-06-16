package com.qly.vo;

public class PaymentHistoryVo {
    private int paymentId; // 결제 ID
    private int userId; // 사용자 ID
    private String paymentDate; // 결제 날짜
    private double amount; // 결제 금액
    private String paymentMethod; // 결제 방법 (예: 카드, 계좌이체 등)
    private String status; // 결제 상태 (예: 완료, 취소 등)

    // 생성자
    public PaymentHistoryVo(int paymentId, int userId, String paymentDate, double amount, String paymentMethod, String status) {
        this.paymentId = paymentId;
        this.userId = userId;
        this.paymentDate = paymentDate;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.status = status;
    }

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

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
