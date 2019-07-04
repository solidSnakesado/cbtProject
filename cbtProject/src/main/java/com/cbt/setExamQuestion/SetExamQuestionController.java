package com.cbt.setExamQuestion;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;

//  7/2 출제 컨트롤러 생성     -재용
@Controller
public class SetExamQuestionController {

	@Autowired
	SetExamQuestionService setExamQuestionService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> conditionMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("examId", "examId");
		map.put("questionId", "questionId");
		map.put("setExamQuestionId", "setExamQuestionId");
		map.put("point", "point");
		return map;
	}

	//등록폼
	@RequestMapping(value = "insertSetExamQuestion.do", method = RequestMethod.GET)
	public String insertSetExamQuestionForm() {
		return "candidate/SetExamQuestionInsert";
	} 
	// 등록처리
	@RequestMapping(value = "insertSetExamQuestion.do", method = RequestMethod.POST)
	public String insertSetExamQuestion() {
		return "candidate/SetExamQuestionList";
	}
	@RequestMapping("/SetExamQuestionList.do")
	public ModelAndView SetExamQuestionList(ModelAndView mv) {
		SetExamQuestionVO vo = new SetExamQuestionVO();

		mv.addObject("result", setExamQuestionService.SetExamQuestionList(vo));
		mv.setViewName("candidate/SetExamQuestionList");
		return mv;
	}
	
}
