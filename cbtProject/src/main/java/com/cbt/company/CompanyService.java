package com.cbt.company;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface CompanyService {
	// 글 등록
	void insertCompany(CompanyVO vo);

	// 글 수정
	void updateCompany(CompanyVO vo);

	// 글 삭제
	void deleteCompany(CompanyVO vo);

	// 글 상세 조회
	CompanyVO getCompany(CompanyVO vo);
	
	// 로그인
	CompanyVO loginCompany(CompanyVO vo);

	// 글 목록 조회 --이승환이 쓰고있음
	List<CompanyVO> getCompanyList(CompanyVO vo);

	public Map<String, Object> getCompanyList(CompanyVO vo, Paging paging);
}