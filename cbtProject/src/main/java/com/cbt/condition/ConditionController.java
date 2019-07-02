package com.cbt.condition;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConditionController {
	
	@Autowired
	ConditionService conditionService;
	
	//등록폼
	@RequestMapping("insertConditionForm.do")
	public String insertConditionForm() {
		return "condition/insertCondition";
	}
	
	//등록 처리
	@RequestMapping("insertCondition.do")
	public String insertCondition(ConditionVO vo) {
		return "";
		
	}
}
