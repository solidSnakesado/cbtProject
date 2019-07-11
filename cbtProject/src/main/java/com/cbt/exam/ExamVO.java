package com.cbt.exam;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ExamVO {

	// 2019.07.08 성재민
	// examId, estimateId 타입 int 로 변경
	private int 		examId;
	@JsonFormat(pattern ="yyyy-MM-dd HH:mm")
	private Timestamp 	examStartTime;
	@JsonFormat(pattern ="yyyy-MM-dd HH:mm")
	private Timestamp 	examEndTime;
	private int 		questionQuantity;
	private int 		estimateId;
	private int 		numberOfTimes;
	private int 		passingScore;
	private int 		possibleApplicants;
	private String 		examName;
	private int 		examStatus;
	private int 		disclosureStatus;
	private int 		setExamStatus;
	private String 		examDescriptionSimple;
	private String 		examDescriptionDetail;

	
	public String getExamDescriptionSimple() {
		return examDescriptionSimple;
	}

	public void setExamDescriptionSimple(String examDescriptionSimple) {
		this.examDescriptionSimple = examDescriptionSimple;
	}

	public String getExamDescriptionDetail() {
		return examDescriptionDetail;
	}

	public void setExamDescriptionDetail(String examDescriptionDetail) {
		this.examDescriptionDetail = examDescriptionDetail;
	}
	
	public Timestamp getExamStartTime() {
		return examStartTime;
	}
	
	public void setExamStartTime(Timestamp examStartTime) {
		this.examStartTime = examStartTime;
	}
	
	public Timestamp getExamEndTime() {
		return examEndTime;
	}
	
	public void setExamEndTime(Timestamp examEndTime) {
		this.examEndTime = examEndTime;
	}
	
	public int getQuestionQuantity() {
		return questionQuantity;
	}
	
	public void setQuestionQuantity(int questionQuantity) {
		this.questionQuantity = questionQuantity;
	}
	
	public int getNumberOfTimes() {
		return numberOfTimes;
	}
	
	public void setNumberOfTimes(int numberOfTimes) {
		this.numberOfTimes = numberOfTimes;
	}
	
	public int getPassingScore() {
		return passingScore;
	}
	
	public void setPassingScore(int passingScore) {
		this.passingScore = passingScore;
	}
	
	public int getPossibleApplicants() {
		return possibleApplicants;
	}
	
	public void setPossibleApplicants(int possibleApplicants) {
		this.possibleApplicants = possibleApplicants;
	}
	
	public String getExamName() {
		return examName;
	}
	
	public void setExamName(String examName) {
		this.examName = examName;
	}
	
	public int getExamStatus() {
		return examStatus;
	}
	
	public void setExamStatus(int examStatus) {
		this.examStatus = examStatus;
	}
	
	public int getDisclosureStatus() {
		return disclosureStatus;
	}
	
	public void setDisclosureStatus(int disclosureStatus) {
		this.disclosureStatus = disclosureStatus;
	}
	
	public int getSetExamStatus() {
		return setExamStatus;
	}
	
	public void setSetExamStatus(int setExamStatus) {
		this.setExamStatus = setExamStatus;
	}
	
	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getEstimateId() {
		return estimateId;
	}

	public void setEstimateId(int estimateId) {
		this.estimateId = estimateId;
	}

	@Override
	public String toString() {
		return "ExamVO [examId=" + examId + ", examStartTime=" + examStartTime + ", examEndTime=" + examEndTime
				+ ", questionQuantity=" + questionQuantity + ", estimateId=" + estimateId + ", numberOfTimes="
				+ numberOfTimes + ", passingScore=" + passingScore + ", possibleApplicants=" + possibleApplicants
				+ ", examName=" + examName + ", examStatus=" + examStatus + ", disclosureStatus=" + disclosureStatus
				+ ", setExamStatus=" + setExamStatus + ", examDescriptionSimple=" + examDescriptionSimple
				+ ", examDescriptionDetail=" + examDescriptionDetail + "]";
	}

	
}
