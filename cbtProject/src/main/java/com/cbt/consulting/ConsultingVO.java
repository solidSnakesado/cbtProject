package com.cbt.consulting;

import java.sql.Timestamp;

// 2019.07.08 성재민
// consultingId 타입 int로 변경
// consultingTitle(제목) 추가
public class ConsultingVO {
	private int 		consultingId;
	private String 		companyId;
	private String		consultingTitle;
	private String 		consultingContents;
	private Timestamp 	consultingDesiredDate;
	private Timestamp 	consultingDate;
	private String 		consultingRemarks;
	private int			consultingState;	// 2019.07.03 성재민 상담 상태 설정 변수 추가

	public ConsultingVO() {
		// TODO Auto-generated constructor stub
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getConsultingContents() {
		return consultingContents;
	}

	public void setConsultingContents(String consultingContents) {
		this.consultingContents = consultingContents;
	}

	public Timestamp getConsultingDesiredDate() {
		return consultingDesiredDate;
	}

	public void setConsultingDesiredDate(Timestamp consultingDesiredDate) {
		this.consultingDesiredDate = consultingDesiredDate;
	}

	public Timestamp getConsultingDate() {
		return consultingDate;
	}

	public void setConsultingDate(Timestamp consultingDate) {
		this.consultingDate = consultingDate;
	}

	public String getConsultingRemarks() {
		return consultingRemarks;
	}

	public void setConsultingRemarks(String consultingRemarks) {
		this.consultingRemarks = consultingRemarks;
	}
	
	public int getConsultingState() {
		return consultingState;
	}

	public void setConsultingState(int consultingState) {
		this.consultingState = consultingState;
	}

	public int getConsultingId() {
		return consultingId;
	}

	public void setConsultingId(int consultingId) {
		this.consultingId = consultingId;
	}

	public String getConsultingTitle() {
		return consultingTitle;
	}

	public void setConsultingTitle(String consultingTitle) {
		this.consultingTitle = consultingTitle;
	}
}
