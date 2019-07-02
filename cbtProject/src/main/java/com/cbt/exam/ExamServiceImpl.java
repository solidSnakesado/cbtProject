package com.cbt.exam;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ExamServiceImpl implements ExamService {

	@Resource
	ExamDAO dao;
	
	public void insertExam(ExamVO vo) {
		
		dao.insertExam(vo);
	}

	public void updateExam(ExamVO vo) {
		
		dao.updateExam(vo);
	}

	public void deleteExam(ExamVO vo) {
		
		dao.deleteExam(vo);
	}

	public ExamVO getExam(ExamVO vo) {
		
		return dao.getExam(vo);
	}

}
