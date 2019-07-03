package com.cbt.setExamQuestion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//  7/2 출제 컨트롤러 생성     -재용
@Controller
public class SetExamQuestionController {
	
	@Autowired
	SetExamQuestionService setExamService;
	
	//update
	@RequestMapping("updateSetExam.do")
	public String updateupdateSetExam() {
		return "";
	}
	
}
