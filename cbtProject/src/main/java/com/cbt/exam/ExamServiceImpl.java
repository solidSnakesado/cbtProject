package com.cbt.exam;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	public List<ExamVO> getExamList(ExamVO vo) {
		return dao.getExamList(vo);
	}
}
