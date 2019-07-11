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
		
		mybatis.update("setExamQuestionDAO.updateSetExamQuestion", vo);
	}
	
	public void deleteSetExamQuestion(SetExamQuestionVO vo) {
		
		mybatis.delete("setExamQuestionDAO.deleteSetExamQuestion", vo);
	}
	
	public SetExamQuestionVO getSetExamQuestion(SetExamQuestionVO vo) {
		return mybatis.selectOne("setExamQuestionDAO.getSetExamQuestion", vo);
	}
	
	// 2019.07.09 성재민
	// 전달인자가 값이 있다면 조건에 해당하는 여러건의 결과를
	// 전달인자가 값이 없다면 모든 결과를 가져온다.
	public List<SetExamQuestionVO> getSetExamQuestionList(SetExamQuestionVO vo){
		if(vo != null) {
			return mybatis.selectList("setExamQuestionDAO.getSetExamQuestionList",vo);
		} else {
			return mybatis.selectList("setExamQuestionDAO.getSetExamQuestionList");
		}
	}
}
