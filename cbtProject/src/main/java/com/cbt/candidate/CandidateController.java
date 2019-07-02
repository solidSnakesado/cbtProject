package com.cbt.candidate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//2019.07.01 장세준 - candidate3controller로 이전
@Controller
public class CandidateController {
	@Autowired
	CandidateService candidateService;
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateAccountManage.do")	
	public String candidateAccountManage() {
		return "candidate/candidateAccountManage";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateAccountManageModify.do")	
	public String candidateAccountManageModify() {
		return "candidate/candidateAccountManageModify";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateApplication.do")	
	public String candidateApplication() {
		return "candidate/candidateApplication";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateExaminationList.do")	
	public String candidateExaminationList() {
		return "candidate/candidateExaminationList";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateExaminationListDetail.do")	
	public String candidateExaminationListDetail() {
		return "candidate/candidateExaminationListDetail";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateRightAnswer.do")	
	public String candidateRightAnswer() {
		return "candidate/candidateRightAnswer";
	}

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
	
	@RequestMapping("candidateTestResult.do")	
	public String candidateTestResult() {
		return "candidate/candidateTestResult";
	}
	
	@RequestMapping("candidateTakeExam.do")	
	public String candidateTakeExam() {
		return "candidate/candidateTakeExam";
	}
}
