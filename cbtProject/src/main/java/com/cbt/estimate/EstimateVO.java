package com.cbt.estimate;

import java.sql.Date;

public class EstimateVO {
	
	private String estimateId; 		//의뢰ID
	private String categoryId;		//카테고리ID
	private String companyId;		//기업ID
	private Date   requestDay;		//의뢰일ID
	private int estimatePrice;		//금액
	private int tradeProgress;		//진행상태
	private String candidate;		//응시대상자
	private String applyPurpose;	//응시목적
	private String applicants;		//응시자 수
	private int examClassfication;	//시험분류
	private int levelOfDifficulty;	//난이도
	private Date examDate;			//시험일시
	private String remarks;			//비고
	private int examCount;			//시험횟수
	private int examInterval;		//시험간격
	public String getEstimateId() {
		return estimateId;
	}
	public void setEstimateId(String estimateId) {
		this.estimateId = estimateId;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public Date getRequestDay() {
		return requestDay;
	}
	public void setRequestDay(Date requestDay) {
		this.requestDay = requestDay;
	}
	public int getEstimatePrice() {
		return estimatePrice;
	}
	public void setEstimatePrice(int estimatePrice) {
		this.estimatePrice = estimatePrice;
	}
	public int getTradeProgress() {
		return tradeProgress;
	}
	public void setTradeProgress(int tradeProgress) {
		this.tradeProgress = tradeProgress;
	}
	public String getCandidate() {
		return candidate;
	}
	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}
	public String getApplyPurpose() {
		return applyPurpose;
	}
	public void setApplyPurpose(String applyPurpose) {
		this.applyPurpose = applyPurpose;
	}
	public String getApplicants() {
		return applicants;
	}
	public void setApplicants(String applicants) {
		this.applicants = applicants;
	}
	public int getExamClassfication() {
		return examClassfication;
	}
	public void setExamClassfication(int examClassfication) {
		this.examClassfication = examClassfication;
	}
	public int getLevelOfDifficulty() {
		return levelOfDifficulty;
	}
	public void setLevelOfDifficulty(int levelOfDifficulty) {
		this.levelOfDifficulty = levelOfDifficulty;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getExamCount() {
		return examCount;
	}
	public void setExamCount(int examCount) {
		this.examCount = examCount;
	}
	public int getExamInterval() {
		return examInterval;
	}
	public void setExamInterval(int examInterval) {
		this.examInterval = examInterval;
	}
	@Override
	public String toString() {
		return "EstimateVO [estimateId=" + estimateId + ", categoryId=" + categoryId + ", companyId=" + companyId
				+ ", requestDay=" + requestDay + ", estimatePrice=" + estimatePrice + ", tradeProgress=" + tradeProgress
				+ ", candidate=" + candidate + ", applyPurpose=" + applyPurpose + ", applicants=" + applicants
				+ ", examClassfication=" + examClassfication + ", levelOfDifficulty=" + levelOfDifficulty
				+ ", examDate=" + examDate + ", remarks=" + remarks + ", examCount=" + examCount + ", examInterval="
				+ examInterval + "]";
	}
	
	
	
	
	
	
	
	
	

	
	

}
