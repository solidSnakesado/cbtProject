package com.cbt.consulting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.common.Paging;

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
	public List<ConsultingVO> getConsultingList(ConsultingVO vo) {
		return dao.getConsultingList(vo);
	}

	@Override
	public int getConsultingCount() {
		return dao.getConsultingCount(null);
	}

	@Override
	public Map<String, Object> getConsultingList(ConsultingVO vo, Paging paging) {
		if(paging != null) {
			paging.setPageUnit(1);
			// 페이지 번호 파라미터
			if(paging.getPage() == null) {
				paging.setPage(1);
			}
			
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			
			paging.setTotalRecord(dao.getConsultingCount(vo));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("consultingList", dao.getConsultingList(vo));
			map.put("paging", paging);
			
			return map;
		}
		
		return null;
	}
}
