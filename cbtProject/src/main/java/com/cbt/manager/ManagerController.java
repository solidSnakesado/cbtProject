package com.cbt.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.candidate.CandidateService;
import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;
import com.cbt.company.CompanyService;
import com.cbt.company.CompanyVO;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService managerService;
	@Autowired
	CompanyService companyService;
	@Autowired
	CandidateService candidateService;
	
	//메인
	@RequestMapping(value ="/managerMain.do", method=RequestMethod.GET)
	public String managerMain() {
		return "manager/managerMain";
	}
	//등록폼
	@RequestMapping(value = "insertManager.do", method = RequestMethod.GET)
	public String insertManagerForm() {
		return "manager/insertManager";
	}
	
	//등록처리
	@RequestMapping(value = "insertManager.do", method = RequestMethod.POST)
	public String insertManager(ManagerVO vo) {
		managerService.insertManager(vo);
		return "redirect:getManagerList.do";
	}
	
	//전체조회
	@RequestMapping("/getManagerList.do")
	public ModelAndView getManagerList(ModelAndView mv, Paging paging ,
										@RequestParam(value="searchManager", required=false) String searchManager) {
		
		
		ManagerVO vo = new ManagerVO();
		vo.setSearchManager(searchManager);
		mv.addObject("result", managerService.getManagerList(vo, paging));
		mv.setViewName("manager/getManagerList");
		return mv;
	}
	
	//수정폼
	@RequestMapping("/updateManager/{managerId}")
	public String updateManagerForm( @PathVariable("managerId") String managerId, 
									 ManagerVO vo,
									 Model model) {
		vo.setManagerId(managerId);
		model.addAttribute("manager", managerService.getManager(vo));
		return "manager/updateManager";
	}
	
	//수정처리
	@RequestMapping("updateManager.do")
	public String updateManager(@ModelAttribute("manager") ManagerVO vo) {
		System.out.println("===========\n" + vo);
		managerService.updateManager(vo);
		return "redirect:getManagerList.do";
	}
	
	//삭제처리
	@RequestMapping("deleteManager.do")
	public String deleteManager(ManagerVO vo) {
		managerService.deleteManager(vo);
		return "redirect:getManagerList.do";
	}
	
	// 7/5 재용추가
	@RequestMapping("managerUserAccountView.do")
	public ModelAndView managerUserAccountView() {
		ManagerTakerVO vo = new ManagerTakerVO();
		vo.setTakerId("sime00");
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("getManagerUserAccountView", managerService.getManagerUserAccountView(vo));
		mv.setViewName("manager/managerUserAccountView");
		
		return mv;
	}
	
	// 7/5 재용추가
	
	
	// 7/5 재용추가
	@RequestMapping("managerRequestListDetail.do")
	public String managerRequestListDetail() {
		
		return "manager/managerRequestListDetail";
	}
	
	@RequestMapping("managerAccountControl.do")
	public String managerAccountControl() {
		
		return "manager/managerAccountControl";
	}
	
	@RequestMapping(value="managerAccountList.do", method=RequestMethod.GET)
	public String getManagerAccountList(Model model, CompanyVO vo) {
		model.addAttribute("result", companyService.getCompanyList(vo));
		return "manager/managerAccountList";
	}
	
	@RequestMapping(value="managerUserAccountList.do", method=RequestMethod.GET)
	public String managerUserAccountList(Model model, CandidateVO vo) {
		model.addAttribute("result", candidateService.getCandidateList(vo));
		return "manager/managerUserAccountList";
	}
	
	
	
}
