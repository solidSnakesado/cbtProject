package com.cbt.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbt.common.Paging;

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
		
	}

	@Override
	public void deleteCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CompanyVO getCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompanyVO> getCompanyList(CompanyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getCompanyList(CompanyVO vo, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

}
