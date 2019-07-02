package com.cbt.condition;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConditionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCondition(ConditionVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateCondition(ConditionVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteCondition(ConditionVO vo) {
		
		mybatis.delete("", vo);
	}
	
	public ConditionVO getCondition(ConditionVO vo) {
		
		return mybatis.selectOne("", vo);
	}

}
