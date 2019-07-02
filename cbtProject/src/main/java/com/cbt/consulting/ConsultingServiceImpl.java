package com.cbt.consulting;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ConsultingServiceImpl implements ConsultingService {
	
	@Resource
	ConsultingDAO dao;
	
	@Override
	public void insertConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ConsultingVO getConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
