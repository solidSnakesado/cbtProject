package com.cbt.question;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;


//  7/2 문제 서비스 작성    -재용
public interface QuestionService {
	
	void insertQuestion(QuestionVO vo);
	
	void updateQuestion(QuestionVO vo);
	
	void deleteQuestion(QuestionVO vo);
	
	List<Map<String, Object>> getTestList();
	
	QuestionVO getQuestion(QuestionVO vo);
	
	Map<String, Object> getQuestionList(QuestionVO vo, Paging paging);
	
	

}
