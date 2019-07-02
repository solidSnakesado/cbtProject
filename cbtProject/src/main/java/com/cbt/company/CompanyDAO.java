package com.cbt.company;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.candidate.CandidateVO;

@Repository
public class CompanyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertCompany(CompanyVO vo) {
		System.out.println("insertCompany()");
		mybatis.insert("companyDAO.insertCompany", vo);
	}

	public void updateCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public void deleteCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public CompanyVO getCompany(CompanyVO vo) {
		mybatis.selectOne("", vo);
		return null;
	}
	
	public CompanyVO loginCompany(CompanyVO vo) {
		CompanyVO loginCompany = mybatis.selectOne("companyDAO.getCompany", vo);
		return loginCompany;
	}

	public List<CompanyVO> getCompanyList(CompanyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
