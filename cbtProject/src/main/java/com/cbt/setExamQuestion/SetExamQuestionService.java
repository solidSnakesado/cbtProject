package com.cbt.setExamQuestion;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;
import com.cbt.exam.ExamVO;

public interface SetExamQuestionService {
	
	void insertSetExamQuestion(SetExamQuestionVO vo);
	
	void updateSetExamQuestion(SetExamQuestionVO vo);
	
	void deleteSetExamQuestion(SetExamQuestionVO vo);
	
	SetExamQuestionVO getSetExamQuestion(SetExamQuestionVO vo);
	
	List<SetExamQuestionVO> SetExamQuestionList(SetExamQuestionVO vo);

	// 2019.07.11 성재민
	// 문제를 가져오는 메소드 지정
	List<Map<String, String>> getQuestionList(ExamVO vo);
}
