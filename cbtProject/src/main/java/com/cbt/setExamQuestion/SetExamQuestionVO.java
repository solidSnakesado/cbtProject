package com.cbt.setExamQuestion;

public class SetExamQuestionVO {
	
	private String 	examId;
	private String 	questionId;
	private String 	setExamQuestionId;
	private String 	point;

	public SetExamQuestionVO() {
	}
	
	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	public String getSetExamQuestionId() {
		return setExamQuestionId;
	}

	public void setSetExamQuestionId(String setExamQuestionId) {
		this.setExamQuestionId = setExamQuestionId;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "SetExamQuestionVO [examId=" + examId + ", questionId=" + questionId + ", setExamQuestionId="
				+ setExamQuestionId + ", point=" + point + "]";
	}
	
}
