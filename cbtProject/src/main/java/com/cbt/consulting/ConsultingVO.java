package com.cbt.consulting;

// 2019.07.08 성재민
// consultingId 타입 int로 변경
// consultingTitle(제목) 추가
public class ConsultingVO {
	private int 	consultingId;
	private String 	companyId;
	private String	consultingTitle;
	private String 	consultingContents;
	private String 	consultingDesiredDate;
	private String 	consultingDate;
	private String 	consultingRemarks;
	private int		consultingState;	// 2019.07.03 성재민 상담 상태 설정 변수 추가
	private int 	start;
	private int 	end;

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

	

	public String getConsultingDesiredDate() {
		return consultingDesiredDate;
	}

	public void setConsultingDesiredDate(String consultingDesiredDate) {
		this.consultingDesiredDate = consultingDesiredDate;
	}

	public String getConsultingDate() {
		return consultingDate;
	}

	public void setConsultingDate(String consultingDate) {
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
