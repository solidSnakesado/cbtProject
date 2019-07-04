package com.cbt.estimate;

import java.sql.Date;

public class EstimateVO {
	
	private String estimateId;
	private String estimatePrice;
	private Date   requestDay;
	private String tradeProgress;
	private String remarks;
	private String applicants;
	private String levelOfDifficulty;
	private String candidate;
	private String applyPurpose;
	private String examDate;
	private int category_id;
	private String examClassfication;
	private String companyId;
	private int examCount;
	private int examInterval;
	
	public String getEstimateId() {
		return estimateId;
	}
	public void setEstimateId(String estimateId) {
		this.estimateId = estimateId;
	}
	public String getEstimatePrice() {
		return estimatePrice;
	}
	public void setEstimatePrice(String estimatePrice) {
		this.estimatePrice = estimatePrice;
	}
	public Date getRequestDay() {
		return requestDay;
	}
	public void setRequestDay(Date requestDay) {
		this.requestDay = requestDay;
	}
	public String getTradeProgress() {
		return tradeProgress;
	}
	public void setTradeProgress(String tradeProgress) {
		this.tradeProgress = tradeProgress;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getApplicants() {
		return applicants;
	}
	public void setApplicants(String applicants) {
		this.applicants = applicants;
	}
	public String getLevelOfDifficulty() {
		return levelOfDifficulty;
	}
	public void setLevelOfDifficulty(String levelOfDifficulty) {
		this.levelOfDifficulty = levelOfDifficulty;
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
	public String getExamDate() {
		return examDate;
	}
	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getExamClassfication() {
		return examClassfication;
	}
	public void setExamClassfication(String examClassfication) {
		this.examClassfication = examClassfication;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
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
		return "EstimateVO [estimateId=" + estimateId + ", estimatePrice=" + estimatePrice + ", requestDay="
				+ requestDay + ", tradeProgress=" + tradeProgress + ", remarks=" + remarks + ", applicants="
				+ applicants + ", levelOfDifficulty=" + levelOfDifficulty + ", candidate=" + candidate
				+ ", applyPurpose=" + applyPurpose + ", examDate=" + examDate + ", category_id=" + category_id
				+ ", examClassfication=" + examClassfication + ", companyId=" + companyId + ", examCount=" + examCount
				+ ", examInterval=" + examInterval + "]";
	}
	
	

}
