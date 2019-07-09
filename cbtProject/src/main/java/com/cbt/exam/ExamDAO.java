package com.cbt.exam;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExamDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertExam(ExamVO vo) {
		mybatis.insert("ExamDAO.insertExam", vo);
	}
	
	public void updateExam(ExamVO vo) {
		mybatis.update("ExamDAO.updateExam", vo);
	}
	
	public void deleteExam(ExamVO vo) {
		mybatis.delete("ExamDAO.deleteExam", vo);
	}
	
	public ExamVO getExam(ExamVO vo) {
		return mybatis.selectOne("ExamDAO.getExam", vo);
	}
	
	// 2019.07.08 성재민
	// 시험 리스트를 가져오는 메소드
	public List<ExamVO> getExamList(ExamVO vo) {
		if(vo == null) {
			return mybatis.selectList("ExamDAO.getExamList");
		} else {
			return mybatis.selectList("ExamDAO.getExamList", vo);
		}
	}
}
