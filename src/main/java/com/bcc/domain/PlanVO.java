package com.bcc.domain;

import java.sql.Timestamp;

public class PlanVO {
	private int num;
	private String grp_name;
	private String tour_date_start;
	private String tour_date_end;
	private String tour_plan;
	private String tour_plan_acc;
	private Timestamp date;
	private String leader;
	private String writer;
	private Timestamp lastUpdate;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getGrp_name() {
		return grp_name;
	}

	public void setGrp_name(String grp_name) {
		this.grp_name = grp_name;
	}

	public String getTour_date_start() {
		return tour_date_start;
	}

	public void setTour_date_start(String tour_date_start) {
		this.tour_date_start = tour_date_start;
	}

	public String getTour_date_end() {
		return tour_date_end;
	}

	public void setTour_date_end(String tour_date_end) {
		this.tour_date_end = tour_date_end;
	}

	public String getTour_plan() {
		return tour_plan;
	}

	public void setTour_plan(String tour_plan) {
		this.tour_plan = tour_plan;
	}

	public String getTour_plan_acc() {
		return tour_plan_acc;
	}

	public void setTour_plan_acc(String tour_plan_acc) {
		this.tour_plan_acc = tour_plan_acc;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	@Override
	public String toString() {
		return "PlanVO [num=" + num + ", grp_name=" + grp_name + ", tour_date_start=" + tour_date_start
				+ ", tour_date_end=" + tour_date_end + ", tour_plan=" + tour_plan + ", tour_plan_acc=" + tour_plan_acc
				+ ", date=" + date + ", leader=" + leader + ", writer=" + writer + ", lastUpdate=" + lastUpdate + "]";
	}

}
