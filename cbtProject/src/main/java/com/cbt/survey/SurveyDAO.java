package com.cbt.survey;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertSurvey(SurveyVO vo) {
		
		mybatis.insert("", vo);
	}
	
	public void updateSurvey(SurveyVO vo) {
		
		mybatis.update("", vo);
	}

	public void deleteSurvey(SurveyVO vo) {
		
		mybatis.delete("", vo);
	}
	
	public SurveyVO getSurvey(SurveyVO vo) {
		
		return mybatis.selectOne("", vo);
	}
	
}
