package com.cbt.takeExam;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TakeExamDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertTakeExam(TakeExamVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateTakeExam(TakeExamVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteTakeExam(TakeExamVO vo) {
		
		mybatis.delete("", vo);
	}
	
	public TakeExamVO getTakeExam(TakeExamVO vo) {
		
		return mybatis.selectOne("", vo);
	}

}
