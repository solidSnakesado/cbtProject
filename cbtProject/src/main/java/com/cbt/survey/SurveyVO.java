package com.cbt.survey;

public class SurveyVO {

	private int surveyId;
	private int surveyType;
	private int takeExamId;
	
	// 설문조사 문제
	private int surveyQuestionNumber;
	private int contents;
	private int value;
	
	
	public int getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}

	public int getSurveyQuestionNumber() {
		return surveyQuestionNumber;
	}

	public void setSurveyQuestionNumber(int surveyQuestionNumber) {
		this.surveyQuestionNumber = surveyQuestionNumber;
	}

	public int getContents() {
		return contents;
	}

	public void setContents(int contents) {
		this.contents = contents;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public int getSurveyType() {
		return surveyType;
	}

	public void setSurveyType(int surveyType) {
		this.surveyType = surveyType;
	}

	public int getTakeExamId() {
		return takeExamId;
	}
	
	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
	}
	
	@Override
	public String toString() {
		return "SurveyVO [surveyId=" + surveyId + ", surveyType=" + surveyType + ", takeExamId=" + takeExamId + "]";
	}
}
