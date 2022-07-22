package com.bcc.service;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.HotelVO;
import com.bcc.domain.PlanVO;

public interface PlanService {

	// 플랜 생성
	public void createPlan(PlanVO vo);

	// 소속된 플랜 리스트 가져오기
	public List<PlanVO> getPlanList(String id);

	// 전체 관광지 정보 가져오기
	public List<BoardVO> getTourList();

	// 전체 맛집 정보 가져오기
	public List<BoardVO> getRestaurantList();

	// 숙소 리스트 가져오기
	public List<HotelVO> getHotelList();

	// 카테고리별 검색 결과 가져오기
	public List<BoardVO> getSearchList(String category, String keyword);

	// 여행 경로 저장
	public void modifyTourPlan(PlanVO vo);

	// 여행 경로 목록 가져오기
	public List<List<Object>> getTourPlanList(int num);

	// 플랜 정보 가져오기
	public PlanVO getPlanInfo(int num);

}