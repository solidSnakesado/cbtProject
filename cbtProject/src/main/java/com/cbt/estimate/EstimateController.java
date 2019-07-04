package com.cbt.estimate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EstimateController {

	@Autowired
	EstimateService estimateService;
	
	//기업은 자기의뢰 내용을 볼수있다.
	@RequestMapping(value= "companyEstimateList.do", method = RequestMethod.GET )
	public String companyEstimateList(Model model, EstimateVO vo) {
		model.addAttribute("result", estimateService.getEstimateList(vo));
		return "test";
		//return "company/companyRequestList"; //나중에 request가 Estimate로 바뀌면 바꾸어주어야함
	}
	
	//기업은 의뢰 등록 할수 있다.
	@RequestMapping(value = "companyEstimateInsert.do", method = RequestMethod.GET)
	public String companyEstimateInsertForm() {
		return "company/companyEstimate"; 
	}
	
	@RequestMapping(value = "companyEstimateInsert.do", method = RequestMethod.POST)
	public String companyEstimateInsert(EstimateVO vo) {
		estimateService.insertEstimate(vo);		
		return "redirect:companyEstimateList.do"; 
	}
	
	//기업은 자기의뢰 수정 할수 있다.
	@RequestMapping(value = "companyEstimateUpdate.do", method = RequestMethod.GET)
	public String companyEstimateUpdateForm() {
		return "company/companyDetailRequestList"; 
	}
	@RequestMapping(value = "companyEstimateUpdate.do", method = RequestMethod.POST)
	public String companyEstimateUpdate(EstimateVO vo) {
		estimateService.updateEstimate(vo);
		return "redirect:companyEstimateList.do"; 
	}
	
	//기업은 자기의뢰를 삭제 할 수 있다.
	@RequestMapping(value = "companyEstimateDelete.do", method = RequestMethod.GET)
	public String companyEstimateDelete(EstimateVO vo) {
		estimateService.deleteEstimate(vo);
		return "redirect:companyConSultingList.do";
	}
	
	//관리자는 기업의뢰를 조회 할 수 있다.
	
}
