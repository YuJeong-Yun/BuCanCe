package com.bcc.persistence;

import java.util.List;
import java.util.Map;

import com.bcc.domain.PremiumOrderVO;

public interface AdminDAO {
	
	public List<PremiumOrderVO> getPmInfo(String date);
	
	public List<String> getPm(String date);
	
	public List<PremiumOrderVO> getOnlyPeriod(String date);
	
	//public List<Map<String,Object>> getTrendChart(String today);
	
	// 월별 이용자 수 가지고오기
	public Integer getTrendChart(String date);
	
}
