package com.qly.dto;

public class CoinChargeDto {
	
	private int paid_amount;
	private int coinAmount;
	private String paymentMethod;
	private String reason;
	
	public int getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
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
