package com.cbt.candidate;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbt.common.Paging;

@Service
public class CandidateServiceImpl implements CandidateService {

	@Autowired
	CandidateDAO candidateDAO;
	
	//2019.07.01 장세준 insert method 
	@Override
	public void insertCandidate(CandidateVO vo) {
		candidateDAO.insertCandidate(vo);
	}

	@Override
	public void updateCandidate(CandidateVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCandidate(CandidateVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CandidateVO getCandidate(CandidateVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CandidateVO> getCandidateList(CandidateVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getCandidateList(CandidateVO vo, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

}
