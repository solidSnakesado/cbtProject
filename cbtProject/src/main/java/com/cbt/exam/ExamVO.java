package com.cbt.exam;

import java.sql.Timestamp;

public class ExamVO {

	private String examId;
	private Timestamp examStartTime;
	private Timestamp examEndTime;
	private int questionQuantity;
	private String estimateId;
	private int numberOfTimes;
	private int passingScore;
	private int possibleApplicants;
	private String examName;
	private int examStatus;
	private int disclosureStatus;
	private int setExamStatus;
	
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
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
	public String getEstimateId() {
		return estimateId;
	}
	public void setEstimateId(String estimateId) {
		this.estimateId = estimateId;
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
	
	@Override
	public String toString() {
		return "ExamVO [examId=" + examId + ", examStartTime=" + examStartTime + ", examEndTime=" + examEndTime
				+ ", questionQuantity=" + questionQuantity + ", estimateId=" + estimateId + ", numberOfTimes="
				+ numberOfTimes + ", passingScore=" + passingScore + ", possibleApplicants=" + possibleApplicants
				+ ", examName=" + examName + ", examStatus=" + examStatus + ", disclosureStatus=" + disclosureStatus
				+ ", setExamStatus=" + setExamStatus + "]";
	}
	
	
	
}
