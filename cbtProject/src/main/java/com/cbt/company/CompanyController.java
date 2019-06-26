package com.cbt.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyController {
	@RequestMapping("companyMain.do")
	public String companyMain() {
		return "company/companyMain";
	}
}
