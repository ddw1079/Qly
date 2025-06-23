package com.qly.dto;

import java.util.Date;

public class InquiryDto {
	private String questionId;     // QUESTION_ID
    private String title;            // TITLE
    private String content;          // 사용자 입력 문의 내용
    private int userId;           // USER_ID
    private Date createdDate;        // CREATED_DATE
    private String answerStatus;     // ANSWER_STATUS
    private String answerContent;    // ANSWER_CONTENT (초기에는 content와 동일하게 저장)
    private String type;
    private String questionContent;
    
  

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public InquiryDto() {}



	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

   
}
