package com.cbt.condition;

public class ConditionVO {
	
	private int conditionSeq;
	private int masterCd;
	private String masterNm;
	private int detailCd;
	private String detailNm;
	private int useYn;
	private String searchCondition;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public int getConditionSeq() {
		return conditionSeq;
	}
	public void setConditionSeq(int conditionSeq) {
		this.conditionSeq = conditionSeq;
	}
	public int getMasterCd() {
		return masterCd;
	}
	public void setMasterCd(int masterCd) {
		this.masterCd = masterCd;
	}
	public String getMasterNm() {
		return masterNm;
	}
	public void setMasterNm(String masterNm) {
		this.masterNm = masterNm;
	}
	public int getDetailCd() {
		return detailCd;
	}
	public void setDetailCd(int detailCd) {
		this.detailCd = detailCd;
	}
	public String getDetailNm() {
		return detailNm;
	}
	public void setDetailNm(String detailNm) {
		this.detailNm = detailNm;
	}
	public int getUseYn() {
		return useYn;
	}
	public void setUseYn(int useYn) {
		this.useYn = useYn;
	}
	@Override
	public String toString() {
		return "ConditionVO [conditionSeq=" + conditionSeq + ", masterCd=" + masterCd + ", masterNm=" + masterNm
				+ ", detailCd=" + detailCd + ", detailNm=" + detailNm + ", useYn=" + useYn + "]";
	}
	
	
	
	
	
	
}
