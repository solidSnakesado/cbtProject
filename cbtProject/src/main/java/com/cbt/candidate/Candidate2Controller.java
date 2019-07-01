package com.cbt.candidate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//2019.07.01 재홍- candidatecontroller -> candidate2controller
@Controller
public class Candidate2Controller {
	
	@RequestMapping("candidateRequestList.do")
	public String candidateRequest() {
		return "candidate/candidateRequestList";
	}

	@RequestMapping("candidateInHeader.do")
	public String candidateInHeader() {
		return "candidate/candidateInHeader";
	}

	@RequestMapping("candidateInIntroduce.do")
	public String candidateInIntroduce() {
		return "candidate/candidateInIntroduce";
	}
	
	@RequestMapping("candidatePersonalChart.do")	
	public String candidatePersonalChart() {
		return "candidate/candidatePersonalChart";
	}
	
	@RequestMapping("candidateScheduleCheck.do")	
	public String candidateScheduleCheck() {
		return "candidate/candidateScheduleCheck";
	}
	
	@RequestMapping("candidateSurvey.do")	
	public String candidateSurvey() {
		return "candidate/candidateSurvey";
	}
}
