package com.qly.dto;

public class ExchangeDto {

    private int userId;             // 사용자 ID
    private int currentBalance;     // 현재 코인 잔액
    private int totalCharged;       // 총 충전 금액
    private int totalWithdrawn;     // 총 출금 금액

    // 기본 생성자
    public ExchangeDto() {}

    // 전체 생성자
    public ExchangeDto(int userId, int currentBalance, int totalCharged, int totalWithdrawn) {
        this.userId = userId;
        this.currentBalance = currentBalance;
        this.totalCharged = totalCharged;
        this.totalWithdrawn = totalWithdrawn;
    }

    // Getter / Setter
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(int currentBalance) {
        this.currentBalance = currentBalance;
    }

    public int getTotalCharged() {
        return totalCharged;
    }

    public void setTotalCharged(int totalCharged) {
        this.totalCharged = totalCharged;
    }

    public int getTotalWithdrawn() {
        return totalWithdrawn;
    }

    public void setTotalWithdrawn(int totalWithdrawn) {
        this.totalWithdrawn = totalWithdrawn;
    }
}
//Service → Mapper	출금 시 DTO 객체를 넘겨줌 
//Mapper #{userId}, #{currentBalance} 등으로 필드 접근
//JSP	model.addAttribute("payment", paymentDto); 형태로 전달 가능
