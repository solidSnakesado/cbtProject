package com.cbt.company;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

// 2019.06.27 성재민
// 컴퍼니 메인 컨트롤러 연결
@Controller
public class CompanyController {
	@RequestMapping("companyMain.do")
	public String companyMain() {
		return "company/companyMain";
	}
	
	//@RequestMapping("companySignUp.do")
	
}
