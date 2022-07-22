package com.bcc.domain;

import java.sql.Timestamp;

public class KakaoVO {
	
	private long k_number;
	private String k_name;
	private String k_email;
	private String k_id;
	private Timestamp regdate;
	
	
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
	public String getK_id() {
		return k_id;
	}
	public void setK_id(String k_id) {
		this.k_id = k_id;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "KakaoVO [k_number=" + k_number + ", k_name=" + k_name + ", k_email=" + k_email + ", k_id=" + k_id
				+ ", regdate=" + regdate + "]";
	}
	
	
}