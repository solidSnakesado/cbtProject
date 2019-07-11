package com.cbt.consulting;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface ConsultingService {

	void insertConsulting(ConsultingVO vo);
	
	void updateConsulting(ConsultingVO vo);
	
	void deleteConsulting(ConsultingVO vo);
	
	ConsultingVO getConsulting(ConsultingVO vo);
	
	List<ConsultingVO> getConsultingList(ConsultingVO vo);
	
	Map<String, Object> getConsultingList(ConsultingVO vo, Paging paging);
	
	int getConsultingCount();
}
