package com.cbt.exam;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.company.CompanyVO;
import com.cbt.consulting.ConsultingVO;
import com.cbt.manager.ManagerVO;

@Service
public class ExamServiceImpl implements ExamService {

	@Resource
	ExamDAO dao;
	
	@Override
	public void insertExam(ExamVO vo) {
		dao.insertExam(vo);
	}
	
	@Override
	public void updateExam(ExamVO vo) {
		dao.updateExam(vo);
	}
	
	@Override
	public void deleteExam(ExamVO vo) {
		dao.deleteExam(vo);
	}
	
	@Override
	public ExamVO getExam(ExamVO vo) {
		return dao.getExam(vo);
	}

	// 2019.07.08 성재민
	// 시험 리스트를 가져오는 메소드
	@Override
	public List<ExamVO> getExamList(CompanyVO vo) {
		return dao.getExamList(vo);
	}

	@Override
	public List<ExamVO> getExamList(ExamVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// temp(7/22) --> 삭제예정
	@Override
	public List<ExamVO> getExamSurveyList(ManagerVO vo) {
		return dao.getExamSurveyList(vo);
	}

	@Override
	public List<ExamVO> mainExamList(ExamVO vo) {
		return dao.mainExamList(vo);
	}

	// 2019.07.31 성재민
	// 완료된 시험 리스트를 가져오는 메소드
	// 현재는 테스트 구간이라 모든 값을 가져옴 수정 필요.
	@Override
	public List<ExamVO> getCompleteExamList(CompanyVO vo) {
		return dao.getCompleteExamList(vo);
	}
}
