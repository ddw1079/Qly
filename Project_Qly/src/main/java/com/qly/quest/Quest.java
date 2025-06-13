package com.qly.quest;

public class Quest {
	private String title;
	private String category;
	private String status;
	private String regDate;
	private int applicantCount;
	private String imageUrl;

	// 기본 생성자
	public Quest() {
	}

	// 모든 필드를 받는 생성자
	public Quest(String title, String category, String status, String regDate, int applicantCount, String imageUrl) {
		this.title = title;
		this.category = category;
		this.status = status;
		this.regDate = regDate;
		this.applicantCount = applicantCount;
		this.imageUrl = imageUrl;
	}

	// getter, setter
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getApplicantCount() {
		return applicantCount;
	}

	public void setApplicantCount(int applicantCount) {
		this.applicantCount = applicantCount;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
