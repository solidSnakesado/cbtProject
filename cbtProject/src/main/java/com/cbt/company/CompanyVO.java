package com.cbt.company;

public class CompanyVO {
	private String companyId;       
	private String companyPassword;     
	private String companyName;         
	private String businessNumber;      
	private String companyClassification;  
	private String companySectors;      
	private String companyCredit;       
	private String companyManager;    
	private String companyManagerTelNum;	// 2019.07.02 성재민 COMPANY_MANAGER_TELNUM 추가
	private String[] cpnList;

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyManagerTelNum() {
		return companyManagerTelNum;
	}

	public void setCompanyManagerTelNum(String companyManagerTelNum) {
		this.companyManagerTelNum = companyManagerTelNum;
	}

	public CompanyVO() {
		// TODO Auto-generated constructor stub
	}

	public String getCompanyPassword() {
		return companyPassword;
	}

	public void setCompanyPassword(String companyPassword) {
		this.companyPassword = companyPassword;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBusinessNumber() {
		return businessNumber;
	}

	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}

	public String getCompanyClassification() {
		return companyClassification;
	}

	public void setCompanyClassification(String companyClassification) {
		this.companyClassification = companyClassification;
	}

	public String getCompanySectors() {
		return companySectors;
	}

	public void setCompanySectors(String companySectors) {
		this.companySectors = companySectors;
	}

	public String getCompanyCredit() {
		return companyCredit;
	}

	public void setCompanyCredit(String companyCredit) {
		this.companyCredit = companyCredit;
	}

	public String getCompanyManager() {
		return companyManager;
	}

	public void setCompanyManager(String companyManager) {
		this.companyManager = companyManager;
	}
	
	public String[] getCpnList() {
		return cpnList;
	}

	public void setCpnList(String[] cpnList) {
		this.cpnList = cpnList;
	}

	@Override
	public String toString() {
		return "CompanyVO [clientId=" + companyId + ", companyPassword=" + companyPassword + ", companyName="
				+ companyName + ", businessNumber=" + businessNumber + ", companyClassification="
				+ companyClassification + ", companySectors=" + companySectors + ", companyCredit=" + companyCredit
				+ ", companyManager=" + companyManager + "]";
	}
}
