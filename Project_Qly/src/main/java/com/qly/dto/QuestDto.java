package com.qly.dto;

public class QuestDto {
    private String title;
    private int rewardTokens;
    private String location;
    private String creatorNickname;
    private String creatorId;
    // Getter / Setter
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public int getRewardTokens() { return rewardTokens; }
    public void setRewardTokens(int rewardTokens) { this.rewardTokens = rewardTokens; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getCreatorId() { return creatorId; }
    public void setCreatorId(String creatorId) { this.creatorId = creatorId; }
}
