package com.cbt.candidate;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;


//2019.07.01 장세준 - candidate3controller로 이전
@Controller
public class CandidateController {
	
	@Autowired
	CandidateService candidateService;
	
	//	7/3 생성 장세준
	@ModelAttribute("conditionMap")
	public Map<String, String> conditionMap(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("takerId", "takerId");
		map.put("takerName", "takerName");
		map.put("takerInfo", "takerInfo");
		return map;
	}
	
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateAccountManage.do")	
	public String candidateAccountManage() {
		return "candidate/candidateAccountManage";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateAccountManageModify.do")	
	public String candidateAccountManageModify() {
		return "candidate/candidateAccountManageModify";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateApplication.do")	
	public String candidateApplication() {
		return "candidate/candidateApplication";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateExaminationList.do")	
	public String candidateExaminationList() {
		return "candidate/candidateExaminationList";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
	@RequestMapping("candidateExaminationListDetail.do")	
	public String candidateExaminationListDetail() {
		return "candidate/candidateExaminationListDetail";
	}
	
	//2019.06.27 장세준 - *.do & view 등록
//	@RequestMapping("candidateRightAnswer.do")	
//	public String candidateRightAnswer() {
//		return "candidate/candidateRightAnswer";
//	}

	@RequestMapping("candidateRequestList.do")
	public String candidateRequest() {
		return "candidate/candidateRequestList";
	}

	@RequestMapping("candidateInHeader.do")
	public String candidateInHeader() {
		return "candidate/candidateInHeader";
	}

	@RequestMapping("candidateInIntroduce.do")
	public String candidateInIntroduce() {
		return "candidate/candidateInIntroduce";
	}
	
	@RequestMapping("candidatePersonalChart.do")	
	public String candidatePersonalChart() {
		return "candidate/candidatePersonalChart";
	}
	
	@RequestMapping("candidateScheduleCheck.do")	
	public String candidateScheduleCheck() {
		return "candidate/candidateScheduleCheck";
	}
	
	@RequestMapping("candidateSurvey.do")	
	public String candidateSurvey() {
		return "candidate/candidateSurvey";
	}
	
	@RequestMapping("candidateMain.do")
	public String candidateMain() {
		return "candidate/candidateMain";
	}
//	@RequestMapping("candidateTestResult.do")	
//	public String candidateTestResult() {
//		return "candidate/candidateTestResult";
//	}
	
//	@RequestMapping("candidateTakeExam.do")	
//	public String candidateTakeExam() {
//		return "candidate/candidateTakeExam";
//	}
	
	
	
	
	
	
	//등록form 생성 - 7/1 생성 		, 	 *.do 명칭변경(CRUD기준) -  7/2
	@RequestMapping(value="insertCandidate.do", method=RequestMethod.GET)
	public String insertCandidateForm() {
		return "candidate/candidateInSignUp";
	}
	
	//등록처리  2019.07.01 생성 		, 	 *.do 명칭변경(CRUD기준) -  7/2
	@RequestMapping(value="insertCandidate.do", method=RequestMethod.POST)
	public String insertCandidate(CandidateVO vo) {
		candidateService.insertCandidate(vo);
		return "redirect:candidateMain.do";
	}
	@RequestMapping(value = "candidateAccount.do",  method = RequestMethod.GET)
	public String canidateAccount() {		
		return "candidate/candidateAccount";
	}
	//로그인  2019.07.03 생성 ver.2
	@RequestMapping(value="candidateLogin.do", method=RequestMethod.GET)
	public String candidateLoginForm() {
		return "candidate/candidateLogin";
	}
	//로그인  2019.07.02 생성 ver.1
	/* 
	 * @RequestMapping(value="candidateLogin.do", method=RequestMethod.GET) public
	 * String candidateLoginForm() { return "candidate/candidateLogin"; }
	 */
	//로그인  2019.07.03 생성 ver.2
	@RequestMapping(value="candidateLogin.do", method=RequestMethod.POST)
	public String candidateLogin(CandidateVO vo, HttpSession session) {
		String targetPage = "candidate/candidateLogin";
		CandidateVO loginCandidate = candidateService.loginCandidate(vo);
		
		if(loginCandidate != null) {
			session.setAttribute("candidate", loginCandidate);
			targetPage = "redirect:candidateMain.do";
		}
		return targetPage;
	}
	//로그인  2019.07.02 생성  ver.1
	/*
	 * @RequestMapping(value="candidateLogin.do", method=RequestMethod.POST) public
	 * String candidateLogin(CandidateVO vo, HttpSession session) { String
	 * targetPage = "candidate/candidateLogin"; CandidateVO loginCandidate =
	 * candidateService.loginCandidate(vo);
	 * 
	 * if(loginCandidate != null) { session.setAttribute("canidate",
	 * loginCandidate); targetPage = "candidate/candidateMain"; } return targetPage;
	 * }
	 */
	//계정수정 form		 장세준 (7/3 ver.2)
	@RequestMapping(value="updateCandidate.do", method=RequestMethod.GET)
	public String updateCandidateForm() {
		return "candidate/candidateAccountManageModify";
	}
	//계정수정 form		 장세준 (7/3 ver.1)
	/*
	 * @RequestMapping("/updateCandidate/{takerId}") public String
	 * updateCandidateForm(@PathVariable("takerId") String takerId, CandidateVO vo,
	 * Model model) { vo.setTakerId(takerId); model.addAttribute("candidate",
	 * candidateService.getCandidate(vo)); return
	 * "candidate/candidateAccountManageModify"; }
	 */
	//수정처리			장세준(7/3 ver.2)
	@RequestMapping("updateCandidate.do")
	public String updateCandidate(CandidateVO vo) {
		candidateService.updateCandidate(vo);
		return "candidate/candidateMain";
	}
	//수정처리			장세준(7/3 ver.1)
	/*
	 * @RequestMapping("updateCandidate.do") public String
	 * updateCandidate(@ModelAttribute("candidate")CandidateVO vo) {
	 * candidateService.updateCandidate(vo); return "candidate/candidateMain"; }
	 */
	//삭제처리			 장세준 (7/3)
	@RequestMapping(value="deleteCandidate.do", method=RequestMethod.POST)
	public String deleteBoard(HttpSession session) {
		CandidateVO vo=(CandidateVO) session.getAttribute("candidate");
		candidateService.deleteCandidate(vo);
		return "redirect:candidateLogin.do";
	}
//	@RequestMapping("candidateTestResult.do")	
//	public String candidateTestResult() {
//		return "candidate/candidateTestResult";
//	}
	//삭제처리			 장세준 (7/2)
	/*
	 * @RequestMapping("deleteCandidate.do") public String
	 * deleteBoard(@ModelAttribute("candidate")CandidateVO vo) {
	 * candidateService.deleteCandidate(vo); return "candidate/candidateMain"; }
	 */
	//단건조회			 장세준 (7/2)
	@RequestMapping("/getCandidate/{takerId}")
	public String getCandidate(@PathVariable("takerId") String takerId, CandidateVO vo, Model model) {
		vo.setTakerId(takerId);
		model.addAttribute("candidate", candidateService.getCandidate(vo));
		return "candidate/candidateAccountManage";
	}
	@RequestMapping("getCandidateList.do")
	public ModelAndView getCandidateList(Paging paging, ModelAndView mv,
			@RequestParam(value = "searchCondition", required =false) String searchCondition,
			@RequestParam(value = "searchKeyword", required =false) String searchKeyword,
			@RequestParam(value = "sort", required =false, defaultValue = "takerId") String sort) {
		CandidateVO vo = new CandidateVO();
		vo.setSearchCondition(searchCondition);
		vo.setSearchKeyword(searchKeyword);
		vo.setSort(sort);
		
		mv.addObject("result", candidateService.getCandidateList(vo, paging));
		mv.setViewName("candidate/getCandidateList");
		return mv;
	}
	
//	@RequestMapping("candidateTakeExam.do")	
//	public String candidateTakeExam() {
//		return "candidate/candidateTakeExam";
//	}
	
	//
	@RequestMapping("idcheck.do")
	@ResponseBody
	public String idcheck(@RequestBody String takerId) {
		
		String idRst;
		int count=candidateService.idcheck(takerId);
		if(count > 0)	idRst ="f";
		else			idRst ="s";
		return idRst;
	}
	//관리자 응시자 상세조회, 수정폼
	@RequestMapping(value="managerUserAccountEdit.do/{takerId}", method=RequestMethod.GET)
	public String managerUserAccountEdit(@PathVariable String takerId, Model model, CandidateVO vo) {
		vo.setTakerId(takerId);
		model.addAttribute("result", candidateService.getCandidate(vo));
		return "manager/managerUserAccountEdit";
	}
	//관리자 응시자 정보 수정처리
	@RequestMapping("updateUserAccountEdit.do")
	public String updateUserAccount(@ModelAttribute("taker") CandidateVO vo) {
		candidateService.updateCandidate(vo);
		return "redirect:managerUserAccountList.do";
	}
	
	// 매니저가 유저 추가
	@RequestMapping("managerUserInsert.do")
	public String managerUserInsert() {
//		candidateService.insertCandidate(vo);
		return "manager/managerUserAccountList";
	}
	
}
