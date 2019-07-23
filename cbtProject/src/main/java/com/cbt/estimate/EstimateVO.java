package com.cbt.estimate;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EstimateVO {
	
	


	private int estimateId; 		//의뢰ID
	private String estimateName;	//의뢰이름
	private int categoryId;			//카테고리ID
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
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone ="Asia/Seoul")
	private Date paymentDate;			//결제날짜
	
	
	////////////////DB 사용하지 않는 변수들/////////////////
	//코드값에대한 이름을 저장하기위한 변수들
	private String categoryName;     //카테고리이름
	private String examCountName;	 // 시험횟수 이름(ex 1번,2번)
	private String tradeProgressName;// 의뢰진행상태 이름
	private String applyPurposeName; // 응시목적이름
	private String candidateName;		//응시대상자이름
	//페이징
	private int start;	//페이징시작번호
	private int end;	//페이징끝번호
	//카테고리 ID
	private int mainCategoryId;
	private int middleCategoryId;
	private int smallCategoryId;
	
	private String categoryMainName;
	private String categoryMiddleName;
	private String categorySmallName;
	////////////////DB 사용하지 않는 변수들/////////////////
	
	
	
	public int getEstimateId() {
		return estimateId;
	}
	public String getCandidateName() {
		return candidateName;
	}
	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}
	public String getApplyPurposeName() {
		return applyPurposeName;
	}
	public void setApplyPurposeName(String applyPurposeName) {
		this.applyPurposeName = applyPurposeName;
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
	public String getExamInterval() {
		return examInterval;
	}
	public void setExamInterval(String examInterval) {
		this.examInterval = examInterval;
	}
	
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getExamCountName() {
		return examCountName;
	}
	public void setExamCountName(String examCountName) {
		this.examCountName = examCountName;
	}
	public String getTradeProgressName() {
		return tradeProgressName;
	}
	public void setTradeProgressName(String tradeProgressName) {
		this.tradeProgressName = tradeProgressName;
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
	public int getMainCategoryId() {
		return mainCategoryId;
	}
	public void setMainCategoryId(int mainCategoryId) {
		this.mainCategoryId = mainCategoryId;
	}
	public int getMiddleCategoryId() {
		return middleCategoryId;
	}
	public void setMiddleCategoryId(int middleCategoryId) {
		this.middleCategoryId = middleCategoryId;
	}
	public int getSmallCategoryId() {
		return smallCategoryId;
	}
	public void setSmallCategoryId(int smallCategoryId) {
		this.smallCategoryId = smallCategoryId;
	}
	public String getCategoryMainName() {
		return categoryMainName;
	}
	public void setCategoryMainName(String categoryMainName) {
		this.categoryMainName = categoryMainName;
	}
	public String getCategoryMiddleName() {
		return categoryMiddleName;
	}
	public void setCategoryMiddleName(String categoryMiddleName) {
		this.categoryMiddleName = categoryMiddleName;
	}
	public String getCategorySmallName() {
		return categorySmallName;
	}
	public void setCategorySmallName(String categorySmallName) {
		this.categorySmallName = categorySmallName;
	}
	@Override
	public String toString() {
		return "EstimateVO [estimateId=" + estimateId + ", estimateName=" + estimateName + ", categoryId=" + categoryId
				+ ", companyId=" + companyId + ", requestDay=" + requestDay + ", estimatePrice=" + estimatePrice
				+ ", tradeProgress=" + tradeProgress + ", candidate=" + candidate + ", applyPurpose=" + applyPurpose
				+ ", applicants=" + applicants + ", examClassfication=" + examClassfication + ", levelOfDifficulty="
				+ levelOfDifficulty + ", examDate=" + examDate + ", remarks=" + remarks + ", examCount=" + examCount
				+ ", examInterval=" + examInterval + ", paymentDate=" + paymentDate + ", categoryName=" + categoryName
				+ ", examCountName=" + examCountName + ", tradeProgressName=" + tradeProgressName
				+ ", applyPurposeName=" + applyPurposeName + ", candidateName=" + candidateName + ", start=" + start
				+ ", end=" + end + ", mainCategoryId=" + mainCategoryId + ", middleCategoryId=" + middleCategoryId
				+ ", smallCategoryId=" + smallCategoryId + ", categoryMainName=" + categoryMainName
				+ ", categoryMiddleName=" + categoryMiddleName + ", categorySmallName=" + categorySmallName + "]";
	}
	
	
	
	
}