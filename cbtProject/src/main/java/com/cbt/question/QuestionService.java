package com.cbt.question;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.cbt.common.Paging;
import com.cbt.takeExam.TakeExamVO;


//  7/2 문제 서비스 작성    -재용
public interface QuestionService {
	
	void insertQuestion(QuestionVO vo);
	
	void insertQuestionList(List<QuestionVO> vo);
	
	void insertTakeExamHistory(QuestionVO vo);
	
	void updateTakeExamHistory(QuestionVO vo);
	
	void deleteQuestion(QuestionVO vo);
	
	void rightAnswer(int tId);
	
	void rightLastAnswer(QuestionVO vo);
	
	int takeExamScoreNullCheck(QuestionVO vo);
	
	int getSetCount(QuestionVO vo);
	
	int getTakeCount(QuestionVO vo);
	
	int getHistoryCount(QuestionVO vo);
	
	QuestionVO candidateTestResult(QuestionVO vo);
	
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
	
	public List<QuestionVO> uploadExcelFile(MultipartFile excelFile);
	
	QuestionVO selectExamName(int examId);

}
