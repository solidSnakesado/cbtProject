package com.cbt.manager;

public class ManagerVO {
	private String manager_id;
	private String manager_pw;
	private String manager_name;
	private String searchManager;
	
	
	public String getSearchManager() {
		return searchManager;
	}
	public void setSearchManager(String searchManager) {
		this.searchManager = searchManager;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pw() {
		return manager_pw;
	}
	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	@Override
	public String toString() {
		return "ManagerVO [manager_id=" + manager_id + ", manager_pw=" + manager_pw + ", manager_name=" + manager_name
				+ ", searchManager=" + searchManager + "]";
	}
	
	
}
