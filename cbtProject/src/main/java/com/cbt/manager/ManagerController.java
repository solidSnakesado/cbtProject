package com.cbt.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.common.Paging;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService managerService;
	
	//메인
	@RequestMapping("managerMain.do")
	public String managerMain() {
		return "manager/managerMain";
	}
	//등록폼
	@RequestMapping("insertManagerForm.do")
	public String insertManagerForm() {
		return "manager/insertManager";
	}
	
	//등록처리
	@RequestMapping("insertManager.do")
	public String insertManager(ManagerVO vo) {
		managerService.insertManager(vo);
		return "redirect:getManagerList.do";
	}
	
	//전체조회
	@RequestMapping("/getManagerList.do")
	public String getManagerList(ManagerVO vo, Model model) {
		model.addAttribute("managerList", managerService.getManagerList(vo));
		return "manager/getManagerList";
	}
	
	//수정폼
	@RequestMapping("/updateManagerForm.do")
	public String updateManagerForm(ManagerVO vo, Model model) {
		model.addAttribute("manager", managerService.getManager(vo));
		return "manager/updateManager";
	}
	
	//수정처리
	@RequestMapping("updateManager.do")
	public String updateManager(ManagerVO vo) {
		managerService.updateManager(vo);
		return "redirect:getManagerList.do";
	}
	
	//삭제처리
	@RequestMapping("deleteManager.do")
	public String deleteManager(ManagerVO vo) {
		managerService.deleteManager(vo);
		return "redirect:getManagerList.do";
	}
	
}
