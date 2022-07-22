package com.bcc.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.bcc.domain.KakaoVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PreOrderVO;

public interface AdminService {

	// 프리미엄 회원 정보
	public List<PreOrderVO> getPmInfo(String date);

	// 정기구독 회원 정보만
	public List<PreOrderVO> getOnlyPeriod(String date);

	// 최근 일주일간의 매출
	public JSONObject getTrendChart();

	// 최근 5개월간의 매출
	public JSONObject getMonthlyChart();

	// 최근 5일간의 회원수 추이
	public JSONObject getDailyMember();

	// 총 회원 수
	public Integer getTotalMem();

	// 총 프리미엄 회원 수
	public Integer getTotalPmMem();

	// 총 리뷰 수
	public Integer getTotalComment();

	// 총 숙박 예약 건수
	public List<Integer> getTotalAcc();

	// 웹 회원 목록
	public List<MemberVO> getAllWebMem();

	// 카카오 회원 목록
	public List<KakaoVO> getAllSnsMem();

	// 회원 삭제
	public void delMem(MemberVO vo);

}
