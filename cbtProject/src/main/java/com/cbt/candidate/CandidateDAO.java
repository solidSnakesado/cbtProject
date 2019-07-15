package com.cbt.candidate;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.common.Paging;


@Repository
public class CandidateDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//2019.07.01 장세준 - insert
	public void insertCandidate(CandidateVO vo) {
		mybatis.insert("candidateDAO.insertCandidate", vo);
	}

	public void updateCandidate(CandidateVO vo) {
		mybatis.update("candidateDAO.updateCandidate", vo);
	}

	public void deleteCandidate(CandidateVO vo) {
		mybatis.delete("candidateDAO.deleteCandidate", vo);
	}

	// 2019.07.09
	// 시험정보 가져옴
	public List<Map<String, String>> getExamList(CandidateVO vo) {
		return mybatis.selectList("candidateDAO.getExamList", vo);
	}	
	
	public CandidateVO loginCandidate(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.candidateLogin", vo);
	}
	
	public int getCount(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getCandidate", vo);
	}

	public int idcheck(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.idcheck",vo);
	}
	
	// 2019.07.09
	public CandidateVO getCandidate(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getCandidate", vo);
	}
	
	// 이승환이 쓰고있음
	public List<CandidateVO> getCandidateList(CandidateVO vo) {
		return mybatis.selectList("candidateDAO.getCandidateList", vo);
	}
	public int getCount() {
		return mybatis.selectOne("candidateDAO.getCount");
	}
	
	// 전체 시험 스케쥴 가져옴
	public List<Map<Object, String>> candidateScheduleCheck() {
		
		return mybatis.selectList("candidateDAO.candidateScheduleCheck");
	}

	
	
	
	// TEMP

	public List<Map<Object, Object>> candidateScheduleCheckPage(CandidateVO vo){
		return mybatis.selectList("candidateDAO.candidateScheduleCheckPage", vo);
	}

	public int examCount() {
		return mybatis.selectOne("candidateDAO.examCount");
	}
	
}
