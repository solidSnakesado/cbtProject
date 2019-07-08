package com.cbt.question;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		vo.setExamId("E001");
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("takeExamList",questionService.candidateTakeExamList(vo));
		mv.setViewName("candidate/candidateTakeExam");
		
		System.out.println(mv);
		
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
		vo.setExamId("E001");
		List<Map<Object, String>> list = questionService.getTestStart(vo);
		
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping("candidateRightAnswer.do")
	public ModelAndView candidateRightAnswerList() {
		QuestionVO vo = new QuestionVO();
		vo.setExamId("E001");
		
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
