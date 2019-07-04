package com.cbt.candidate;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;

@Service("candidateService")
public class CandidateServiceImpl implements CandidateService {

	@Resource
	private CandidateDAO candidateDAO;
	
	//2019.07.01 장세준 insert method 
	public void insertCandidate(CandidateVO vo) {
		candidateDAO.insertCandidate(vo);
	}

	public void updateCandidate(CandidateVO vo) {
		candidateDAO.updateCandidate(vo);
	}

	public void deleteCandidate(CandidateVO vo) {
		candidateDAO.deleteCandidate(vo);
	}

	public CandidateVO getCandidate(CandidateVO vo) {
		return candidateDAO.getCandidate(vo);
	}

	public Map<String, Object> getCandidateList(CandidateVO vo, Paging paging) {
		paging.setPageUnit(10);
		if(paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		
		paging.setTotalRecord(candidateDAO.getCount(vo));
		return null;
	}

	public CandidateVO loginCandidate(CandidateVO vo) {
		return candidateDAO.loginCandidate(vo);
	}

	public int idcheck(String takerId) {
		return candidateDAO.idcheck(takerId);
	}

	@Override
	public List<CandidateVO> getCandidateList(CandidateVO vo) {
		return candidateDAO.getCandidateList(vo);
	}

	@Override
	public List<CompanyVO> getCompanyList(CandidateVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
