package com.bcc.domain;

import java.sql.Date;

public class KakaoVO {
	
	private long k_number;
	private String k_name;
	private String k_email;
	private Date regdate;
	
	public long getK_number() {
		return k_number;
	}
	public void setK_number(long k_number) {
		this.k_number = k_number;
	}
	public String getK_name() {
		return k_name;
	}
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	public String getK_email() {
		return k_email;
	}
	public void setK_email(String k_email) {
		this.k_email = k_email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}