package com.cbt.question;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


// 7/2 문제 컨트롤러 생성   -재용

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	
	@RequestMapping("candidateTakeExam.do")	
	public ModelAndView candidateTakeExamList() {
		QuestionVO vo = new QuestionVO();
		vo.setExamId(1);
		vo.setTakeExamId(3);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("takeExamList",questionService.candidateTakeExamList(vo));
		mv.setViewName("candidate/candidateTakeExam");
		
		System.out.println("1"+mv);
		
		return mv;
	}
	
//	@RequestMapping("candidateTakeExam.do")	
//	public String candidateTakeExam() {
//		
//		return "candidate/candidateTakeExam";
//	}
	
	@RequestMapping("/getTestStart.do")
	@ResponseBody
	public List<Map<Object, String>> getTestStart() {
		QuestionVO vo = new QuestionVO();
		vo.setExamId(1);
		vo.setTakeExamId(3);
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
		mv.setViewName("candidate/candidateRightAnswer");
		
		return mv;
	}
	
	@RequestMapping("getTestResultList.do")
	public ModelAndView getTestResultList() {
		QuestionVOt vo = new QuestionVOt();
		vo.setTakeExamId("1");
		vo = questionService.getTestResultList(vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("getExamId", vo.getExamId());
		mv.addObject("getExamName", vo.getExamName());
		mv.addObject("getPassingScore", vo.getPassingScore());
		mv.addObject("getPoint", vo.getPoint());
		mv.addObject("getTakeExamId", vo.getTakeExamId());
		mv.addObject("getTakerName", vo.getTakerName());
		mv.addObject("getCount", vo.getCount());
		mv.setViewName("candidate/candidateTestResult");
		
		return mv;
	}
	
	@RequestMapping(value = "/updateTakeExamHistory.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateTakeExamHistory(	@RequestParam(value="examValue")String examValue,
										@RequestParam(value="setExamQuestionId")String setExamQuestionId) {
		QuestionVO vo = new QuestionVO();
		vo.setTakeExamId(3);
		vo.setTakerId("sime00");
		vo.setTakerAnswer(examValue);
		vo.setSetExamQuestionId(setExamQuestionId);
		
		System.out.println(examValue);
		
		System.out.println("ok");
		
		questionService.updateTakeExamHistory(vo);
		
	}

//	@RequestMapping(value = "candidateTestResult.do", method = RequestMethod.GET)
//	public String candidateTestResult() {
//		return "candidate/candidateTestResult";
//	}
	
//	@RequestMapping(value = "candidateTestResult.do", method = RequestMethod.POST)
//	public String candidateTestResultForm() {
//		return "redirect:candidateTestResult.do";
//	}
	
//	@RequestMapping("/candidateTestResult.do")
//	public ModelAndView getTestList() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("takeExamId", 1);
//		System.out.println("1"+map.get("result"));
//		
//		
//		questionService.getTestList(map);
//		ModelAndView mv = new ModelAndView();
//		
//		System.out.println(map);
//		
//		map.get("result");
//		
//		mv.addObject("takerName", map.get("result"));
//		mv.setViewName("candidate/candidateTestResult");
//		
//		return mv;
//	}
}
