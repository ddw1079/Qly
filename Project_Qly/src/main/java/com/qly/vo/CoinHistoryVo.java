package com.qly.vo;

import java.util.Date;

public class CoinHistoryVo {
	private int userId;
	private Date transactionDate;
	private int amount;
	private int remainCoin;
	private String type;
	private int questId;

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQuestId() {
		return questId;
	}
	public void setQuestId(int questId) {
		this.questId = questId;
	}
	public int getRemainCoin() {
		return remainCoin;
	}
	public void setRemainCoin(int remainCoin) {
		this.remainCoin = remainCoin;
	}
	
}
