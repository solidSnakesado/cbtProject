package com.cbt.estimate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.common.Paging;
import com.cbt.condition.ConditionService;

/* @RestController가 @ResponseBody를 포함하고 있기 때문에
 * view가 필요하고 restfulAPI와 묶고 싶을 경우 클래스에 @Controller로 지정해주고, restfulAPI에는 일일이 @ResponseBody를 붙여야된다.
 */
@Controller
public class EstimateController {
	
	@Autowired
	ConditionService conditionService;
	@Autowired
	EstimateService estimateService;
	
	//기업은 자기의뢰 내용을 볼수있다. company-select
	@RequestMapping(value="companyEstimateList.do", method = RequestMethod.GET)
	public ModelAndView companyEstimateListForm(Paging paging,
												ModelAndView mv,
												EstimateVO vo) {
		mv.addObject("result", estimateService.getEstimateList(vo, paging));
		mv.setViewName("company/company/companyEstimateList");
		return mv;
	}
	

	
	//기업은 자기의뢰 수정 할수 있다.  company-update
	@RequestMapping(value = "companyEstimateUpdate.do", method = RequestMethod.GET)
	public String companyEstimateUpdateForm() {
		return "company/company/companyEstimateDetail";
		//return "company/companyEstimateDetail";
	}
	
	
	@RequestMapping(value = "/companyEstimateUpdate.do", method=RequestMethod.POST)
	public void companyEstimateUpdate(EstimateVO vo , HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		//vo.setEstimateId(estimateId);
		estimateService.updateEstimate(vo);
		
		//윈도우창 닫기
		out.print("<script>");
		out.print("window.opener.top.location.reload();");
		out.print("window.close();");
		out.print("</script>");
		out.flush();
	}
	
	//기업은 자기의뢰를 삭제 할 수 있다.  company-delete
	@RequestMapping(value = "companyEstimateDelete.do", method = RequestMethod.GET)
	public String companyEstimateDelete(EstimateVO vo) {
		estimateService.deleteEstimate(vo);
		return "redirect:companyEstimateList.do";
	}
	
	//의뢰세부내용보기			 company-select-detail
	@RequestMapping(value="companyEstimateDetail.do/{estimateId}", method = RequestMethod.GET)
	
	public String companyEstimateDetail(@PathVariable("estimateId") int estimateId, //String ->int바꿔야함
												EstimateVO vo,
												Model model) {
		
		vo.setEstimateId(estimateId); 
		model.addAttribute("myEstimateList", estimateService.getEstimate(vo));
		model.addAttribute("B", conditionService.getConditionDetailList("B")); 	//B-의뢰진행상태
		model.addAttribute("G", conditionService.getConditionDetailList("G")); 	//G-시험난이도
		model.addAttribute("H", conditionService.getConditionDetailList("H"));	//H-시험횟수
		model.addAttribute("K", conditionService.getConditionDetailList("K"));	//K-응시대상자
		model.addAttribute("L", conditionService.getConditionDetailList("L"));	//L-응시목적
		model.addAttribute("M", conditionService.getConditionDetailList("M"));	//M-시험분류
		model.addAttribute("N", conditionService.getConditionDetailList("N"));	//N-시험간격
		return "empty/company/companyEstimateDetail";
	}
	
	
	////////////////////////////관리자///////////////////////
	
	//관리자는 기업의 의뢰서를 조회할수있다. manager-select
	@RequestMapping(value="managerEstimateList.do", method = RequestMethod.GET)
	public ModelAndView managerEstimateListForm(Paging paging,
												ModelAndView mv,
												EstimateVO vo) {
		mv.addObject("result", estimateService.getEstimateList(vo, paging));
		mv.setViewName("manager/manager/managerEstimateList");
		return mv;
	}
	
	
	//관리자의뢰 등록		관리자는 상담내역을가지고 의뢰서를 등록한다. manager-insert
	@RequestMapping(value = "managerEstimateInsert.do", method = RequestMethod.GET)
	public String managerEstimateInsertForm(Model model) {
		model.addAttribute("K", conditionService.getConditionDetailList("K"));	//K-응시대상자
		model.addAttribute("G", conditionService.getConditionDetailList("G")); 	//G-시험난이도
		model.addAttribute("H", conditionService.getConditionDetailList("H"));	//H-시험횟수
		model.addAttribute("M", conditionService.getConditionDetailList("M")); 	//M-시험분류
		model.addAttribute("L", conditionService.getConditionDetailList("L"));	//L-응시목적
		model.addAttribute("N", conditionService.getConditionDetailList("N"));	//N-시험간격
		return "manager/manager/managerEstimateInsert"; 
	}
	
	@RequestMapping(value = "managerEstimateInsert.do", method = RequestMethod.POST)
	public String managerEstimateInsert(EstimateVO vo) {
		estimateService.insertEstimate(vo);	
		return "redirect:managerEstimateList.do"; 
	}
	
	
	
	//관리자는 의뢰내용을 수정 할수 있다.  manager-update
		@RequestMapping(value = "managerEstimateUpdate.do", method = RequestMethod.GET)
		public String managerEstimateUpdateForm() {
			return "manager/manager/managerDetailEstimateList";
			//return "company/companyEstimateDetail";
		}
		
		
		@RequestMapping(value = "/managerEstimateUpdate.do", method=RequestMethod.POST)
		public void managerEstimateUpdate(EstimateVO vo , HttpServletResponse response) throws IOException {
			
			PrintWriter out = response.getWriter();
			//vo.setEstimateId(estimateId);
			estimateService.updateEstimate(vo);
			
			//윈도우창 닫기
			out.print("<script>");
			out.print("window.opener.top.location.reload();");
			out.print("window.close();");
			out.print("</script>");
			out.flush();
		}
	
		//관리자는 의뢰를 삭제 할 수 있다.  manager-delete
		@RequestMapping(value = "managerEstimateDelete.do", method = RequestMethod.GET)
		public String managerEstimateDelete(EstimateVO vo) {
			estimateService.deleteEstimate(vo);
			return "redirect:managerEstimateList.do";
		}
	
	
		
		//관리자 의뢰세부내용보기			 manager-select-detail
		@RequestMapping(value="managerEstimateDetail.do/{estimateId}", method = RequestMethod.GET)
		
		public String managerEstimateDetail(@PathVariable("estimateId") int estimateId, //String ->int바꿔야함
													EstimateVO vo,
													Model model) {
			
			vo.setEstimateId(estimateId); 
			model.addAttribute("myEstimateList", estimateService.getEstimate(vo));
			model.addAttribute("B", conditionService.getConditionDetailList("B")); 	//B-의뢰진행상태
			model.addAttribute("G", conditionService.getConditionDetailList("G")); 	//G-시험난이도
			model.addAttribute("H", conditionService.getConditionDetailList("H"));	//H-시험횟수
			model.addAttribute("K", conditionService.getConditionDetailList("K"));	//K-응시대상자
			model.addAttribute("L", conditionService.getConditionDetailList("L"));	//L-응시목적
			model.addAttribute("M", conditionService.getConditionDetailList("M"));	//M-시험분류
			model.addAttribute("N", conditionService.getConditionDetailList("N"));	//N-시험간격
			return "empty/manager/managerEstimateDetail";
		}
		
		
}
