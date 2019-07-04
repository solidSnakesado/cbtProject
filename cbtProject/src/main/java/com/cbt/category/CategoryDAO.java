package com.cbt.category;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	//190703  재홍  mapper와 연결
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCategory(CategoryVO vo) {
		
		mybatis.insert("CategoryDAO.insertCategory", vo);
	}
	
	public void updateCategory(CategoryVO vo) {
		
		mybatis.update("CategoryDAO.updateCategory", vo);
	}

	public void deleteCategory(CategoryVO vo) {
		
		mybatis.delete("CategoryDAO.deleteCategory", vo);
	}
	
	public CategoryVO getCategory(CategoryVO vo) {
		
		return mybatis.selectOne("CategoryDAO.getCategory", vo);
	}
	
}
