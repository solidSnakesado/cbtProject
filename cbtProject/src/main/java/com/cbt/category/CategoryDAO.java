package com.cbt.category;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCategory(CategoryVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateCategory(CategoryVO vo) {
		
		mybatis.update("", vo);
	}

	public void deleteCategory(CategoryVO vo) {
		
		mybatis.delete("", vo);
	}
	
	public CategoryVO getCategory(CategoryVO vo) {
		
		return mybatis.selectOne("", vo);
	}
	
}
