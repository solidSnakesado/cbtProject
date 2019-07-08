package com.cbt.category;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Resource
	CategoryDAO dao;

	@Override
	public void insertCategory(CategoryVO vo) {
		dao.insertCategory(vo);
	}
	
	@Override
	public void updateCategory(CategoryVO vo) {
		dao.updateCategory(vo);
	}
	
	@Override
	public void deleteCategory(CategoryVO vo) {
		dao.deleteCategory(vo);
	}
	
	@Override
	public CategoryVO getCategory(CategoryVO vo) {
		return dao.getCategory(vo);
	}

	@Override
	public List<CategoryVO> getAllCategory() {
		return dao.getAllCategory();
	}
}
