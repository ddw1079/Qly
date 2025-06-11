package com.qly.dto;

public class QuestDto {
    private String title;
    private int rewardTokens;
    private String location;
    private String creatorNickname;

    // Getter / Setter
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public int getRewardTokens() { return rewardTokens; }
    public void setRewardTokens(int rewardTokens) { this.rewardTokens = rewardTokens; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getCreatorNickname() { return creatorNickname; }
    public void setCreatorNickname(String creatorNickname) { this.creatorNickname = creatorNickname; }
}
