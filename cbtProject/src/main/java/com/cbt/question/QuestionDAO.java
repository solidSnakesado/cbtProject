package com.cbt.question;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


//    7/2 문제 DAO 작성    -재용

@Repository
public class QuestionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertQuestion(QuestionVO vo) {
		mybatis.insert("", vo);
	}
	
	public void updateQuestion(QuestionVO vo) {
		mybatis.update("", vo);
	}
	
	public void deleteQuestion(QuestionVO vo) {
		mybatis.delete("", vo);
	}
	
	public QuestionVO getQuestion(QuestionVO vo) {
		
		return mybatis.selectOne("", vo);
	}
	
	public List<Map<String, Object>> getTestList(Map<String, Object> vo){
		System.out.println("go");
		return mybatis.selectList("QuestionDAO.getTestList", vo);
	}
	

}
