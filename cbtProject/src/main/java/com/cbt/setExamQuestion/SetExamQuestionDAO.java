package com.cbt.setExamQuestion;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SetExamQuestionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertSetExamQuestion(SetExamQuestionVO vo) {
		
		mybatis.insert("setExamQuestionDAO.insertSetExamQuestion", vo);
	}
	
	public void updateSetExamQuestion(SetExamQuestionVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteSetExamQuestion(SetExamQuestionVO vo) {
		
		mybatis.delete("", vo);
	}
	
	public SetExamQuestionVO getBoard(SetExamQuestionVO vo) {
		return mybatis.selectOne("setExamQuestionDAO.get..", vo);
	}
	
	public List<SetExamQuestionVO> SetExamQuestionList(SetExamQuestionVO vo){
		return mybatis.selectList("setExamQuestionDAO.getSetExamQuestionList",vo);
	}
}
