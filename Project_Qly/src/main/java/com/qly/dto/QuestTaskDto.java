package com.qly.dto;

public class QuestTaskDto {
	private int taskId; // PK
	private int questId; // FK
	private String description;
	private char isChecked; // 기본값 '0'

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getQuestId() {
		return questId;
	}

	public void setQuestId(int questId) {
		this.questId = questId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public char getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(char isChecked) {
		this.isChecked = isChecked;
	}

}