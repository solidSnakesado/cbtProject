package com.cbt.condition;

public class ConditionVO {
	
	private String conditionId;
	private String companyCreditCondition;
	private String examStatusCondition;
	private String tradeProgressCondition;
	private String companyClassificationCon;
	private String companySectorsCondition;
	private String examClassificationCondition;
	private String levelOfDifficultyCondition;
	private String numberOfTiems;
	private String questionType;
	private String takerEducation;
	
	public String getConditionId() {
		return conditionId;
	}
	public void setConditionId(String conditionId) {
		this.conditionId = conditionId;
	}
	public String getCompanyCreditCondition() {
		return companyCreditCondition;
	}
	public void setCompanyCreditCondition(String companyCreditCondition) {
		this.companyCreditCondition = companyCreditCondition;
	}
	public String getExamStatusCondition() {
		return examStatusCondition;
	}
	public void setExamStatusCondition(String examStatusCondition) {
		this.examStatusCondition = examStatusCondition;
	}
	public String getTradeProgressCondition() {
		return tradeProgressCondition;
	}
	public void setTradeProgressCondition(String tradeProgressCondition) {
		this.tradeProgressCondition = tradeProgressCondition;
	}
	public String getCompanyClassificationCon() {
		return companyClassificationCon;
	}
	public void setCompanyClassificationCon(String companyClassificationCon) {
		this.companyClassificationCon = companyClassificationCon;
	}
	public String getCompanySectorsCondition() {
		return companySectorsCondition;
	}
	public void setCompanySectorsCondition(String companySectorsCondition) {
		this.companySectorsCondition = companySectorsCondition;
	}
	public String getExamClassificationCondition() {
		return examClassificationCondition;
	}
	public void setExamClassificationCondition(String examClassificationCondition) {
		this.examClassificationCondition = examClassificationCondition;
	}
	public String getLevelOfDifficultyCondition() {
		return levelOfDifficultyCondition;
	}
	public void setLevelOfDifficultyCondition(String levelOfDifficultyCondition) {
		this.levelOfDifficultyCondition = levelOfDifficultyCondition;
	}
	public String getNumberOfTiems() {
		return numberOfTiems;
	}
	public void setNumberOfTiems(String numberOfTiems) {
		this.numberOfTiems = numberOfTiems;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getTakerEducation() {
		return takerEducation;
	}
	public void setTakerEducation(String takerEducation) {
		this.takerEducation = takerEducation;
	}
	
	@Override
	public String toString() {
		return "ConditionVO [conditionId=" + conditionId + ", companyCreditCondition=" + companyCreditCondition
				+ ", examStatusCondition=" + examStatusCondition + ", tradeProgressCondition=" + tradeProgressCondition
				+ ", companyClassificationCon=" + companyClassificationCon + ", companySectorsCondition="
				+ companySectorsCondition + ", examClassificationCondition=" + examClassificationCondition
				+ ", levelOfDifficultyCondition=" + levelOfDifficultyCondition + ", numberOfTiems=" + numberOfTiems
				+ ", questionType=" + questionType + ", takerEducation=" + takerEducation + "]";
	}
	
}
