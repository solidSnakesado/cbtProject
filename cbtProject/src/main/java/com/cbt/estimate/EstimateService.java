package com.cbt.estimate;

public interface EstimateService {
	
	void insertEstimate(EstimateVO vo);
	
	void updateEstimate(EstimateVO vo);
	
	void deleteEstimate(EstimateVO vo);
	
	EstimateVO getEstimate(EstimateVO vo);

}
