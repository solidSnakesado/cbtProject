package com.cbt.setExamQuestion;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SetExamQuestionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertSetExamQuestion(SetExamQuestionVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateSetExamQuestion(SetExamQuestionVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteSetExamQuestion(SetExamQuestionVO vo) {
		
		mybatis.delete("", vo);
	}
	
	

}
