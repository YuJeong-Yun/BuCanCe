package com.bcc.domain;

public class PlanMemberVO {
	private int num;
	private String id;
	private int grp_num;
	private String grp_name;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGrp_num() {
		return grp_num;
	}

	public void setGrp_num(int grp_num) {
		this.grp_num = grp_num;
	}

	public String getGrp_name() {
		return grp_name;
	}

	public void setGrp_name(String grp_name) {
		this.grp_name = grp_name;
	}

	@Override
	public String toString() {
		return "PlanMemberVO [num=" + num + ", id=" + id + ", grp_num=" + grp_num + ", grp_name=" + grp_name + "]";
	}

}
