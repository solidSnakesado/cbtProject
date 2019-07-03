package com.cbt.consulting;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ConsultingServiceImpl implements ConsultingService {
	
	@Resource
	ConsultingDAO dao;
	
	@Override
	public void insertConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		dao.insertConsulting(vo);
	}

	@Override
	public void updateConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		dao.updateConsulting(vo);
	}

	@Override
	public void deleteConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		dao.deleteConsulting(vo);
	}

	@Override
	public ConsultingVO getConsulting(ConsultingVO vo) {
		// TODO Auto-generated method stub
		return dao.getConsulting(vo);
	}

	@Override
	public List<ConsultingVO> getConsultingList() {
		// TODO Auto-generated method stub
		return dao.getConsultingList();
	}
}
