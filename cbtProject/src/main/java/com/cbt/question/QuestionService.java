package com.cbt.question;

import java.util.List;
import java.util.Map;

import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;


//  7/2 문제 서비스 작성    -재용
public interface QuestionService {
	
	void insertTakeExamHistory(QuestionVO vo);
	
	void updateTakeExamHistory(QuestionVO vo);
	
	void deleteQuestion(QuestionVO vo);
	
	void rightAnswer(QuestionVO vo);
	
	int getSetCount(QuestionVO vo);
	
	int getTakeCount(QuestionVO vo);
	
	int getHistoryCount(QuestionVO vo);
	
	List<Map<Object, String>> getTestStart(QuestionVO vo);
	
	List<QuestionVO> candidateTakeExamList(QuestionVO vo);
	
	List<QuestionVO> candidateExamList();
	
	List<QuestionVO> candidateRightAnswerList(QuestionVO vo);
	
	QuestionVO getTestResultList(QuestionVO vo);
	
	List<Map<String, Object>> getTestList(Map<String, Object> map);
	
	QuestionVO getQuestion(QuestionVO vo);
	
	Map<String, Object> getQuestionList(QuestionVO vo, Paging paging);
	
	List<QuestionVO> candidateExaminationList(QuestionVO vo);
	
	QuestionVO candidateExaminationListDetail(QuestionVO vo);
	
	void getExcelUpload(String excelFile);

}
