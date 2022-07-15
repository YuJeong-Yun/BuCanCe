package com.bcc.service;

import java.util.List;

import com.bcc.domain.BoardVO;

public interface TourService {
	
	
	public List<BoardVO> foodLists(String addr);

	// 네이버 검색 api로 맛집 정보와 링크 가져오기
	public void foodLists(List<BoardVO> restList) throws Exception;
	
	// 해당 맛집 정보 가져오기
	public BoardVO getFood(String title);
	
	
}
