package com.cbt.candidate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//2019.07.01 장세준 - candidate3controller로 이전
@Controller
public class CandidateController {

	//2019.07.01 장세준 - candidate3controller로 이전
	/*
	 * @RequestMapping("candidateMain.do") public String candidateMain() { return
	 * "candidate/candidateMain"; }
	 */
	
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
	@RequestMapping("candidateInHeader.do")	
	public String candidateInHeader() {
		return "candidate/candidateInHeader";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateInIntroduce.do")	
	public String candidateInIntroduce() {
		return "candidate/candidateInIntroduce";
	}

	//2019.07.01 장세준 - candidate3controller로 이전
	//2019.06.27 장세준 - *.do & view 등록
	/*
	 * @RequestMapping("candidateInSignUp.do") public String candidateInSignUp() {
	 * return "candidate/candidateInSignUp"; }
	 */
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidatePersonalChart.do")	
	public String candidatePersonalChart() {
		return "candidate/candidatePersonalChart";
	}
	//2019.07.01 장세준 - candidate3controller로 이전
	//2019.06.27 장세준 - *.do & view 등록
	/*
	 * @RequestMapping("candidateLogin.do") public String candidateLogin() { return
	 * "candidate/candidateLogin"; }
	 */
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateRightAnswer.do")	
	public String candidateRightAnswer() {
		return "candidate/candidateRightAnswer";
	}
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateScheduleCheck.do")	
	public String candidateScheduleCheck() {
		return "candidate/candidateScheduleCheck";
	}
	//2019.07.01 장세준 - candidate3controller로 이전
	//2019.06.27 장세준 - *.do & view 등록
	/*
	 * @RequestMapping("candidateSignUp.do") public String candidateSignUp() {
	 * return "candidate/candidateSignUp"; }
	 */
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateSurvey.do")	
	public String candidateSurvey() {
		return "candidate/candidateSurvey";
	}
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateTakeExam.do")	
	public String candidateTakeExam() {
		return "candidate/candidateTakeExam";   
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateTestResult.do")	
	public String candidateTestResult() {
		return "candidate/candidateTestResult";
	}	
}
