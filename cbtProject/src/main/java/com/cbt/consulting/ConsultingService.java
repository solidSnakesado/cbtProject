package com.cbt.consulting;

import java.util.List;

public interface ConsultingService {

	void insertConsulting(ConsultingVO vo);
	
	void updateConsulting(ConsultingVO vo);
	
	void deleteConsulting(ConsultingVO vo);
	
	ConsultingVO getConsulting(ConsultingVO vo);
	
	List<ConsultingVO> getConsultingList();
}
