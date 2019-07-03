package com.cbt.survey;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO {
	//190703  재홍  mapper와 연결
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertSurvey(SurveyVO vo) {
		
		mybatis.insert("SurveyDAO.insertSurvey", vo);
	}
	
	public void updateSurvey(SurveyVO vo) {
		
		mybatis.update("SurveyDAO.updateSurvey", vo);
	}

	public void deleteSurvey(SurveyVO vo) {
		
		mybatis.delete("SurveyDAO.deleteSurvey", vo);
	}
	
	public SurveyVO getSurvey(SurveyVO vo) {
		
		return mybatis.selectOne("SurveyDAO.getSurveyID", vo);
	}
	
}
