package com.cbt.question;


public class QuestionVOt {

	private int takeExamId;
	private String questionId;
	private String examName;
	private String takerName;
	private String examId;
	private String point;
	private String passingScore;
	
	public int getTakeExamId() {
		return takeExamId;
	}
	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getTakerName() {
		return takerName;
	}
	public void setTakerName(String takerName) {
		this.takerName = takerName;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getPassingScore() {
		return passingScore;
	}
	public void setPassingScore(String passingScore) {
		this.passingScore = passingScore;
	}
	@Override
	public String toString() {
		return "QuestionVOt [takeExamId=" + takeExamId + ", questionId=" + questionId + ", examName=" + examName
				+ ", takerName=" + takerName + ", examId=" + examId + ", point=" + point + ", passingScore="
				+ passingScore + "]";
	}
	
	
}
