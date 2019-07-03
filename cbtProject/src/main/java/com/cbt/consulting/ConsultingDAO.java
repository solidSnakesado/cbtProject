package com.cbt.consulting;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConsultingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertConsulting(ConsultingVO vo) {
		mybatis.insert("", vo);
	}
	
	public void updateConsulting(ConsultingVO vo) {
		mybatis.insert("", vo);
	}
	
	public void deleteConsulting(ConsultingVO vo) {
		mybatis.insert("", vo);
	}
}
