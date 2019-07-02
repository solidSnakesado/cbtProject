package com.cbt.survey;

public class SurveyVO {

	private String surveyId;
	private String surveyType;
	private int takeExamId;
	
	public String getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(String surveyId) {
		this.surveyId = surveyId;
	}
	public String getSurveyType() {
		return surveyType;
	}
	public void setSurveyType(String surveyType) {
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
