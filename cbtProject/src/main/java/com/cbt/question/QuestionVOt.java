package com.cbt.question;


public class QuestionVOt {

	private int takeExamId;
	private String examName;
	private String takerName;
	private String examId;
	private String point;
	private String passingScore;
	private String count;
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public int getTakeExamId() {
		return takeExamId;
	}
	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
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
		return "QuestionVOt [takeExamId=" + takeExamId + ", examName=" + examName + ", takerName=" + takerName
				+ ", examId=" + examId + ", point=" + point + ", passingScore=" + passingScore + "]";
	}
	
	
	
}
