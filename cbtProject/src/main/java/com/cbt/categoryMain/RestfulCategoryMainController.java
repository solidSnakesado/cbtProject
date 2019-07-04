package com.cbt.categoryMain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestfulCategoryMainController {
	@Autowired
	CategoryMainService categoryMainService;
	
	// 대분류 전체 조회
	@RequestMapping(value="getCategoryMain.do", method=RequestMethod.POST)
	public List<CategoryMainVO> getCategoryMainList() {
		return categoryMainService.getAllCategoryMain();
	}
}
