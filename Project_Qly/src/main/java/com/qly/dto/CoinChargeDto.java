package com.qly.dto;

public class CoinChargeDto {
    
	private int userId;
    private int coinAmount;         // 충전할 코인 수량    
    private String remain;			// 남은 코인 수
    private String reason;          // 예: "kakao_success"
    private int questId;			// 퀘스트 id
    
    public int getCoinAmount() {
        return coinAmount;
    }

    public void setCoinAmount(int coinAmount) {
        this.coinAmount = coinAmount;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getRemain() {
		return remain;
	}

	public void setRemain(String remain) {
		this.remain = remain;
	}

	public int getQuestId() {
		return questId;
	}

	public void setQuestId(int questId) {
		this.questId = questId;
	}
}
