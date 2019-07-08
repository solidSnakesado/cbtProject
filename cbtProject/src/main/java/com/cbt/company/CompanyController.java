package com.cbt.company;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String companyLogin(CompanyVO vo, HttpSession session) {
		String 		targetPage 		= "company/companyLogin";
		CompanyVO 	loginCompany 	= companyService.loginCompany(vo);
		
		if(loginCompany != null) {
			session.setAttribute("company", loginCompany);
			targetPage = "company/company/companyMain";
		}
		
		return targetPage;
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
	// 관리자 컴퍼니 상세조회, 수정폼
	@RequestMapping(value="managerAccountManage.do/{companyId}", method=RequestMethod.GET)
	public String managerAccountManage(@PathVariable String companyId, Model model, CompanyVO vo) {
		vo.setCompanyId(companyId);
		model.addAttribute("result", companyService.getCompany(vo));
		return "manager/managerAccountManage";
	}
	
	// 관리자 컴퍼니 정보 수정처리
	@RequestMapping("updateManagerAccount.do")
	public String updateManagerAccount(@ModelAttribute("company") CompanyVO vo) {
		companyService.updateCompany(vo);
		return "redirect:managerAccountList.do";
	}
}
