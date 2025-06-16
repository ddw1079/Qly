package com.qly.dto;

import java.util.Date;
import java.util.List;

public class QuestDto {
	private int questId;
	private int userId;
	private String title;
	private String category;
	private String content; // 필요하면 유지
	private String photoPath;
	private Date startDate;
	private Date endDate;
	private String address;
	private int rewardTokens;
	private String status;
	private List<QuestTaskDto> tasks; // 여러 의뢰내용 담는 리스트

	public int getQuestId() {
		return questId;
	}

	public void setQuestId(int questId) {
		this.questId = questId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public List<QuestTaskDto> getTasks() {
		return tasks;
	}

	public void setTasks(List<QuestTaskDto> tasks) {
		this.tasks = tasks;
	}

}
