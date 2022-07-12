package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.TourSpotVO;

public interface TourDAO {
	
	// 맛집 정보 가져오기
	public List<TourSpotVO> restaurantLists(String addr); 
	
	// 맛집 디테일 가져오기
	public TourSpotVO infoDetail(String title);

}
