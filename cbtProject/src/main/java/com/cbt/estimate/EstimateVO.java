package com.cbt.estimate;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EstimateVO {
	
	


	private int estimateId; 		//의뢰ID
	private String estimateName;	//의뢰이름
	private int categoryId;		//카테고리ID
	private String companyId;		//기업ID
	@JsonFormat(pattern="yyyy-MM-dd", timezone ="Asia/Seoul")
	private Date   requestDay;		//의뢰일ID
	private int estimatePrice;		//금액
	private String tradeProgress;	//의뢰진행상태
	private String candidate;		//응시대상자
	private String applyPurpose;	//응시목적
	private String applicants;		//응시자 수
	private String examClassfication;	//시험분류
	private String levelOfDifficulty;	//난이도
	@JsonFormat(pattern="yyyy-MM-dd", timezone ="Asia/Seoul")
	private Date examDate;			//시험일시
	private String remarks;			//비고
	private String examCount;			//시험횟수
	private String examInterval;		//시험간격
	//코드값에대한 이름을 저장하기위한 변수들
	private String examCountNm;		// 
	private String tradeProgressNm; // 
	
	
	
	
	public String getExamInterval() {
		return examInterval;
	}


	public void setExamInterval(String examInterval) {
		this.examInterval = examInterval;
	}


	public String getTradeProgressNm() {
		return tradeProgressNm;
	}


	public void setTradeProgressNm(String tradeProgressNm) {
		this.tradeProgressNm = tradeProgressNm;
	}


	public String getExamCountNm() {
		return examCountNm;
	}


	public void setExamCountNm(String examCountNm) {
		this.examCountNm = examCountNm;
	}


	public int getEstimateId() {
		return estimateId;
	}


	public void setEstimateId(int estimateId) {
		this.estimateId = estimateId;
	}


	public String getEstimateName() {
		return estimateName;
	}


	public void setEstimateName(String estimateName) {
		this.estimateName = estimateName;
	}


	

	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
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


	public String getTradeProgress() {
		return tradeProgress;
	}


	public void setTradeProgress(String tradeProgress) {
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


	public String getExamClassfication() {
		return examClassfication;
	}


	public void setExamClassfication(String examClassfication) {
		this.examClassfication = examClassfication;
	}


	public String getLevelOfDifficulty() {
		return levelOfDifficulty;
	}


	public void setLevelOfDifficulty(String levelOfDifficulty) {
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


	public String getExamCount() {
		return examCount;
	}


	public void setExamCount(String examCount) {
		this.examCount = examCount;
	}




	@Override
	public String toString() {
		return "EstimateVO [estimateId=" + estimateId + ", categoryId=" + categoryId + ", companyId=" + companyId
				+ ", requestDay=" + requestDay + ", estimatePrice=" + estimatePrice + ", tradeProgress=" + tradeProgress
				+ ", candidate=" + candidate + ", applyPurpose=" + applyPurpose + ", applicants=" + applicants
				+ ", examClassfication=" + examClassfication + ", levelOfDifficulty=" + levelOfDifficulty
				+ ", examDate=" + examDate + ", remarks=" + remarks + ", examCount=" + examCount + ", examInterval="
				+ examInterval + ", estimateName=" + estimateName + "]";
	}
	
	
}