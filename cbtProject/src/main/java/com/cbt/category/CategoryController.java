package com.cbt.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 2019.07.04 성재민
// 카테고리 컨트롤러 연결
@Controller
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = "categoryMain.do", method = RequestMethod.GET)
	public String categoryMain(Model model) {
		model.addAttribute("categoryList", categoryService.getAllCategory());
		return "category/categoryMain";
	}
	
	@RequestMapping(value = "insertCategory.do", method = RequestMethod.GET)
	public String insertCategoryForm() {
		return "category/insertCategory";
	}
	
	@RequestMapping(value = "insertCategory.do", method = RequestMethod.POST)
	public String insertCategory(CategoryVO vo) {
		categoryService.insertCategory(vo);
		return "redirect:categoryMain.do";
	}
	
	@RequestMapping(value = "deleteCategory.do/{categoryId}", method = RequestMethod.POST)
	public String deleteCategory(@PathVariable("categoryId") int categoryId) {
		CategoryVO vo = new CategoryVO();
		vo.setCategoryId(categoryId);
		categoryService.deleteCategory(vo);
		
		return "redirect:categoryMain.do";
	}
}
