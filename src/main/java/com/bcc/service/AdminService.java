package com.bcc.service;


import java.util.List;

import org.json.simple.JSONObject;

import com.bcc.domain.PreOrderVO;


public interface AdminService {
	
	public List<PreOrderVO> getPmInfo(String date);

	public List<PreOrderVO> getOnlyPeriod(String date);
	
	public JSONObject getTrendChart();
	
	public JSONObject getMonthlyChart();
	
}
