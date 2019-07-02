package com.cbt.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 2019.06.27 성재민
// 컴퍼니 메인 컨트롤러 연결
@Controller
public class CompanyController {
	@Autowired
	CompanyService companyService;
	
	@RequestMapping("companyMain.do")
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
	
	@RequestMapping("companyLogin.do")
	public String companyLogin() {
		return "company/companyLogin";
	}
}
