package com.cbt.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SurveyController {
	@Autowired
	SurveyService surveyService;
	
	@RequestMapping(value = "insertSurvey.do", method = RequestMethod.GET)
	public String insertSurveyFrom() {
		return "";
	}
	
	@RequestMapping(value = "insertSurvey.do", method = RequestMethod.POST)
	public String insertSurvey(SurveyVO vo) {
		surveyService.insertSurvey(vo);
		return "";
	}
	
	@RequestMapping(value = "updateSurvey.do/{id}", method = RequestMethod.GET)
	public String updateSurveyFrom() {
		return "";
	}
	
	@RequestMapping(value = "updateSurvey.do/{id}", method = RequestMethod.POST)
	public String updateSurvey(SurveyVO vo) {
		surveyService.updateSurvey(vo);
		return "";
	}
	
	@RequestMapping(value = "deleteSurvey.do/{id}", method = RequestMethod.POST)
	public String deleteSurvey(SurveyVO vo) {
		surveyService.deleteSurvey(vo);
		return "";
	}
}
