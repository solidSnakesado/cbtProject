package com.cbt.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
		return "company/companySignUp";
	}
	
	@RequestMapping(value = "companyLogin.do",  method = RequestMethod.GET)
	public String companyLoginForm() {		
		return "company/companyLogin";		
	}
	
	@RequestMapping(value = "companyLogin.do",  method = RequestMethod.POST)
	public String companyLogin(CompanyVO vo) {
		String 		targetPage 		= "company/companyLogin";
		CompanyVO 	loginCompany 	= companyService.loginCompany(vo);
		
		if(loginCompany != null) {
			targetPage = "company/companyMain";
		}
		
		return targetPage;
	}
	
	/*
	 * @RequestMapping(value = "companyConsulting.do", method = RequestMethod.GET)
	 * public String companyConsultingForm() { return "company/companyConsulting"; }
	 * 
	 * @RequestMapping(value = "companyConsulting.do", method = RequestMethod.POST)
	 * public String companyConsulting() { return "company/companyMain"; }
	 */
}
