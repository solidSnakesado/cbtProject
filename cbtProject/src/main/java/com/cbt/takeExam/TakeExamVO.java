package com.cbt.takeExam;

import java.sql.Date;

public class TakeExamVO {
	
	private int takeExamId;
	private Date takeExamDate;
	private String score;
	private String examId;
	private String takerId;
	
	public int getTakeExamId() {
		return takeExamId;
	}
	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
	}
	public Date getTakeExamDate() {
		return takeExamDate;
	}
	public void setTakeExamDate(Date takeExamDate) {
		this.takeExamDate = takeExamDate;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getTakerId() {
		return takerId;
	}
	public void setTakerId(String takerId) {
		this.takerId = takerId;
	}
	
	@Override
	public String toString() {
		return "TakeExamVO [takeExamId=" + takeExamId + ", takeExamDate=" + takeExamDate + ", score=" + score
				+ ", examId=" + examId + ", takerId=" + takerId + "]";
	}

}
