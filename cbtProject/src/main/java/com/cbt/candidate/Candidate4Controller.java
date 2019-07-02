package com.cbt.candidate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Candidate4Controller {
	
//	@RequestMapping("candidateSurvey.do")	
//	public String candidateSurvey() {
//		return "candidate/candidateSurvey";
//	}
	
	@RequestMapping("candidateTestResult.do")	
	public String candidateTestResult() {
		return "candidate/candidateTestResult";
	}
	
}
