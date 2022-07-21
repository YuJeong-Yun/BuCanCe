package com.bcc.domain;

import java.sql.Date;

public class PreMemberVO {
	
	private String PCD_PAY_OID; //주문번호
	private String PCD_PAYER_NAME ; //아이디
	private Date license_deadline; //사용 만료일(유료구독권종료일)
	
	@Override
	public String toString() {
		return "PreMemberVO [PCD_PAY_OID=" + PCD_PAY_OID + ", PCD_PAYER_NAME=" + PCD_PAYER_NAME + ", license_deadline="
				+ license_deadline + "]";
	}
	public String getPCD_PAY_OID() {
		return PCD_PAY_OID;
	}
	public void setPCD_PAY_OID(String pCD_PAY_OID) {
		PCD_PAY_OID = pCD_PAY_OID;
	}
	public String getPCD_PAYER_NAME() {
		return PCD_PAYER_NAME;
	}
	public void setPCD_PAYER_NAME(String pCD_PAYER_NAME) {
		PCD_PAYER_NAME = pCD_PAYER_NAME;
	}
	public Date getLicense_deadline() {
		return license_deadline;
	}
	public void setLicense_deadline(Date license_deadline) {
		this.license_deadline = license_deadline;
	}
	
	
	
}
