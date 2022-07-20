package com.bcc.domain;

import java.sql.Date;

public class PremiumMemberVO {
	
	private String PCD_PAY_OID; //주문번호
	private String id; //아이디
	private Date license_deadline; //사용 만료일(유료구독권종료일
	
	/*
	 * public PremiumMemberVO(String pCD_PAY_OID, String id, Date license_deadline)
	 * { super(); PCD_PAY_OID = pCD_PAY_OID; this.id = id; this.license_deadline =
	 * license_deadline; }
	 */
		

	@Override
	public String toString() {
		return "PremiumMemberVO [PCD_PAY_OID=" + PCD_PAY_OID + ", id=" + id + ", license_deadline=" + license_deadline
				+ "]";
	}



	public String getPCD_PAY_OID() {
		return PCD_PAY_OID;
	}

	public void setPCD_PAY_OID(String pCD_PAY_OID) {
		PCD_PAY_OID = pCD_PAY_OID;
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
	
	
	
}
