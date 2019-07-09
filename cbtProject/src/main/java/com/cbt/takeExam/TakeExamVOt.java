package com.cbt.takeExam;

import java.sql.Date;

public class TakeExamVOt {

	private String 	examName;
	private Date 	examStartTime;
	private Date 	examEndTime;
	private int 	questionQuantity;
	private int 	passingScore;
	private String 	takerId;
	
	
	
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public Date getExamStartTime() {
		return examStartTime;
	}
	public void setExamStartTime(Date examStartTime) {
		this.examStartTime = examStartTime;
	}
	public Date getExamEndTime() {
		return examEndTime;
	}
	public void setExamEndTime(Date examEndTime) {
		this.examEndTime = examEndTime;
	}
	public int getQuestionQuantity() {
		return questionQuantity;
	}
	public void setQuestionQuantity(int questionQuantity) {
		this.questionQuantity = questionQuantity;
	}
	public int getPassingScore() {
		return passingScore;
	}
	public void setPassingScore(int passingScore) {
		this.passingScore = passingScore;
	}
	public String getTakerId() {
		return takerId;
	}
	public void setTakerId(String takerId) {
		this.takerId = takerId;
	}


}
