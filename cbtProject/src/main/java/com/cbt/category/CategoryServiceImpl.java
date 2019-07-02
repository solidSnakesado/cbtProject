package com.cbt.category;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Resource
	CategoryDAO dao;
	
	public void insertCategory(CategoryVO vo) {
		
		dao.insertCategory(vo);
	}

	public void updateCategory(CategoryVO vo) {
		
		dao.updateCategory(vo);
	}

	public void deleteCategory(CategoryVO vo) {
		
		dao.deleteCategory(vo);
	}

	public CategoryVO getCategory(CategoryVO vo) {

		return dao.getCategory(vo);
	}

}
