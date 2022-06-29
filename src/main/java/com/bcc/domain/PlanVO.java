package com.bcc.domain;

import java.sql.Date;

import com.google.protobuf.Timestamp;

public class PlanVO {
	private int num;
	private Date tour_date_start;
	private Date tour_date_end;
	private String tour_plan;
	private Timestamp date;
	private String leader;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Date getTour_date_start() {
		return tour_date_start;
	}

	public void setTour_date_start(Date tour_date_start) {
		this.tour_date_start = tour_date_start;
	}

	public Date getTour_date_end() {
		return tour_date_end;
	}

	public void setTour_date_end(Date tour_date_end) {
		this.tour_date_end = tour_date_end;
	}

	public String getTour_plan() {
		return tour_plan;
	}

	public void setTour_plan(String tour_plan) {
		this.tour_plan = tour_plan;
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

	@Override
	public String toString() {
		return "PlanVO [num=" + num + ", tour_date_start=" + tour_date_start + ", tour_date_end=" + tour_date_end
				+ ", tour_plan=" + tour_plan + ", date=" + date + ", leader=" + leader + "]";
	}

}
