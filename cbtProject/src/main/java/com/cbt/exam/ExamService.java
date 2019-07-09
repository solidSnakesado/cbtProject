package com.cbt.exam;

import java.util.List;

public interface ExamService {
	
	void insertExam(ExamVO vo);
	
	void updateExam(ExamVO vo);
	
	void deleteExam(ExamVO vo);
	
	ExamVO getExam(ExamVO vo);

	List<ExamVO> getExamList(ExamVO vo);
}
