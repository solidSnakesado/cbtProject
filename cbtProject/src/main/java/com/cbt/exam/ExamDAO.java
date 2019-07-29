package com.cbt.exam;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.company.CompanyVO;
import com.cbt.consulting.ConsultingVO;
import com.cbt.manager.ManagerVO;

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
	public List<ExamVO> getExamList(CompanyVO vo) {
		if(vo == null) {
			return mybatis.selectList("ExamDAO.getExamList");
		} else {
			return mybatis.selectList("ExamDAO.getExamList", vo);
		}
	}
	
	// temp (7/22, june) --> 삭제예정
	public List<ExamVO> getExamSurveyList(ManagerVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ExamDAO.getExamSurveyList", vo);
	}

	public List<ExamVO> mainExamList(ExamVO vo) {
		return mybatis.selectList("ExamDAO.mainExamList", vo);
	}
	
	
	
}
