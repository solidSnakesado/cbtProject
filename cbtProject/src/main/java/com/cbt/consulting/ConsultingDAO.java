package com.cbt.consulting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConsultingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertConsulting(ConsultingVO vo) {
		mybatis.insert("consultingDAO.insertConsulting", vo);
	}
	
	public void updateConsulting(ConsultingVO vo) {
		mybatis.update("consultingDAO.updateConsulting", vo);
	}
	
	public void deleteConsulting(ConsultingVO vo) {
		mybatis.delete("consultingDAO.deleteConsulting", vo);
	}
	
	public ConsultingVO getConsulting(ConsultingVO vo) {
		
		return mybatis.selectOne("consultingDAO.getConsulting", vo);
	}
	
	public List<ConsultingVO> getConsultingList(ConsultingVO vo) {
		if(vo == null) {
			return mybatis.selectList("consultingDAO.getConsultingList");
		} else {
			return mybatis.selectList("consultingDAO.getConsultingList", vo);
		}
	}
	
	public int getConsultingCount(ConsultingVO vo) {
		return mybatis.selectOne("consultingDAO.getConsultingCount", vo);
	}
}
