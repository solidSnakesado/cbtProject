package com.cbt.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbt.common.Paging;
import com.cbt.company.CompanyDAO;
import com.cbt.company.CompanyVO;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
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
		managerDAO.deleteManager(vo);
		
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("managerList", managerDAO.getManagerList(vo));
		return map;
	}
	
	
	// 7/5 재용 추가
	public ManagerTakerVO getManagerUserAccountView(ManagerTakerVO vo) {		
		return managerDAO.getManagerUserAccountView(vo);
	}
	
	public List<CompanyVO> managerAccountList(CompanyDAO dao, CompanyVO vo) {
		return dao.getCompanyList(vo);
	}

	@Override
	public List<CompanyVO> managerAccountList(CompanyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
