package com.cbt.candidate;

//2019.07.01 장세준 - VO 생성
public class CandidateVO {
	private String takerId;
	private String takerName;
	private String takerInfo;
	private String takerEducation;
	private String takerEmail;
	private String takerPassword;
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
