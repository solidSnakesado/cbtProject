package com.cbt.estimate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//기업은 자기의뢰 내용을 볼수있다.
	
	@ResponseBody 
	@RequestMapping(value= "/Estimate", method = RequestMethod.GET )
	public List<EstimateVO> companyEstimateList(Model model, EstimateVO vo) {
		//model.addAttribute("result", estimateService.getEstimateList(vo));
		
		return estimateService.getEstimateList(vo); //나중에 request가 Estimate로 바뀌면 바꾸어주어야함
	}
	
	@RequestMapping(value="companyEstimateList.do", method = RequestMethod.GET)
	public String companyEstimateListForm() {
		System.out.println("companyEstimateList GET");
		return "company/company/companyEstimateList";
	}
	
	//기업의뢰 등록		기업은 의뢰 등록 할수 있다.
	@RequestMapping(value = "companyEstimateInsert.do", method = RequestMethod.GET)
	public String companyEstimateInsertForm() {
		return "company/company/companyEstimate"; 
	}
	
	@RequestMapping(value = "companyEstimateInsert.do", method = RequestMethod.POST)
	public String companyEstimateInsert(EstimateVO vo) {
		estimateService.insertEstimate(vo);		
		return "redirect:companyEstimateList.do"; 
	}
	
	//기업은 자기의뢰 수정 할수 있다.
	@RequestMapping(value = "companyEstimateUpdate.do", method = RequestMethod.GET)
	public String companyEstimateUpdateForm() {
		return "company/company/companyDetailRequestList";
		//return "company/companyDetailRequestList";
	}
	
	
	@RequestMapping(value = "/companyEstimateUpdate.do", method=RequestMethod.POST)
	public String companyEstimateUpdate(EstimateVO vo) {
		
		//vo.setEstimateId(estimateId);
		estimateService.updateEstimate(vo);
		return "redirect:companyEstimateList.do"; 
	}
	
	//기업은 자기의뢰를 삭제 할 수 있다.
	@RequestMapping(value = "companyEstimateDelete.do", method = RequestMethod.GET)
	public String companyEstimateDelete(EstimateVO vo) {
		estimateService.deleteEstimate(vo);
		return "redirect:companyConSultingList.do";
	}
	
	//의뢰세부내용보기
	@RequestMapping(value="companyDetailRequestList.do/{estimateId}", method = RequestMethod.GET)
	
	public String companyDetailRequestList(@PathVariable("estimateId") int estimateId, //String ->int바꿔야함
												EstimateVO vo,
												Model model) {
		
		vo.setEstimateId(estimateId); 
		model.addAttribute("myEstimateList", estimateService.getEstimate(vo));
		model.addAttribute("G", conditionService.getConditionDetailList("G"));
		model.addAttribute("H", conditionService.getConditionDetailList("H"));
		return "empty/company/companyDetailRequestList";
	}
	
	
	
	//관리자는 기업의뢰를 조회 할 수 있다.
	
}
