package com.cbt.setExamQuestion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cbt.company.CompanyVO;

//  7/2 출제 컨트롤러 생성     -재용
@Controller
public class SetExamQuestionController {

	@Autowired
	SetExamQuestionService setExamQuestionService;

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
}
