package com.bcc.domain;

import java.sql.Date;

public class PremiumOrderVO {
	
	private String id;
	private Date success_date;
	private Date license_deadline;
	private Date next_order_date;
	private String billing_key;
	private String pm;
	
	
	
	public Date getSuccess_date() {
		return success_date;
	}
	public void setSuccess_date(Date success_date) {
		this.success_date = success_date;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBilling_key() {
		return billing_key;
	}
	public void setBilling_key(String billing_key) {
		this.billing_key = billing_key;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	@Override
	public String toString() {
		return "PremiumOrderVO [id=" + id + ", success_date=" + success_date + ", license_deadline=" + license_deadline
				+ ", next_order_date=" + next_order_date + ", billing_key=" + billing_key + ", pm=" + pm + "]";
	}

	
	
}
