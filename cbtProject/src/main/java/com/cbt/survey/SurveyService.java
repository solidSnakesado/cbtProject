package com.cbt.survey;

public interface SurveyService {

	void insertSurvey(SurveyVO vo);
	
	void updateSurvey(SurveyVO vo);
	
	void deleteSurvey(SurveyVO vo);
	
	SurveyVO getSurvey(SurveyVO vo);
	
}
