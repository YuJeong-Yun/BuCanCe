package com.bcc.domain;

import java.sql.Date;

public class PreMemberVO {
	
	private String id;
	private Date license_deadline;
	private String periodic_pm; //정기구독여부
	private String PCD_PAYER_ID; //빌링키
	
	public PreMemberVO(String id, Date license_deadline, String periodic_pm, String pCD_PAYER_ID) {
		super();
		this.id = id;
		this.license_deadline = license_deadline;
		this.periodic_pm = periodic_pm;
		PCD_PAYER_ID = pCD_PAYER_ID;
	}
	
	

	@Override
	public String toString() {
		return "PreMemberVO [id=" + id + ", license_deadline=" + license_deadline + ", periodic_pm=" + periodic_pm
				+ ", PCD_PAYER_ID=" + PCD_PAYER_ID + "]";
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getLicense_deadline() {
		return license_deadline;
	}

	public void setLicense_deadline(Date license_deadline) {
		this.license_deadline = license_deadline;
	}

	public String getPeriodic_pm() {
		return periodic_pm;
	}

	public void setPeriodic_pm(String periodic_pm) {
		this.periodic_pm = periodic_pm;
	}

	public String getPCD_PAYER_ID() {
		return PCD_PAYER_ID;
	}

	public void setPCD_PAYER_ID(String pCD_PAYER_ID) {
		PCD_PAYER_ID = pCD_PAYER_ID;
	}
	
	
	
}