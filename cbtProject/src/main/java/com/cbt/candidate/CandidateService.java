package com.cbt.candidate;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface CandidateService {
	// 글 등록
	void insertCandidate(CandidateVO vo);

	// 글 수정
	void updateCandidate(CandidateVO vo);

	// 글 삭제
	void deleteCandidate(CandidateVO vo);

	// 글 상세 조회
	CandidateVO getCandidate(CandidateVO vo);

	// 글 목록 조회
	List<CandidateVO> getCandidateList(CandidateVO vo);

	public Map<String, Object> getCandidateList(CandidateVO vo, Paging paging);
}
