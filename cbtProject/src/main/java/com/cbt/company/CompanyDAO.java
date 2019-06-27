package com.cbt.company;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCompany(CompanyVO vo) {
		System.out.println("insertCompany()");
		mybatis.insert("companyDAO.insertCompany", vo);
	}
}
