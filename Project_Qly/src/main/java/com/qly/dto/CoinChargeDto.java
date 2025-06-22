package com.qly.dto;

public class CoinChargeDto {
    
    private int paidAmount;         // 실제 결제 금액
    private int coinAmount;         // 충전할 코인 수량
    private String paymentMethod;   // 예: "kakao", "credit_card"
    private String reason;          // 예: "kakao_success"

    public int getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(int paidAmount) {
        this.paidAmount = paidAmount;
    }

    public int getCoinAmount() {
        return coinAmount;
    }

    public void setCoinAmount(int coinAmount) {
        this.coinAmount = coinAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
