package com.cbt.condition;

public interface ConditionService {

	void insertCondition(ConditionVO vo);
	
	void updateCondition(ConditionVO vo);
	
	void deleteCondition(ConditionVO vo);
	
	ConditionVO getCondition(ConditionVO vo);
	
}
