package com.cbt.candidate;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;
import com.cbt.takeExam.TakeExamVOt;

public interface CandidateService {
	// 글 등록
	void insertCandidate(CandidateVO vo);

	// 글 수정
	void updateCandidate(CandidateVO vo);

	// 글 삭제
	void deleteCandidate(CandidateVO vo);

	// 글 상세 조회
	CandidateVO getCandidate(CandidateVO vo);

	// 로그인
	CandidateVO loginCandidate(CandidateVO vo);
	
	// 응시자 정보 가져올 리스트 -- 이승환
	List<CandidateVO> getCandidateList(CandidateVO vo);
	
	// 2019.07.09
	// 시험정보
	List<Map<String, String>> getExamList(CandidateVO vo);

	public Map<String, Object> getCandidateList(CandidateVO vo, Paging paging);

	int idcheck(String takerId);
}
