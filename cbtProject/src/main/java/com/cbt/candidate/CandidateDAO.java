package com.cbt.candidate;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CandidateDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCandidate(CandidateVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public void updateCandidate(CandidateVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public void deleteCandidate(CandidateVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public CandidateVO getCandidate(CandidateVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<CandidateVO> getCandidateList(CandidateVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
