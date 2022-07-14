package com.bcc.domain;

public class GrpAcceptVO {
	private int grp_num;
	private String sender;
	private String receiver;
	private String grp_name;
	private String name;

	public int getGrp_num() {
		return grp_num;
	}

	public void setGrp_num(int grp_num) {
		this.grp_num = grp_num;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getGrp_name() {
		return grp_name;
	}

	public void setGrp_name(String grp_name) {
		this.grp_name = grp_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "GrpAcceptVO [grp_num=" + grp_num + ", sender=" + sender + ", receiver=" + receiver + ", grp_name="
				+ grp_name + ", name=" + name + "]";
	}

}
