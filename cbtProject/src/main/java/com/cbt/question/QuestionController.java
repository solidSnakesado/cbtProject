package com.cbt.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 7/2 문제 컨트롤러 생성   -재용

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	
	
	@RequestMapping(value = "candidateTestResult.do", method = RequestMethod.POST)
	public String candidateTestResultForm() {
		return "redirect:getTestList.do";
	}
	
	@RequestMapping("/getTestList.do")
	public void getTestList() {
		questionService.getTestList();
	}
	
	

}
