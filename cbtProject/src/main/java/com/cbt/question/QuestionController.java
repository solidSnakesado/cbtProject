package com.cbt.question;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.candidate.CandidateVO;


// 7/2 문제 컨트롤러 생성   -재용

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	
	
	@RequestMapping(value = "candidateTakeExam.do", method = RequestMethod.POST)	
	public ModelAndView candidateTakeExamList(QuestionVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		vo.setTakerId(candiVO.getTakerId());
		
		mv.addObject("takeExamList",questionService.candidateTakeExamList(vo));
		mv.setViewName("candidate/candidate/candidateTakeExam");
		
		System.out.println("1"+mv);
		
		return mv;
	}
	
	
	@RequestMapping("/getTestStart.do")
	@ResponseBody
	public List<Map<Object, String>> getTestStart() {
		QuestionVO vo = new QuestionVO();
		vo.setExamId(1);
		vo.setTakeExamId(1);
		vo.setTakerId("sime00");
		
		int setCount = questionService.getSetCount(vo);
		int takeCount = questionService.getTakeCount(vo);
		
		int count = setCount*takeCount;
		int history = questionService.getHistoryCount(vo);
		System.out.println(count + history);
		if(count > history) {
			questionService.insertTakeExamHistory(vo);
		}
		List<Map<Object, String>> list = questionService.getTestStart(vo);
		
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping("candidateRightAnswer.do")
	public ModelAndView candidateRightAnswerList() {
		QuestionVO vo = new QuestionVO();
		vo.setExamId(1);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("rightAnswer",questionService.candidateRightAnswerList(vo));
		mv.setViewName("candidate/candidate/candidateRightAnswer");
		
		return mv;
	}
	
	@RequestMapping("getTestResultList.do")
	public ModelAndView getTestResultList() {
		QuestionVO vo = new QuestionVO();
		vo.setTakeExamId(1);
		vo.setExamId(1);
		vo = questionService.getTestResultList(vo);
		int setCount = questionService.getSetCount(vo);
		
		questionService.rightAnswer(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("getExamId", vo.getExamId());
		mv.addObject("getExamName", vo.getExamName());
		mv.addObject("getPassingScore", vo.getPassingScore());
		mv.addObject("getPoint", vo.getSumPoint());
		mv.addObject("getTakeExamId", vo.getTakeExamId());
		mv.addObject("getTakerName", vo.getTakerName());
		mv.addObject("getCount", vo.getCount());
		mv.addObject("getExamCount", setCount);
		mv.setViewName("candidate/candidate/candidateTestResult");
		
		return mv;
	}
	
	@RequestMapping(value = "/updateTakeExamHistory.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateTakeExamHistory(QuestionVO vo) {
		vo.setTakeExamId(1);
		vo.setTakerId("sime00");
		
		
		System.out.println("ok");
		
		questionService.updateTakeExamHistory(vo);
		
	}
	
	@RequestMapping("candidateTestResult.do")
	public String candidateTestResult(QuestionVO vo, HttpSession session) {
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		System.out.println(candiVO.toString());
		vo.setTakerId(candiVO.getTakerId());
		System.out.println(candiVO.toString());
		return "candidate/candidate/candidateTestResult";
	}
	
	@RequestMapping("candidateExaminationList.do")
	public ModelAndView candidateExaminationList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CandidateVO candivo = (CandidateVO)session.getAttribute("candidate");
		QuestionVO vo = new QuestionVO();
		vo.setTakerId(candivo.getTakerId());
		mv.addObject("candidateExaminationList", questionService.candidateExaminationList(vo));
		
		mv.setViewName("candidate/candidate/candidateExaminationList");
		return mv;
	}
	
	
	@RequestMapping(value = "candidateExaminationListDetail.do", method = RequestMethod.POST)	
	public ModelAndView candidateExaminationListDetail(QuestionVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		vo.setTakerId(candiVO.getTakerId());
		
		mv.addObject("candidateExaminationListDetail", questionService.candidateExaminationListDetail(vo));
		mv.setViewName("candidate/candidate/candidateExaminationListDetail");
		return mv;
	}
	
}
