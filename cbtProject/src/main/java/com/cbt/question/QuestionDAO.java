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
	
	public void insertTakeExamHistory(QuestionVO vo) {
		System.out.println("insert");
		mybatis.insert("QuestionDAO.insertTakeExamHistory", vo);
	}
	
	public void updateTakeExamHistory(QuestionVO vo) {
		mybatis.update("QuestionDAO.updateTakeExamHistory", vo);
	}
	
	public void deleteQuestion(QuestionVO vo) {
		mybatis.delete("", vo);
	}
	
	public QuestionVO getQuestion(QuestionVO vo) {
		
		return mybatis.selectOne("", vo);
	}
	
	public List<Map<String, Object>> getTestList(Map<String, Object> map){
		System.out.println("3+go");
		
		
		return mybatis.selectOne("QuestionDAO.getTestList", map);
	}
	
	public QuestionVOt getTestResultList(QuestionVOt vo) {
		
		return mybatis.selectOne("QuestionDAO.getTestResultList", vo);
	}
	
	public List<QuestionVO> candidateRightAnswerList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateRightAnswerList", vo);
	}
	
	public List<QuestionVO> candidateTakeExamList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateTakeExamList", vo);
	}
	
	public List<QuestionVO> getTestStart(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateTakeExamList", vo);
	}
	
	public int getSetCount(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getSetCount", vo);
	}
	
	public int getTakeCount(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getTakeCount", vo);
	}
	
	public int getHistoryCount(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getHistoryCount", vo);
	}


}
