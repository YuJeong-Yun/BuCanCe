package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;

public interface TourDAO {
	
	// 맛집 정보 가져오기
	public List<BoardVO> restaurantLists(String addr); 

	// 맛집 디테일 가져오기
	public BoardVO infoDetail(String title);

}
