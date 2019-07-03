package com.cbt.company;

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
	
	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public String companyMain() {
		return "company/companyMain";
	}
	
	@RequestMapping(value = "companySignUp.do", method = RequestMethod.GET)
	public String companySignUpForm() {
		return "company/companySignUp";
	}
	
	@RequestMapping(value = "companySignUp.do", method = RequestMethod.POST)
	public String companySignUp(CompanyVO vo) {
		companyService.insertCompany(vo);
		return "redirect:companyLogin.do";
	}
	
	@RequestMapping(value = "companyUpdate.do", method = RequestMethod.GET)
	public String companyUpdateForm() {
		return "company/companyUpdate";
	}
	
	@RequestMapping(value = "companyUpdate.do", method = RequestMethod.POST)
	public String companyUpdate(CompanyVO vo) {
		companyService.updateCompany(vo);
		return "company/companyMain";
	}
	
	@RequestMapping(value = "companyLogin.do",  method = RequestMethod.GET)
	public String companyLoginForm() {		
		return "company/companyLogin";
	}
	
	@RequestMapping(value = "companyLogin.do",  method = RequestMethod.POST)
	public String companyLogin(CompanyVO vo, Model model) {
		String 		targetPage 		= "company/companyLogin";
		CompanyVO 	loginCompany 	= companyService.loginCompany(vo);
		
		if(loginCompany != null) {
			targetPage = "company/companyMain";
		}
		
		return targetPage;
	}
	
	@RequestMapping(value = "companyAccount.do",  method = RequestMethod.GET)
	public String companyAccount() {		
		return "company/companyAccount";
	}
}
