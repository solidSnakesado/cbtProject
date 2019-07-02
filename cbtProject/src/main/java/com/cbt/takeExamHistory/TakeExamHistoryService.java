package com.cbt.takeExamHistory;


public interface TakeExamHistoryService {
	
	void insertTakeExamHistory(TakeExamHistoryVO vo);
	
	void updateTakeExamHistory(TakeExamHistoryVO vo);
	
	void deleteTakeExamHistory(TakeExamHistoryVO vo);
	
	TakeExamHistoryVO getTakeExamHistory(TakeExamHistoryVO vo);
	

}
