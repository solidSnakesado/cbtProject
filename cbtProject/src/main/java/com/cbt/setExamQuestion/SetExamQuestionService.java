package com.cbt.setExamQuestion;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface SetExamQuestionService {
	
	void insertSetExamQuestion(SetExamQuestionVO vo);
	
	void updateSetExamQuestion(SetExamQuestionVO vo);
	
	void deleteSetExamQuestion(SetExamQuestionVO vo);
	
	SetExamQuestionVO getSetExamQuestion(SetExamQuestionVO vo);
	
	List<SetExamQuestionVO> SetExamQuestionList(SetExamQuestionVO vo);

}
