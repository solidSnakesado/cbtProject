package com.cbt.candidate;

//2019.07.01 장세준 - VO 생성
public class CandidateVO {
	private String takerId;
	private String takerName;
	private String takerInfo;
	private String takerEducation;
	private String takerEmail;
	private String takerPassword;
	
	// 페이징을 위한 추가 (cnt, sort~ seqList)   장세준    7/2 
	private int cnt;
	private String sort;
	private String searchKeyword;
	private String searchCondition;
	private int start;
	private int end;
	private int[] seqList;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getOutMsg() {
		return outMsg;
	}
	public void setOutMsg(String outMsg) {
		this.outMsg = outMsg;
	}

	private String outMsg;
	
	
	public int[] getSeqList() {
		return seqList;
	}
	public void setSeqList(int[] seqList) {
		this.seqList = seqList;
	}
	public String getTakerId() {
		return takerId;
	}
	public void setTakerId(String takerId) {
		this.takerId = takerId;
	}
	public String getTakerName() {
		return takerName;
	}
	public void setTakerName(String takerName) {
		this.takerName = takerName;
	}
	public String getTakerInfo() {
		return takerInfo;
	}
	public void setTakerInfo(String takerInfo) {
		this.takerInfo = takerInfo;
	}
	public String getTakerEducation() {
		return takerEducation;
	}
	public void setTakerEducation(String takerEducation) {
		this.takerEducation = takerEducation;
	}
	public String getTakerEmail() {
		return takerEmail;
	}
	public void setTakerEmail(String takerEmail) {
		this.takerEmail = takerEmail;
	}
	public String getTakerPassword() {
		return takerPassword;
	}
	public void setTakerPassword(String takerPassword) {
		this.takerPassword = takerPassword;
	}
	
	@Override
	public String toString() {
		return "CandidateVO [takerId=" + takerId + ", takerName=" + takerName + ", takerInfo=" + takerInfo
				+ ", takerEducation=" + takerEducation + ", takerEmail=" + takerEmail + ", takerPassword="
				+ takerPassword + "]";
	}
	
	
}
