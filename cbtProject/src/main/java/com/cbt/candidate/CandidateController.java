package com.cbt.candidate;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.common.CustomerUser;
import com.cbt.common.Paging;
import com.cbt.exam.ExamService;
import com.cbt.exam.ExamVO;
import com.cbt.question.QuestionService;
import com.cbt.takeExam.TakeExamService;
import com.fasterxml.jackson.databind.JsonNode;
import com.cbt.takeExam.TakeExamVO;


//2019.07.01 장세준 - candidate3controller로 이전
@Controller
public class CandidateController {
	
	@Autowired
	CandidateService candidateService;
	@Autowired
	ExamService examService;
	@Autowired
	TakeExamService takeExamService;
	@Autowired
	QuestionService questionService;
	
	// 카카오 추가 -7/19 생성, june
	@Autowired
    private KakaoAPI kakao;
	
    // 카카오 로그인   -7/19 변경, june
    @RequestMapping(value="/oauth")
    public String login(@RequestParam("code") String code, HttpSession session) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        return "candidate/candidate/candidateMain";
    }
    
    // 카카오 로그아웃   -7/19 변경, june
    @RequestMapping(value="kakaoLogout.do")
    public String logout(HttpSession session) {
        kakao.kakaoLogout((String)session.getAttribute("access_Token"));
        session.removeAttribute("access_Token");
        session.removeAttribute("userId");
        return "candidate/candidate/candidateMain";
    }

    
	
	//등록form 생성 - 7/1 생성 		, 	 *.do 명칭변경(CRUD기준) -  7/2
	@RequestMapping(value="insertCandidate.do", method=RequestMethod.GET)
	public String insertCandidateForm() {
		return "candidate/candidate/candidateInSignUp";
	}
	
	//등록처리  2019.07.01 생성 		, 	 *.do 명칭변경(CRUD기준) -  7/2
	@RequestMapping(value="insertCandidate.do", method=RequestMethod.POST)
	public String insertCandidate(CandidateVO vo) {
		candidateService.insertCandidate(vo);
		return "redirect:candidateMain.do";
	}
	@RequestMapping(value = "candidateAccount.do",  method = RequestMethod.GET)
	public String canidateAccount() {		
		return "candidate/candidate/candidateAccount";
	}
	//로그아웃 폼
	/*
	 * @RequestMapping(value="candidateLogout.do", method=RequestMethod.GET) public
	 * String candidateLogout(HttpSession session) { session.invalidate(); return
	 * "redirect:candidateMain.do"; }
	 */
	//로그인 폼  2019.07.03 생성 ver.2 --> 통합로그인 사용
	
	@RequestMapping(value = "candidateLogin.do", method = RequestMethod.GET)
	public String candidateLoginForm() {
		return "candidate/candidate/candidateLogin";
	}

	//로그인 처리  2019.07.03 생성 ver.2 --> 통합로그인 사용
	
	@RequestMapping(value = "candidateLogin.do", method = RequestMethod.POST)
	public String candidateLogin(CandidateVO vo, HttpSession session, Model model) {
		String targetPage = "candidate/candidate/candidateLogin";
		CandidateVO loginCandidate = candidateService.commonLogin(vo);

		if (loginCandidate != null) {
			session.setAttribute("candidate", loginCandidate);
			targetPage = "redirect:candidateMain.do";
		} else {
			model.addAttribute("loginFail", true);
		}
		return targetPage;
	}
	  
	//계정수정 form		 장세준 (7/3 ver.2)
	@RequestMapping(value="updateCandidate.do", method=RequestMethod.GET)
	public String updateCandidateForm(CandidateVO vo, Model model, Authentication authentication) {
		CustomerUser user = (CustomerUser)authentication.getPrincipal();

		vo.setTakerId(user.getUsername());
		model.addAttribute("candidate", candidateService.getCandidate(vo));
		return "candidate/candidate/candidateAccountManageModify";
	}
	
	//수정처리			장세준(7/3 ver.2)   
	@RequestMapping(value="updateCandidate.do", method=RequestMethod.POST)
	public String updateCandidate(CandidateVO vo) {
		candidateService.updateCandidate(vo);
		return "redirect:candidateMain.do";
	}
	
	//삭제처리			 장세준 (7/3)
	@RequestMapping(value="deleteCandidate.do", method=RequestMethod.POST)
	public String deleteBoard(HttpSession session) {
		CandidateVO vo=(CandidateVO) session.getAttribute("candidate");
		candidateService.deleteCandidate(vo);
		session.invalidate();
		return "redirect:candidateMain.do";
	}

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
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="idcheck.do",method=RequestMethod.POST, consumes="application/json")
  	public  Map<String, Boolean> idcheck(@RequestBody CandidateVO vo, Model model){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		int n = candidateService.idcheck(vo);
		if (n == 0) {
			map.put("result", true);
		}
		else {
			map.put("result", false);
		}
	return map;
		 
	}
	
	
	// 회사소개
	@RequestMapping("candidateInIntroduce.do")
	public String candidateInIntroduce() {
		return "candidate/candidate/candidateInIntroduce";
	}
	
	
	
	
	
	
	
	
	
	//	7/3 생성 장세준
	@ModelAttribute("conditionMap")
	public Map<String, String> conditionMap(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("takerId", "takerId");
		map.put("takerName", "takerName");
		map.put("takerInfo", "takerInfo");
		return map;
	}
	
	
	//2019.06.27 장세준 - 응시자 정보 조회(단건) --> 탈퇴 가능
	@RequestMapping("candidateAccountManage.do")	
	public String candidateAccountManage() {
		return "candidate/candidate/candidateAccountManage";
	}
	
	//원서접수 
	@RequestMapping("candidateApplication.do")	
	public String candidateApplication() {
		return "candidate/candidate/candidateApplication";
	}
	
	// 2019.07.09 성재민
		// 경로 수정 
	//2019.06.27 장세준 - *.do & view 등록
//	@RequestMapping("candidateExaminationList.do")	
//	public String candidateExaminationList() {
//		return "candidate/candidate/candidateExaminationList";
//	}
	// 2019.07.09 성재민
		// 경로 수정
	//2019.06.27 장세준 - *.do & view 등록
//	@RequestMapping("candidateExaminationListDetail.do")	
//	public String candidateExaminationListDetail() {
//		return "candidate/candidate/candidateExaminationListDetail";
//	}
	
	// 시험목록리스트
	@RequestMapping("candidateRequestList.do")
	public String candidateRequest() {
		return "candidate/candidate/candidateRequestList";
	}

	
	// 2019.07.09 성재민
	// 경로 수정
	// 시험결과 페이지 --> 설문작성 / 메인 으로 이동 
	@RequestMapping("candidatePersonalChart.do")	
	public String candidatePersonalChart() {
		return "candidate/candidate/candidatePersonalChart";
	}
	
	// 시험일정 전체 보기(로그인 없이 보기)
	// 세션에 takerId 가져와 로그인 체크기능추가   - 2019.07.18  재용
	@RequestMapping(value = "candidateScheduleCheck.do", method = RequestMethod.GET)
	public ModelAndView candidateScheduleCheck(Model model, Paging paging, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		// 로그인 체크
		if(session.getAttribute("candidate") == null) {
			mv.addObject("takerId", null);
		} else {
			CandidateVO candivo = (CandidateVO)session.getAttribute("candidate");
			mv.addObject("takerId", candivo.getTakerId());
		}
		
		mv.addObject("candidateScheduleCheck", candidateService.candidateScheduleCheckPage(paging));
		mv.setViewName("candidate/candidate/candidateScheduleCheck");
			
		return mv;
	}
	
	// 시험일정 전체 보기(로그인 없이 보기)
	/*
	 * @RequestMapping(value = "candidateScheduleCheck.do", method =
	 * RequestMethod.GET) public ModelAndView candidateScheduleCheck() {
	 * ModelAndView mv = new ModelAndView(); mv.addObject("candidateScheduleCheck",
	 * candidateService.candidateScheduleCheck());
	 * mv.setViewName("candidate/candidate/candidateScheduleCheck");
	 * 
	 * return mv; }
	 */
	
	@RequestMapping(value = "candidateExamDetialView.do/{examId}", method = RequestMethod.GET)
	public ModelAndView candidateExamDetialView(@PathVariable("examId") int examId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ExamVO examVO = new ExamVO();
		examVO.setExamId(examId);
		
		CandidateVO candivo = (CandidateVO)session.getAttribute("candidate");
		TakeExamVO vo = new TakeExamVO();
		TakeExamVO vovo = new TakeExamVO();
		
		// 2019.07.17 김재용 추가
		// 응시자ID 로 의뢰된 문항수와 HISTORY 내역비교 해서
		// 응시하기 버튼 바꾸기
		vo.setTakerId(candivo.getTakerId()); 
		vo.setExamId(examId);
		try {
			vovo = takeExamService.selectTakeExamId(vo);
			if(vovo == null) {
				takeExamService.insertTakeExam(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		mv.addObject("takeExamId", takeExamService.selectTakeExamId(vo));
		mv.addObject("takerId", candivo.getTakerId());
		
		mv.addObject("detailExam", examService.getExam(examVO));
		mv.setViewName("candidate/candidate/candidateExamDetialView");
		return mv;
	}
	
	// 시험일정 가져오기
//	@RequestMapping(value = "candidateScheduleCheck.do", method = RequestMethod.GET)
//	public String candidateScheduleCheck(HttpSession session, Model model, Paging paging) {
//		CandidateVO loginCandidate = (CandidateVO) session.getAttribute("candidate");
//		if(loginCandidate != null) {
//			CandidateVO vo = new CandidateVO();
//			vo.setTakerId(loginCandidate.getTakerId());
//			model.addAttribute("result",candidateService.ExamSchedule(vo, paging));
//			return "candidate/candidate/candidateScheduleCheck";
//		} else {
//			return "candidate/candidate/candidateLogin";
//		}
//	}
	
		
	
	// 2019.07.10 장세준
	@ResponseBody
	@RequestMapping(value = "getExamInfomation.do/{examId}", method = RequestMethod.GET)
	public ExamVO getExamInfoList(@PathVariable("examId") int examId, ExamVO vo,  Model model) {
		vo.setExamId(examId);
		return examService.getExam(vo);
	}
	
	
	// 2019.07.09 성재민
	// 경로 수정
	//연간시험일정  --> 응시하기
	/*
	 * //temp
	 * @RequestMapping(value = "candidateScheduleCheck.do/{id}", method =
	 * RequestMethod.GET) public String candidateScheduleCheck(Model
	 * model, @PathVariable("id") String id) { CandidateVO vo = new CandidateVO();
	 * vo.setTakerId(id); CandidateVO taker = candidateService.getCandidate(vo);
	 * model.addAttribute("result", candidateService.getExamList(taker)); return
	 * "candidate/candidate/candidateScheduleCheck"; }
	 */
	
	// 2019.07.09 성재민
	// 경로 수정
	/*
	 * @RequestMapping("candidateSurvey.do") public String candidateSurvey() {
	 * return "candidate/candidate/candidateSurvey"; }
	 */
	//메인화면
	@RequestMapping("candidateMain.do")
	public String candidateMain() {
		return "candidate/candidate/candidateMain";
	}
	
	

	
	
	
	/*
	 * //2019.06.27 장세준 - *.do & view 등록
	 * 
	 * @RequestMapping("candidateAccountManageModify.do") public String
	 * candidateAccountManageModify() { return
	 * "candidate/candidateAccountManageModify"; }
	 */
	/*
	 * @RequestMapping("candidateTestResult.do") public String candidateTestResult()
	 * { return "candidate/candidateTestResult"; }
	 * 
	 * @RequestMapping("candidateTakeExam.do") public String candidateTakeExam() {
	 * return "candidate/candidateTakeExam"; }
	 */
	
	/*
	 * @RequestMapping("candidateTakeExam.do") public String candidateTakeExam() {
	 * return "candidate/candidateTakeExam"; }
	 */
	/*
	@ResponseBody
	@RequestMapping(value="idcheck.do",method=RequestMethod.POST, consumes="application/json")
	
	public String idcheck(@RequestBody String takerId) {
		
	  String idRst; 
	  int count = candidateService.idcheck(takerId); 
	  if(count > 0)	  idRst ="f"; 
	  else idRst ="s"; return idRst;
	  */
	/*
	 * @RequestMapping("candidateTestResult.do") public String candidateTestResult()
	 * { return "candidate/candidateTestResult"; }
	 */
	
	/* //삭제처리			 장세준 (7/2)
	 * @RequestMapping("deleteCandidate.do") public String
	 * deleteBoard(@ModelAttribute("candidate")CandidateVO vo) {
	 * candidateService.deleteCandidate(vo); return "candidate/candidateMain"; }
	 */
	/*
	 * //2019.06.27 장세준 - *.do & view 등록
	 * 
	 * @RequestMapping("candidateRightAnswer.do") public String
	 * candidateRightAnswer() { return "candidate/candidateRightAnswer"; }
	 */
	
	/*// header 별도 지정(tiles에 candidateHeader.xml)
	 * @RequestMapping("candidateInHeader.do") public String candidateInHeader() {
	 * return "candidate/candidateInHeader"; }
	 */
	//로그인  2019.07.02 생성 ver.1
		/* 
		 * @RequestMapping(value="candidateLogin.do", method=RequestMethod.GET) public
		 * String candidateLoginForm() { return "candidate/candidateLogin"; }
		 */
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
	//계정수정 form		 장세준 (7/3 ver.1)
			/*
			 * @RequestMapping("/updateCandidate/{takerId}") public String
			 * updateCandidateForm(@PathVariable("takerId") String takerId, CandidateVO vo,
			 * Model model) { vo.setTakerId(takerId); model.addAttribute("candidate",
			 * candidateService.getCandidate(vo)); return
			 * "candidate/candidateAccountManageModify"; }
			 */
		//수정처리			장세준(7/3 ver.1)
		/*
		 * @RequestMapping("updateCandidate.do") public String
		 * updateCandidate(@ModelAttribute("candidate")CandidateVO vo) {
		 * candidateService.updateCandidate(vo); return "candidate/candidateMain"; }
		 */
}