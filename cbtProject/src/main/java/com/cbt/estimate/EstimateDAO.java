package com.cbt.estimate;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EstimateDAO {
	//19 07 04 재홍 mybatis  "" 구문 연결
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertEstimate(EstimateVO vo) {
		
		mybatis.insert("EstimateDAO.insertEstimate", vo);
	}
	
	public void updateEstimate(EstimateVO vo) {
		
		mybatis.update("EstimateDAO.updateEstimate", vo);
	}
	
	public void deleteEstimate(EstimateVO vo) {
		
		mybatis.delete("EstimateDAO.deleteEstimate", vo);
	}
	
	public EstimateVO getEstimate(EstimateVO vo) {
		return mybatis.selectOne("EstimateDAO.getEstimate", vo);
	}
	
	public List<EstimateVO> getEstimateList(EstimateVO vo) {
		return mybatis.selectList("EstimateDAO.getEstimateList", vo);
	}

}
