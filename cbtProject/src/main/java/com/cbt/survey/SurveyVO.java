package com.cbt.survey;

public class SurveyVO {

	private int surveyId;
	private int surveyType;
	private int takeExamId;
	
	public int getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
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
