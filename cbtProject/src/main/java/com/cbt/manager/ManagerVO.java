package com.cbt.manager;

import java.util.Arrays;

public class ManagerVO {
	private String managerId;
	private String managerPassword;
	private String managerName;
	private String searchManager;
	private String[] mngList;
	
	
	public String[] getMngList() {
		return mngList;
	}
	public void setMngList(String[] mngList) {
		this.mngList = mngList;
	}
	public String getSearchManager() {
		return searchManager;
	}
	public void setSearchManager(String searchManager) {
		this.searchManager = searchManager;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getManagerPassword() {
		return managerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	@Override
	public String toString() {
		return "ManagerVO [managerId=" + managerId + ", managerPassword=" + managerPassword + ", managerName="
				+ managerName + ", searchManager=" + searchManager + ", mngList=" + Arrays.toString(mngList) + "]";
	}
	
	

	
}
