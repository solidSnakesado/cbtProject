package com.cbt.consulting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 2019.07.03 성재민
// 컨설팅 컨트롤러 추가
@Controller
public class ConsultingController {
	@Autowired
	ConsultingService consultingService;
	
	@RequestMapping(value = "companyConSultingList.do", method = RequestMethod.GET)
	public String companyConsultingList(Model model) {
		model.addAttribute("consultingList", consultingService.getConsultingList());
		return "company/companyConSultingList";
	}
	
	@RequestMapping(value = "companyConSultingDetail.do/{id}", method = RequestMethod.GET)
	public String companyConSultingDetail(@PathVariable("id") String id, Model model) {
		ConsultingVO vo = new ConsultingVO();
		vo.setConsultingId(id);
		model.addAttribute("consulting", consultingService.getConsulting(vo));
		return "company/companyConSultingDetail";
	}
	
	@RequestMapping(value = "companyConsultingInsert.do", method = RequestMethod.GET)
	public String companyConsultingInsertForm() {
		return "company/companyConsultingInsert";
	}
	
	@RequestMapping(value = "companyConsultingInsert.do", method = RequestMethod.POST)
	public String companyConsultingInsert(ConsultingVO vo) {
		vo.setConsultingId("상담" + System.currentTimeMillis());
		consultingService.insertConsulting(vo);
		return "redirect:companyConSultingList.do";
	}
	
	@RequestMapping(value = "companyConSultingUpdate.do/{id}", method = RequestMethod.GET)
	public String companyConsultingUpdateForm(@PathVariable("id") String id, Model model) {
		ConsultingVO vo = new ConsultingVO();
		vo.setConsultingId(id);
		model.addAttribute("consulting", consultingService.getConsulting(vo));
		return "company/companyConSultingUpdate";
	}
	
	@RequestMapping(value = "companyConSultingUpdate.do", method = RequestMethod.POST)
	public String companyConsultingUpdate(ConsultingVO vo) {
		consultingService.updateConsulting(vo);
		return "redirect:companyConSultingList.do";
	}
	
	// 2019.07.03 컨설팅의 경우
	// 기업에서도 접근이 가능 하고 매니저에서도 접근이 가능함.
	// 현재 로그인 된 유저가 기업인지 매니저인지 체크 할수 있으면
	// 하나의 메서드로 기업화면과 매니저 화면으로 각각 관리 할수 있음.
	@RequestMapping(value = "companyConSultingDelete.do/{id}", method = RequestMethod.GET)
	public String companyConsultingDelete(@PathVariable("id") String id) {
		ConsultingVO vo = new ConsultingVO();
		vo.setConsultingId(id);
		consultingService.deleteConsulting(vo);
		return "redirect:${pageContext.request.contextPath}/companyConSultingList.do";
	}
}
