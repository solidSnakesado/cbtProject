package com.cbt.exam;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExamDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertExam(ExamVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateExam(ExamVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteExam(ExamVO vo) {
		
		mybatis.delete("", vo);
	}
	
	public ExamVO getExam(ExamVO vo) {
		
		return mybatis.selectOne("", vo);
	}
	
}
