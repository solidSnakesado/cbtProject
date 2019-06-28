package com.cbt.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	@RequestMapping("managerMain.do")
	public String managerMain() {
		return "manager/managerMain";
	}
}
