package com.cbt.estimate;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;



public interface EstimateService {
	
	void insertEstimate(EstimateVO vo);
	
	void updateEstimate(EstimateVO vo);
	
	void deleteEstimate(EstimateVO vo);
	
	EstimateVO getEstimate(EstimateVO vo);
	
	List<EstimateVO> getEstimateList(EstimateVO vo);
	
	public Map<String, Object> getEstimateList(EstimateVO vo, Paging paging);

}
