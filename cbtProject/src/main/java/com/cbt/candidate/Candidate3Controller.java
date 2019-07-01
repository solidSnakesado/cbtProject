package com.cbt.candidate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//2019.07.01 장세준 - candidatecontroller -> candidate3controller
@Controller
public class Candidate3Controller {
	
	@Autowired
	CandidateService candidate;
	
	@RequestMapping("candidateMain.do")
	public String candidateMain() {
		return "candidate/candidateMain";
	}
	//등록form
	@RequestMapping(value="candidateInSignUp.do", method=RequestMethod.GET)
	public String candidateInSignUpForm() {
		return "candidate/candidateInSignUp";
	}
	//등록처리
	@RequestMapping(value="candidateInSignUp.do", method=RequestMethod.POST)
	public String candidateAccount(CandidateVO vo) {
		candidate.insertCandidate(vo);
		return "redirect:candidateMain.do";
	}
	@RequestMapping("candidateLogin.do")
	public String candidateLogin() {
		return "candidate/candidateLogin";
	}

	@RequestMapping("candidateSignUp.do")
	public String candidateSignUp() {
		return "candidate/candidateSignUp";
	}

}
