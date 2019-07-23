package com.cbt.survey;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.candidate.CandidateVO;
import com.cbt.exam.ExamService;
import com.cbt.question.QuestionService;
import com.cbt.takeExam.TakeExamVO;


@Controller
public class SurveyController {
	@Autowired
	SurveyService surveyService;
	@Autowired
	ExamService examService;
	@Autowired
	QuestionService questionService;
	
	// 설문조사 insert form
	@RequestMapping(value = "candidateSurvey.do", method = RequestMethod.GET)
	public String candidateSurveyFrom() {
		return "candidate/candidate/candidateSurvey";
	}

	// 설문조사 insert 처리
	@RequestMapping(value = "candidateSurvey.do", method = RequestMethod.POST)
	public ModelAndView candidateSurvey(@RequestParam( value = "examId" , required = false ) int examId,SurveyVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		surveyService.insertSurvey(vo);
		
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		TakeExamVO takeExamvo = new TakeExamVO();
		takeExamvo.setTakerId(candiVO.getTakerId());
		takeExamvo.setExamId(examId);
		
		mv.addObject("rightAnswer",questionService.candidateRightAnswerList(takeExamvo));
		mv.setViewName("candidate/candidate/candidateRightAnswer");
		
		return mv;
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
	
	//temp 차트용 (7/22), june --> 추후 삭제예정
	@RequestMapping(value = "simpleExamList.do", method = RequestMethod.GET)
	public String simpleExamList(Model model) {
		model.addAttribute("simpleExamList",examService.getExamList());
		return "manager/manager/simpleChart";
	}
	
	//차트에서 사용하기 위한 생성(7/19), june
	@RequestMapping(value = "getSurveyResult.do/{id}", method = RequestMethod.POST)
	public List<Map<String, Object>> getSurveyList(@PathVariable("examId") int examId) {
		SurveyVO vo = new SurveyVO();
		vo.setExamId(examId);
		return surveyService.getSurveyList(vo);
	}
	
}
