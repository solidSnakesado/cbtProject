package com.cbt.estimate;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class EstimateServiceImpl implements EstimateService {

	@Resource
	EstimateDAO dao;
	@Override
	public void insertEstimate(EstimateVO vo) {
		
		dao.insertEstimate(vo);
	}
	@Override
	public void updateEstimate(EstimateVO vo) {
		
		dao.updateEstimate(vo);
	}
	@Override
	public void deleteEstimate(EstimateVO vo) {
		
		dao.deleteEstimate(vo);
	}
	@Override
	public EstimateVO getEstimate(EstimateVO vo) {
		
		return dao.getEstimate(vo);
	}

	@Override
	public List<EstimateVO> getEstimateList(EstimateVO vo) {
		return dao.getEstimateList(vo);
	}

	

}
