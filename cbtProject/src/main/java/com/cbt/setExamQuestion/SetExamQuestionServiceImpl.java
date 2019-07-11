package com.cbt.setExamQuestion;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.common.Paging;
import com.cbt.exam.ExamVO;

@Service("setExamService")
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
		
		return dao.getSetExamQuestion(vo);
	}

	public List<SetExamQuestionVO> SetExamQuestionList(SetExamQuestionVO vo) {
		return dao.getSetExamQuestionList(vo);
	}

	// 2019.07.11 성재민
	// 문제를 가져오는 메소드
	@Override
	public List<Map<String, String>> getQuestionList(ExamVO vo) {
		return dao.getQuestionList(vo);
	}
}
