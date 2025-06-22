package com.qly.dto;

import java.util.Date;

public class AdminQuestDto {
    private int questId;
    private String title;
    private Date createdAt;           // ✅ 날짜 타입으로 수정
    private String location;
    private int rewardTokens;         // ✅ 숫자 타입으로 수정
    private String status;

    public int getQuestId() {
        return questId;
    }

    public void setQuestId(int questId) {
        this.questId = questId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getRewardTokens() {
        return rewardTokens;
    }

    public void setRewardTokens(int rewardTokens) {
        this.rewardTokens = rewardTokens;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
