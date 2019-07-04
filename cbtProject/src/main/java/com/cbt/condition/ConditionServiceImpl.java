package com.cbt.condition;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.common.Paging;

@Service("conditionService")
public class ConditionServiceImpl implements ConditionService {

	@Resource
	ConditionDAO dao;
	
	public ConditionServiceImpl() {
	}
	
	public void insertCondition(ConditionVO vo) {
		
		dao.insertCondition(vo);
	}

	public void updateCondition(ConditionVO vo) {
		
		dao.updateCondition(vo);
	}

	public void deleteCondition(ConditionVO vo) {
		
		dao.deleteCondition(vo);
	}

	public ConditionVO getCondition(ConditionVO vo) {

		return dao.getCondition(vo);
	}

	@Override
	public Map<String, Object> getConditionList(ConditionVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("conditionList", dao.getConditionList(vo));
		return null;
	}

}
