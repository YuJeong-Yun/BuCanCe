package com.bcc.service;

import java.util.List;

import com.bcc.domain.TourSpotVO;

public interface TourService {
	
	
	public List<TourSpotVO> restaurantLists(String addr);

	// 네이버 검색 api로 맛집 정보와 링크 가져오기
	public void getRestaurantInfo(List<TourSpotVO> restList) throws Exception;
	
	// 해당 맛집 정보 가져오기
	public TourSpotVO getInfoDetail(String title);
	
	
}
