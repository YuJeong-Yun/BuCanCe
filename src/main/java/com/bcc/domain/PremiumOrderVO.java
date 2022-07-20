package com.bcc.domain;

import java.sql.Date;

public class PremiumOrderVO {
	
	private String PCD_PAY_OID; //주문번호
	private String id; //아이디
	private Date credate_date; //결제일
	private Date license_deadline; //사용 만료일(유료구독권종료일
	//private String periodic_pm; //구독여부
	private Date next_order_date; //다음결제일
	private String PCD_PAYER_ID; //빌링키
	
	@Override
	public String toString() {
		return "PremiumOrderVO [PCD_PAY_OID=" + PCD_PAY_OID + ", id=" + id + ", credate_date=" + credate_date
				+ ", license_deadline=" + license_deadline + ", next_order_date=" + next_order_date + ", PCD_PAYER_ID="
				+ PCD_PAYER_ID + "]";
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

	public Date getCredate_date() {
		return credate_date;
	}

	public void setCredate_date(Date credate_date) {
		this.credate_date = credate_date;
	}

	public Date getLicense_deadline() {
		return license_deadline;
	}

	public void setLicense_deadline(Date license_deadline) {
		this.license_deadline = license_deadline;
	}

	public Date getNext_order_date() {
		return next_order_date;
	}

	public void setNext_order_date(Date next_order_date) {
		this.next_order_date = next_order_date;
	}

	public String getPCD_PAYER_ID() {
		return PCD_PAYER_ID;
	}

	public void setPCD_PAYER_ID(String pCD_PAYER_ID) {
		PCD_PAYER_ID = pCD_PAYER_ID;
	}
		

	
	

}
