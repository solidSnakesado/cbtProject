package com.cbt.company;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 2019.06.27 성재민
// 컴퍼니 메인 컨트롤러 연결
@Controller
public class CompanyController {
	@Autowired
	CompanyService companyService;
	
	@RequestMapping(value = "companyMain.do", method = RequestMethod.GET)
	public String companyMain() {
		return "company/company/companyMain";
	}
	
	@RequestMapping(value = "companySignUp.do", method = RequestMethod.GET)
	public String companySignUpForm() {
		return "company/company/companySignUp";
	}
	
	@RequestMapping(value = "companySignUp.do", method = RequestMethod.POST)
	public String companySignUp(CompanyVO vo) {
		companyService.insertCompany(vo);
		return "redirect:companyLogin.do";
	}
	
	@RequestMapping(value = "companyUpdate.do", method = RequestMethod.GET)
	public String companyUpdateForm() {
		return "company/company/companyUpdate";
	}
	
	@RequestMapping(value = "companyUpdate.do", method = RequestMethod.POST)
	public String companyUpdate(CompanyVO vo) {
		companyService.updateCompany(vo);
		return "company/company/companyMain";
	}
	
	@RequestMapping(value = "companyLogin.do",  method = RequestMethod.GET)
	public String companyLoginForm() {		
		return "company/company/companyLogin";
	}
	
	@RequestMapping(value = "companyLogin.do",  method = RequestMethod.POST)
	public String companyLogin(CompanyVO vo, HttpSession session, Model model) {
		String 		targetPage 		= "company/company/companyLogin";
		CompanyVO 	loginCompany 	= companyService.loginCompany(vo);
		
		if(loginCompany != null) {
			session.setAttribute("company", loginCompany);
			targetPage = "redirect:companyMain.do";
		} else {
			// 2019.07.10 성재민
			// 로그인 실패시 로그인 실패 메시지를 띄우기 위해 값 설정
			model.addAttribute("loginFail", true);
		}
		
		return targetPage;
	}
	
	//로그아웃 폼
	@RequestMapping(value="companyLogout.do", method=RequestMethod.GET)
	public String companyLogout(HttpSession session) {
		session.invalidate();
		return "redirect:companyMain.do";
	}
	
	@RequestMapping(value = "companyAccount.do",  method = RequestMethod.GET)
	public String companyAccount() {		
		return "company/company/companyAccount";
	}
	
	@RequestMapping(value = "companyDelete.do",  method = RequestMethod.GET)
	public String companyDelete(HttpSession session) {
		CompanyVO vo = (CompanyVO) session.getAttribute("company");
		
		companyService.deleteCompany(vo);
		session.invalidate();
		
		return "redirect:companyLogin.do";
	}
	

	// 관리자 컴퍼니 정보 수정처리
	@RequestMapping("updateManagerAccount.do")
	public String updateManagerAccount(@ModelAttribute("company") CompanyVO vo) {
		companyService.updateCompany(vo);
		return "redirect:managerAccountList.do";
	}
	
	@RequestMapping(value="companyIntroduce.do", method=RequestMethod.GET)
	public String companyIntroduce() {
		return "company/company/companyIntroduce";
	}
	
	@RequestMapping(value="companySystemintro.do", method=RequestMethod.GET)
	public String companySystemintro() {
		return "company/company/companySystemintro";
	}

	@RequestMapping(value="companyChart.do", method=RequestMethod.GET)
	public String companyChart() {
		return "company/company/companyChart";
	}
}
