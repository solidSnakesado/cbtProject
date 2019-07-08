package com.cbt.category;

import java.util.List;

public interface CategoryService {
	
	void insertCategory(CategoryVO vo);
	
	void updateCategory(CategoryVO vo);
	
	void deleteCategory(CategoryVO vo);
	
	CategoryVO getCategory(CategoryVO vo);

	List<CategoryVO> getAllCategory();
}
