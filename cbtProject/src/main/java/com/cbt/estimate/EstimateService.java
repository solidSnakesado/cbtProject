package com.cbt.estimate;

import java.util.List;

public interface EstimateService {
	
	void insertEstimate(EstimateVO vo);
	
	void updateEstimate(EstimateVO vo);
	
	void deleteEstimate(EstimateVO vo);
	
	EstimateVO getEstimate(EstimateVO vo);
	
	List<EstimateVO> getEstimateList(EstimateVO vo);

}
