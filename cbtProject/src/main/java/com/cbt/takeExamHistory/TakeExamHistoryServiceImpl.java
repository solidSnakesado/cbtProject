package com.cbt.takeExamHistory;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class TakeExamHistoryServiceImpl implements TakeExamHistoryService {

	@Resource
	TakeExamHistoryDAO dao;
	
	public TakeExamHistoryServiceImpl() {
		
	}
	
	public void insertTakeExamHistory(TakeExamHistoryVO vo) {
		
	}

	public void updateTakeExamHistory(TakeExamHistoryVO vo) {
		
	}

	public void deleteTakeExamHistory(TakeExamHistoryVO vo) {
		
	}

	public TakeExamHistoryVO getTakeExamHistory(TakeExamHistoryVO vo) {
		return null;
	}

}
