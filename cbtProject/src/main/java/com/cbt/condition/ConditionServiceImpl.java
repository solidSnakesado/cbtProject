package com.cbt.condition;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
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

}
