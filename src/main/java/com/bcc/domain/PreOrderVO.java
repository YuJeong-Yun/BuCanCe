package com.bcc.domain;

import java.sql.Date;

public class PreOrderVO {
	
	private String id;
	private Date credate_date; //시작일
	private Date license_deadline; //사용만요일-유료구독권종료일
	private Date next_order_date; //다음결제일
	private String pm; //결제내역
	private String PCD_PAYER_ID; //빌링키
	
	public PreOrderVO(String id, Date credate_date, Date license_deadline, Date next_order_date, String pm,
			String pCD_PAYER_ID) {
		super();
		this.id = id;
		this.credate_date = credate_date;
		this.license_deadline = license_deadline;
		this.next_order_date = next_order_date;
		this.pm = pm;
		PCD_PAYER_ID = pCD_PAYER_ID;
	}
	
	@Override
	public String toString() {
		return "PreOrderVO [id=" + id + ", credate_date=" + credate_date + ", license_deadline=" + license_deadline
				+ ", next_order_date=" + next_order_date + ", pm=" + pm + ", PCD_PAYER_ID=" + PCD_PAYER_ID + "]";
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

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public String getPCD_PAYER_ID() {
		return PCD_PAYER_ID;
	}

	public void setPCD_PAYER_ID(String pCD_PAYER_ID) {
		PCD_PAYER_ID = pCD_PAYER_ID;
	}
	

}