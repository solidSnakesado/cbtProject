package com.cbt.takeExam;

public interface TakeExamService {
	
	void insertTakeExam(TakeExamVO vo);
	
	void updateTakeExam(TakeExamVO vo);
	
	void deleteTakeExam(TakeExamVO vo);
	
	TakeExamVO getTakeExam(TakeExamVO vo);

}
