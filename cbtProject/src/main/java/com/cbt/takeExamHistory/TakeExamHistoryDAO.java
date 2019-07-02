package com.cbt.takeExamHistory;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TakeExamHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertTakeExamHistory(TakeExamHistoryVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateTakeExamHistory(TakeExamHistoryVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteTakeExamHistory(TakeExamHistoryVO vo) {
		
		mybatis.delete("", vo);
	}

}
