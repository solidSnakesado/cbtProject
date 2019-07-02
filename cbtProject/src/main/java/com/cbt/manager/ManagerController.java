package com.cbt.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.common.Paging;

@Controller
public class ManagerController {
	ManagerService managerService;
	
	@RequestMapping("managerMain.do")
	public String managerMain() {
		return "manager/managerMain";
	}
	
	@RequestMapping("managerAccount.do")
	public String managerAccount() {
		return "manager/managerAccount";
	}
	
	@RequestMapping("managerAccountControl.do")
	public String managerAccountControl() {
		return "manager/managerAccountControl";
	}
	
	/*
	 * @RequestMapping("/managerAccountList.do") public ModelAndView
	 * managerAccountList(ManagerVO vo, Paging paging, ModelAndView mv) {
	 * mv.addObject("result", managerService.getManagerList(vo, paging));
	 * 
	 * }
	 */
}
