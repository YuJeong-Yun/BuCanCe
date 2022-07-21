package com.bcc.domain;

public class KakaoVO {
	
	private long k_number;
	private String k_name;
	private String k_email;
	
	
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
	
	@Override
	public String toString() {
		return "KakaoVO [k_number=" + k_number + ", k_name=" + k_name + ", k_email=" + k_email + "]";
	}
	

}