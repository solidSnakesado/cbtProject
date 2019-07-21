package com.cbt.survey;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SurveyController {
	@Autowired
	SurveyService surveyService;
	
	// 설문조사 insert form
	@RequestMapping(value = "insertSurvey.do", method = RequestMethod.GET)
	public String insertSurveyFrom() {
		return "candidate/candidate/candidateSurvey";
	}

	// 설문조사 insert 처리
	@RequestMapping(value = "insertSurvey.do", method = RequestMethod.POST)
	public String insertSurvey(SurveyVO vo) {
		surveyService.insertSurvey(vo);
		return "redirect:candidateMain.do";
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
	
	//차트에서 사용하기 위한 생성(7/19), june
	@RequestMapping(value = "getSurveyResult.do/{id}", method = RequestMethod.POST)
	public List<Map<String, Object>> getSurveyList(@PathVariable("examId") int examId) {
		SurveyVO vo = new SurveyVO();
		vo.setExamId(examId);
		return surveyService.getSurveyList(vo);
	}
	
}
