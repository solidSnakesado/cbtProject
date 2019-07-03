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
		System.out.println("===> insertManager() 기능처리");
		mybatis.insert("ManagerDAO.insertManager", vo);
	}

	public void updateManager(ManagerVO vo) {
		System.out.println("===> updateManager() 기능처리");
		mybatis.update("ManagerDAO.updateManager", vo);
	}

	public void deleteManager(ManagerVO vo) {
		System.out.println("===> deleteManager() 기능처리");
		mybatis.delete("ManagerDAO.deleteManager", vo);
	}

	public ManagerVO getManager(ManagerVO vo) {
		System.out.println("===> getManager() 기능처리");
		return mybatis.selectOne("ManagerDAO.getManager", vo);
	}

	public List<ManagerVO> getManagerList(ManagerVO vo) {
		System.out.println("===> getManagerList() 기능처리");
		return mybatis.selectList("ManagerDAO.getManagerList", vo);
	}
}
