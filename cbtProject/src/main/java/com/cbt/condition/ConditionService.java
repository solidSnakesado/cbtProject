package com.cbt.condition;

import java.util.Map;

import com.cbt.common.Paging;

public interface ConditionService {

	// 상태 등록
	void insertCondition(ConditionVO vo);
	
	// 상태 수정
	void updateCondition(ConditionVO vo);
	
	// 상태 삭제
	void deleteCondition(ConditionVO vo);
	
	// 상태목록 조회
	ConditionVO getCondition(ConditionVO vo);
	
	public Map<String, Object> getConditionList(ConditionVO vo, Paging paging);
	
}
