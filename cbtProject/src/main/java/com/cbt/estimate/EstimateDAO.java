package com.cbt.estimate;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EstimateDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertEstimate(EstimateVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateEstimate(EstimateVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteEstimate(EstimateVO vo) {
		
		mybatis.delete("", vo);
	}
	
	public EstimateVO getEstimate(EstimateVO vo) {
		
		return mybatis.selectOne("", vo);
	}

}
