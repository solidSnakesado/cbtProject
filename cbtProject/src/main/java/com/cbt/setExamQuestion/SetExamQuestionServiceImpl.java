package com.cbt.setExamQuestion;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class SetExamQuestionServiceImpl implements SetExamQuestionService {
	
	@Resource
	SetExamQuestionDAO dao;
	
	public SetExamQuestionServiceImpl() {
	}
	
	public void insertSetExamQuestion(SetExamQuestionVO vo) {
		
		dao.insertSetExamQuestion(vo);
	}

	public void updateSetExamQuestion(SetExamQuestionVO vo) {

		dao.updateSetExamQuestion(vo);
	}

	public void deleteSetExamQuestion(SetExamQuestionVO vo) {
		
		dao.deleteSetExamQuestion(vo);
	}

	public SetExamQuestionVO getSetExamQuestion(SetExamQuestionVO vo) {
		
		return null;
	}

}
