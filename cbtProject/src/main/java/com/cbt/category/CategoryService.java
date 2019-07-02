package com.cbt.category;

public interface CategoryService {
	
	void insertCategory(CategoryVO vo);
	
	void updateCategory(CategoryVO vo);
	
	void deleteCategory(CategoryVO vo);
	
	CategoryVO getCategory(CategoryVO vo);

}
