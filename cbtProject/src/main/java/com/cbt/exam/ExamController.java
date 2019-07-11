package com.cbt.exam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExamController {
	@Autowired
	ExamService examService;
	
	@RequestMapping(value = "companyExamList.do", method = RequestMethod.GET)
	public String companyExamList(ExamVO vo, Model model) {
		model.addAttribute("companyExamList", examService.getExamList(vo));
		return "company/company/companyExamList";
	}
	
	@RequestMapping(value = "companyExamListDetail.do/{examId}", method = RequestMethod.GET)
	public String companyExamListDetail(@PathVariable("examId") int examId, Model model) {
		ExamVO vo = new ExamVO();
		vo.setExamId(examId);
		model.addAttribute("selectedExam", examService.getExam(vo));
		
		return "company/company/companyExamListDetail";
	}
	
	@RequestMapping(value = "companyExamListDetailGraph.do", method = RequestMethod.GET)
	public String companyExamListDetailGraph() {
		return "company/company/companyExamListDetailGraph";
	}
}
