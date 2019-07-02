package com.cbt.manager;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.cbt.common.Paging;

public class ManagerServiceImpl implements ManagerService {
	
	@Resource
	ManagerDAO managerDAO;
	
	@Override
	public void insertManager(ManagerVO vo) {
		managerDAO.insertManager(vo);
		
	}

	@Override
	public void updateManager(ManagerVO vo) {
		managerDAO.updateManager(vo);
		
	}

	@Override
	public void deleteManager(ManagerVO vo) {
		managerDAO.deleteManager(vo.getManager_id());
		
	}

	@Override
	public ManagerVO getManager(ManagerVO vo) {
		
		return managerDAO.getManager(vo);
	}

	@Override
	public List<ManagerVO> getManagerList(ManagerVO vo) {
		 
		return managerDAO.getManagerList(vo);
	}

	@Override
	public Map<String, Object> getManagerList(ManagerVO vo, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

}
