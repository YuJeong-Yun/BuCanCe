package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.PreOrderVO;


public interface AdminDAO {
	
	// 프리미엄 회원 order 내역
	public List<PreOrderVO> getPmInfo(String date);
	
	// 정기구독 회원만 보기
	public List<PreOrderVO> getOnlyPeriod(String date);
	
	// 최근 일주일 이용자 수 가지고오기
	public Integer getTrendChart(String date);
	
	// 월별 이용자 수 차트
	public Integer getMonthlyChart(String date);
	
	// 웹 가입자 추이
	public Integer getWebMem(String date);
	
	// sns 가입자 추이
	public Integer getSNSMem(String date);
	
	// profitChart 카드
	public Integer totalMem();
	public Integer totalPmMem();
	public Integer totalComment();
	public Integer totalAcc(String date);
	
	
}
