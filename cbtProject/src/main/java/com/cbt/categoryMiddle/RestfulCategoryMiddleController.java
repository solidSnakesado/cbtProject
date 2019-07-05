package com.cbt.categoryMiddle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestfulCategoryMiddleController {
	@Autowired
	CategoryMiddleService categoryMiddleService;
	
	// 대분류에 포함되는 중분류 전체 조회
	@RequestMapping(value = "getAllCategoryMiddleList.do/{mainIdx}", method = RequestMethod.POST)
	public List<CategoryMiddleVO> getAllCategoryMiddleList(@PathVariable("mainIdx") int mainId) {
		CategoryMiddleVO vo = new CategoryMiddleVO();
		vo.setCategoryMainId(mainId);
		return categoryMiddleService.getCategoryMiddleList(vo);
	}
}
