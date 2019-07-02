package com.cbt.exam;

public class ExamVO {

	private String examId;
	private String examStartTime;
	private String examEndTime;
	private String questionQuantity;
	private String estimateId;
	private int numberOfTimes;
	private String passingScore;
	private String possibleApplicants;
	private String examName;
	private String examStatus;
	
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getExamStartTime() {
		return examStartTime;
	}
	public void setExamStartTime(String examStartTime) {
		this.examStartTime = examStartTime;
	}
	public String getExamEndTime() {
		return examEndTime;
	}
	public void setExamEndTime(String examEndTime) {
		this.examEndTime = examEndTime;
	}
	public String getQuestionQuantity() {
		return questionQuantity;
	}
	public void setQuestionQuantity(String questionQuantity) {
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
	public String getPassingScore() {
		return passingScore;
	}
	public void setPassingScore(String passingScore) {
		this.passingScore = passingScore;
	}
	public String getPossibleApplicants() {
		return possibleApplicants;
	}
	public void setPossibleApplicants(String possibleApplicants) {
		this.possibleApplicants = possibleApplicants;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getExamStatus() {
		return examStatus;
	}
	public void setExamStatus(String examStatus) {
		this.examStatus = examStatus;
	}
	
	@Override
	public String toString() {
		return "ExamVO [examId=" + examId + ", examStartTime=" + examStartTime + ", examEndTime=" + examEndTime
				+ ", questionQuantity=" + questionQuantity + ", estimateId=" + estimateId + ", numberOfTimes="
				+ numberOfTimes + ", passingScore=" + passingScore + ", possibleApplicants=" + possibleApplicants
				+ ", examName=" + examName + ", examStatus=" + examStatus + "]";
	}
	
}
