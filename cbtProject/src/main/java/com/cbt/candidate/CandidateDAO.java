package com.cbt.candidate;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public CandidateVO getCandidate(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getCandidate", vo);
	}

	public List<CandidateVO> getCandidateList(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getCandidateList", vo);
	}
	
	public CandidateVO loginCandidate(CandidateVO vo) {
		return getCandidate(vo);
	}
	
	public int getCount(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getCandidate", vo);
	}
}
