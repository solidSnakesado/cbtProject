package com.cbt.manager;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.cbt.candidate.CandidateService;
import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;
import com.cbt.company.CompanyService;
import com.cbt.company.CompanyVO;
import com.cbt.condition.ConditionService;
import com.cbt.consulting.ConsultingService;
import com.cbt.consulting.ConsultingVO;
import com.cbt.estimate.EstimateService;
import com.cbt.estimate.EstimateVO;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;
	@Autowired
	CompanyService companyService;
	@Autowired
	CandidateService candidateService;
	@Autowired
	ConditionService conditionService;
	@Autowired
	ConsultingService consultingService;
	@Autowired
	EstimateService estimateService;

	// 메인
	@RequestMapping(value = "/managerMain.do", method = RequestMethod.GET)
	public String managerMain() {
		return "manager/manager/managerMain";
	}

	// 등록폼
	@RequestMapping(value = "insertManager.do", method = RequestMethod.GET)
	public String insertManagerForm() {
		return "manager/manager/insertManager";
	}

	// 등록처리
	@RequestMapping(value = "insertManager.do", method = RequestMethod.POST)
	public String insertManager(ManagerVO vo) {
		managerService.insertManager(vo);
		return "redirect:getManagerList.do";
	}

	// 전체조회
	@RequestMapping("/getManagerList.do")
	public ModelAndView getManagerList(ModelAndView mv, Paging paging,
			@RequestParam(value = "searchManager", required = false) String searchManager) {

		ManagerVO vo = new ManagerVO();
		vo.setSearchManager(searchManager);
		mv.addObject("result", managerService.getManagerList(vo, paging));
		mv.setViewName("manager/manager/getManagerList");
		return mv;
	}

	// 수정폼
	@RequestMapping("/updateManager/{managerId}")
	public String updateManagerForm(@PathVariable("managerId") String managerId, ManagerVO vo, Model model) {
		vo.setManagerId(managerId);
		model.addAttribute("manager", managerService.getManager(vo));
		return "manager/manager/updateManager";
	}

	// 수정처리
	@RequestMapping("updateManager.do")
	public String updateManager(@ModelAttribute("manager") ManagerVO vo) {
		System.out.println("===========\n" + vo);
		managerService.updateManager(vo);
		return "redirect:getManagerList.do";
	}

	// 삭제처리
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

		return "manager/manager/managerRequestListDetail";
	}
	// 기업계정 or 응시자계정 관리 선택지
	@RequestMapping("managerAccountControl.do")
	public String managerAccountControl() {

		return "manager/manager/managerAccountControl";
	}
	// 매니저, 기업 상담 리스트 출력
	@RequestMapping(value = "managerConsultingList.do", method = RequestMethod.GET)
	public String managerConsultingList(Model model, ConsultingVO vo) {
		model.addAttribute("result", consultingService.managerConsultingList(vo));
		return "manager/manager/managerConsultingList";
	}

	@RequestMapping(value = "managerEstimateList.do", method = RequestMethod.GET)
	public String getManagerEstimateList(Model model, EstimateVO vo) {
		model.addAttribute("result", estimateService.getEstimateList(vo));
		return "manager/manager/managerEstimateList";
	}
	
	@RequestMapping(value = "managerAccountList.do", method = RequestMethod.GET)
	public String getManagerAccountList(Model model, CompanyVO vo) {
		model.addAttribute("result", companyService.getCompanyList(vo));
		return "manager/manager/managerAccountList";
	}

	// 관리자 컴퍼니 상세조회, 수정폼
	@RequestMapping(value = "managerAccountManage.do/{companyId}", method = RequestMethod.GET)
	public String managerAccountManage(@PathVariable String companyId, Model model, CompanyVO vo) {
		vo.setCompanyId(companyId);
		model.addAttribute("result", companyService.getCompany(vo));
		model.addAttribute("E", conditionService.getConditionDetailList("E"));
		model.addAttribute("F", conditionService.getConditionDetailList("F"));
		return "manager/manager/managerAccountManage";
	}

	// 관리자 컴퍼니 정보 수정처리
	@RequestMapping(value = "managerAccountManage.do", method = RequestMethod.POST)
	public String ManagerAccountManage(@ModelAttribute("company") CompanyVO vo) {
		companyService.updateCompany(vo);
		return "redirect:managerAccountList.do";
	}

	// 매니저가 회사 추가폼
	@RequestMapping(value = "managerAccountInsert.do", method = RequestMethod.GET)
	public String managerAccountInsertForm(CompanyVO vo, Model model) {
		model.addAttribute("E", conditionService.getConditionDetailList("E"));
		model.addAttribute("F", conditionService.getConditionDetailList("F"));
		return "manager/manager/managerAccountInsert";
	}

	// 매니저가 회사 추가
	@RequestMapping(value = "managerAccountInsert.do", method = RequestMethod.POST)
	public String managerAccountInsert(CompanyVO vo) {
		companyService.insertCompany(vo);
		return "redirect:managerAccountList.do";
	}

	// 매니저가 회사 삭제처리
	@RequestMapping("managerAccountDelete.do")
	public String managerAccountDelete(CompanyVO vo) {
		companyService.deleteCompany(vo);
		return "redirect:managerAccountList.do";
	}

	// 관리자 유저 리스트 출력
	@RequestMapping(value = "managerUserAccountList.do", method = RequestMethod.GET)
	public String managerUserAccountList(Model model, CandidateVO vo) {
		model.addAttribute("result", candidateService.getCandidateList(vo));
		return "manager/manager/managerUserAccountList";
	}

	// 관리자 응시자 상세조회, 수정폼
	@RequestMapping(value = "managerUserAccountEdit.do/{takerId}", method = RequestMethod.GET)
	public String managerUserAccountEdit(@PathVariable String takerId, Model model, CandidateVO vo) {
		vo.setTakerId(takerId);
		model.addAttribute("result", candidateService.getCandidate(vo));
		model.addAttribute("J", conditionService.getConditionDetailList("J"));
		return "manager/manager/managerUserAccountEdit";
	}

	// 관리자 응시자 정보 수정처리
	@RequestMapping(value = "managerUserAccountEdit.do", method = RequestMethod.POST)
	public String updateUserAccount(@ModelAttribute("taker") CandidateVO vo) {
		candidateService.updateCandidate(vo);
		return "redirect:managerUserAccountList.do";
	}

	// 매니저가 유저 추가폼
	@RequestMapping(value = "managerUserInsert.do", method = RequestMethod.GET)
	public String managerUserInsertForm(CandidateVO vo, Model model) {
		model.addAttribute("J", conditionService.getConditionDetailList("J"));

		return "manager/manager/managerUserInsert";
	}

	// 매니저가 유저 추가
	@RequestMapping(value = "managerUserInsert.do", method = RequestMethod.POST)
	public String managerUserInsert(CandidateVO vo) {
		candidateService.insertCandidate(vo);
		return "redirect:managerUserAccountList.do";
	}

	// 매니저가 유저 삭제
	@RequestMapping("managerUserDelete.do")
	public String managerUserDelete(CandidateVO vo) {
		candidateService.deleteCandidate(vo);
		return "redirect:managerUserAccountList.do";
	}

	// 로그인 폼 (7/9 생성, JUNE)
	@RequestMapping(value = "managerLogin.do", method = RequestMethod.GET)
	public String managerLoginForm() {
		return "manager/manager/managerLogin";
	}

	// 로그인처리 (7/9 생성, JUNE)
	@RequestMapping(value = "managerLogin.do", method = RequestMethod.POST)
	public String managerLogin(ManagerVO vo, HttpSession session) {
		String targetPage = "manager/manager/managerLogin";
		ManagerVO loginManager = managerService.loginManager(vo);
		if (loginManager != null) {
			session.setAttribute("manager", loginManager);
			targetPage = "redirect:managerMain.do";
		}
		return targetPage;
	}

	// 로그아웃 처리(7/9 생성, JUNE)
	@RequestMapping(value = "managerLogout.do", method = RequestMethod.GET)
	public String managerLogout(HttpSession session) {
		session.invalidate();
		return "redirect:managerMain.do";
	}

	

}
