package com.cbt.takeExam;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class TakeExamServiceImpl implements TakeExamService {

	@Resource
	TakeExamDAO dao;
	public TakeExamServiceImpl() {
	}
	
	public void insertTakeExam(TakeExamVO vo) {
		
		dao.insertTakeExam(vo);
	}

	public void updateTakeExam(TakeExamVO vo) {
		
		dao.updateTakeExam(vo);
	}

	public void deleteTakeExam(TakeExamVO vo) {
		
		dao.deleteTakeExam(vo);
	}

	public TakeExamVO getTakeExam(TakeExamVO vo) {
		
		return dao.getTakeExam(vo);
	}

}
