package com.cbt.candidate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//2019.07.01 장세준 - candidatecontroller -> candidate3controller
@Controller
public class Candidate3Controller {
	
	
	@RequestMapping("candidateMain.do")
	public String candidateMain() {
		return "candidate/candidateMain";
	}

	@RequestMapping("candidateInSignUp.do")
	public String candidateInSignUp() {
		return "candidate/candidateInSignUp";
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
