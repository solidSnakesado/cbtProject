package com.cbt.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbt.common.Paging;
import com.cbt.manager.ManagerDAO;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyDAO companyDAO;
	
	@Override
	public void insertCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		companyDAO.insertCompany(vo);
	}

	@Override
	public void updateCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		companyDAO.updateCompany(vo);
	}

	@Override
	public void deleteCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		companyDAO.deleteCompany(vo);
	}

	@Override
	public CompanyVO getCompany(CompanyVO vo) {
		return companyDAO.getCompany(vo);
	}
	// 이승환이쓰고있음
	@Override
	public List<CompanyVO> getCompanyList(CompanyVO vo) {
		return companyDAO.getCompanyList(vo);
	}

	@Override
	public Map<String, Object> getCompanyList(CompanyVO vo, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CompanyVO loginCompany(CompanyVO vo) {
		return companyDAO.loginCompany(vo);
	}

}
