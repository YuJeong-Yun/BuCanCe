package com.bcc.domain;

import java.sql.Date;

public class PreOrderVO {
	
	private String PCD_PAY_OID;
	private String id;
	private Date create_date; //시작일
	private Date license_deadline; //사용만요일-유료구독권종료일
	private Date next_order_date; //다음결제일
	private String PCD_PAYER_ID; //빌링키
	
	public PreOrderVO(){}
	
	public PreOrderVO(String id, Date create_date, Date license_deadline, Date next_order_date,
			String pCD_PAYER_ID) {
		super();
		this.id = id;
		this.create_date = create_date;
		this.license_deadline = license_deadline;
		this.next_order_date = next_order_date;
		PCD_PAYER_ID = pCD_PAYER_ID;
	}
	

	@Override
	public String toString() {
		return "PreOrderVO [PCD_PAY_OID=" + PCD_PAY_OID + ", id=" + id + ", create_date=" + create_date
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

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
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
