package com.cbt.estimate;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class EstimateServiceImpl implements EstimateService {

	@Resource
	EstimateDAO dao;
	
	public void insertEstimate(EstimateVO vo) {
		
		dao.insertEstimate(vo);
	}

	public void updateEstimate(EstimateVO vo) {
		
		dao.updateEstimate(vo);
	}

	public void deleteEstimate(EstimateVO vo) {
		
		dao.deleteEstimate(vo);
	}

	public EstimateVO getEstimate(EstimateVO vo) {
		
		return dao.getEstimate(vo);
	}

}
