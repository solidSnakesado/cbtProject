package com.cbt.estimate;

import java.util.List;
import java.util.Map;

import com.cbt.category.CategoryVO;
import com.cbt.common.Paging;



public interface EstimateService {
	
	void insertEstimate(EstimateVO vo);
	
	void updateEstimate(EstimateVO vo);
	
	void deleteEstimate(EstimateVO vo);
	
	EstimateVO getEstimate(EstimateVO vo);
	
	List<EstimateVO> getEstimateList(EstimateVO vo);
	
	public Map<String, Object> getEstimateList(EstimateVO vo, Paging paging);
	
	int getCateoryId(EstimateVO vo);
	
	//카테고리 nameList를 가져오는 메서드
	List<EstimateVO> getCateoryNameList(CategoryVO vo);
	
	//////////////////////결제 상태/////////////////////////////
	//4.결제 대기 -> 5.결제 완료
	void updatesTradeProgressExchange5(EstimateVO vo);

}
