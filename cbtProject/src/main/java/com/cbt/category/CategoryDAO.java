package com.cbt.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	//190703  재홍  mapper와 연결
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCategory(CategoryVO vo) {
		mybatis.insert("categoryDAO.insertCategory", vo);
	}
	
	public void updateCategory(CategoryVO vo) {
		mybatis.update("categoryDAO.updateCategory", vo);
	}

	public void deleteCategory(CategoryVO vo) {
		mybatis.delete("categoryDAO.deleteCategory", vo);
	}
	
	public CategoryVO getCategory(CategoryVO vo) {
		return mybatis.selectOne("categoryDAO.getCategory", vo);
	}
	
	public List<CategoryVO> getAllCategory() {
		return mybatis.selectList("categoryDAO.getAllCategory");
	}
}
