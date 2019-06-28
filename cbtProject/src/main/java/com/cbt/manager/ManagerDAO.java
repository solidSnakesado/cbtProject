package com.cbt.manager;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.candidate.CandidateVO;

@Repository
public class ManagerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertManager(ManagerVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public void updateManager(ManagerVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public void deleteManager(ManagerVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("", vo);
	}

	public CandidateVO getManager(ManagerVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ManagerVO> getManagerList(ManagerVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
