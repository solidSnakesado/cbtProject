package com.cbt.consulting;

import java.sql.Timestamp;

public class ConsultingVO {
	private String 		consultingId;
	private String 		companyId;
	private String 		consulting_CONTENTS;
	private Timestamp 	consultingDesiredDate;
	private Timestamp 	consultingDate;
	private String 		consultingRemarks;
	
	public ConsultingVO() {
		// TODO Auto-generated constructor stub
	}

	public String getConsultingId() {
		return consultingId;
	}

	public void setConsultingId(String consultingId) {
		this.consultingId = consultingId;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getConsulting_CONTENTS() {
		return consulting_CONTENTS;
	}

	public void setConsulting_CONTENTS(String consulting_CONTENTS) {
		this.consulting_CONTENTS = consulting_CONTENTS;
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
}
