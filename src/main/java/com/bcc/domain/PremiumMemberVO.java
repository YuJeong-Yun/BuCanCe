package com.bcc.domain;

import java.sql.Timestamp;

public class PremiumMemberVO {
	
	private String premium_id;
	private Timestamp created_date;
	private Timestamp license_deadline;
	private String periodic_pm;
	
	public String getPremium_id() {
		return premium_id;
	}
	public void setPremium_id(String premium_id) {
		this.premium_id = premium_id;
	}
	public Timestamp getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Timestamp created_date) {
		this.created_date = created_date;
	}
	public Timestamp getLicense_deadline() {
		return license_deadline;
	}
	public void setLicense_deadline(Timestamp license_deadline) {
		this.license_deadline = license_deadline;
	}
	public String getPeriodic_pm() {
		return periodic_pm;
	}
	public void setPeriodic_pm(String periodic_pm) {
		this.periodic_pm = periodic_pm;
	}
	
	@Override
	public String toString() {
		return "PremiumMemberVO [premium_id=" + premium_id + ", created_date=" + created_date + ", license_deadline="
				+ license_deadline + ", periodic_pm=" + periodic_pm + "]";
	}
	
	
	
}
