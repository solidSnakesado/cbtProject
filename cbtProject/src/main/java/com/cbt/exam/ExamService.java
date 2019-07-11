package com.cbt.exam;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface ExamService {
	
	void insertExam(ExamVO vo);
	
	void updateExam(ExamVO vo);
	
	void deleteExam(ExamVO vo);
	
	ExamVO getExam(ExamVO vo);

	List<ExamVO> getExamList(ExamVO vo);
	
	Map<String, Object> getExamList(ExamVO vo, Paging paging);
	
	int getExamCount();
	
}
