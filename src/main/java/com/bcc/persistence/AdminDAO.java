package com.bcc.persistence;

import java.util.List;
import java.util.Map;

import com.bcc.domain.PreOrderVO;

public interface AdminDAO {
	
	// 프리미엄 회원 order 내역
	public List<PreOrderVO> getPmInfo(String date);
	
	// order 내역 회원이 정기구독 회원인지 여부 판단
	public List<String> getPm(String date);
	
	// 정기구독 회원만 보기
	public List<PreOrderVO> getOnlyPeriod(String date);
	
	// 최근 일주일 이용자 수 가지고오기
	public Integer getTrendChart(String date);
	
	// 월별 이용자 수 차트
	public Integer getMonthlyChart(String date);
	
}
