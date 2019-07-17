package com.cbt.question;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.takeExam.TakeExamVO;


//    7/2 문제 DAO 작성    -재용

@Repository
public class QuestionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertQuestion(QuestionVO vo) {
		mybatis.insert("QuestionDAO.insertQuestion", vo);
	}
	
	public void insertTakeExamHistory(QuestionVO vo) {
		mybatis.insert("QuestionDAO.insertTakeExamHistory", vo);
	}
	
	public void updateTakeExamHistory(QuestionVO vo) {
		mybatis.update("QuestionDAO.updateTakeExamHistory", vo);
	}
	
	public void deleteQuestion(QuestionVO vo) {
		mybatis.delete("", vo);
	}
	
	public QuestionVO getQuestion(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getQuestion", vo);
	}
	
	public List<Map<String, Object>> getTestList(Map<String, Object> map){
		return mybatis.selectOne("QuestionDAO.getTestList", map);
	}
	
	public QuestionVO candidateTestResult(QuestionVO vo) {
		return mybatis.selectOne("QuestionDAO.candidateTestResult", vo);
	}
	
	public QuestionVO getTestResultList(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getTestResultList", vo);
	}
	
	public List<QuestionVO> candidateRightAnswerList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateRightAnswerList", vo);
	}
	
	public List<QuestionVO> candidateTakeExamList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateTakeExamList", vo);
	}
	
	public List<QuestionVO> getTestStart(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateTestResult", vo);
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
	
	public List<QuestionVO> candidateExaminationList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateExaminationList", vo);
	}
	
	public QuestionVO candidateExaminationListDetail(QuestionVO vo) {
		return mybatis.selectOne("QuestionDAO.candidateExaminationListDetail", vo);
	}
	
	public void rightAnswer(int tId) {
		mybatis.update("QuestionDAO.rightAnswer", tId);
	}
	
	public int takeExamScoreNullCheck(QuestionVO vo) {
		return mybatis.selectOne("QuestionDAO.takeExamScoreNullCheck", vo);
	}
	
	public void rightLastAnswer(QuestionVO vo) {
		mybatis.update("QuestionDAO.rightLastAnswer", vo);
	}
	
	public List<QuestionVO> candidateExamList(){
		return mybatis.selectList("QuestionDAO.candidateExamList");
	}
	
	public void insertQuestionList(List<QuestionVO> vo) {
		mybatis.insert("QuestionDAO.insertQuestion", vo);
	}
	
	public QuestionVO selectExamName(int examId) {
		QuestionVO vo = mybatis.selectOne("QuestionDAO.selectExamName", examId);
		return vo;
	}
	
}
