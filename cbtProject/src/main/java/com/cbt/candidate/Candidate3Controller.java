package com.cbt.candidate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//2019.07.01 장세준 - candidatecontroller -> candidate3controller
@Controller
public class Candidate3Controller {
	
	@Autowired
	CandidateService candidateService;
	
	@RequestMapping("candidateMain.do")
	public String candidateMain() {
		return "candidate/candidateMain";
	}
	//등록form 2019.07.01 생성
	@RequestMapping(value="candidateInSignUp.do", method=RequestMethod.GET)
	public String candidateInSignUpForm() {
		return "candidate/candidateInSignUp";
	}
	//등록처리  2019.07.01 생성
	@RequestMapping(value="candidateInSignUp.do", method=RequestMethod.POST)
	public String candidateAccount(CandidateVO vo) {
		candidateService.insertCandidate(vo);
		return "redirect:candidateMain.do";
	}
	//로그인  2019.07.02 생성
	@RequestMapping(value="candidateLogin.do", method=RequestMethod.GET)
	public String candidateLoginForm() {
		return "candidate/candidateLogin";
	}
	//로그인  2019.07.02 생성
	@RequestMapping(value="candidateLogin.do", method=RequestMethod.POST)
	public String candidateLogin(CandidateVO vo) {
		String targetPage = "candidate/candidateLogin";
		
		CandidateVO loginCandidate = candidateService.loginCandidate(vo);
		if(loginCandidate != null) {
			targetPage = "candidate/candidateMain";
		}
		
		return targetPage;
	}
	@RequestMapping("candidateSignUp.do")
	public String candidateSignUp() {
		return "candidate/candidateSignUp";
	}

}
