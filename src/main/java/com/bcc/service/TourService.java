package com.bcc.service;

import java.util.List;

import com.bcc.domain.BoardVO;

public interface TourService {
	
	
	public List<BoardVO> restaurantLists(String addr);

	// ���̹� �˻� api�� ���� ������ ��ũ ��������
	public void getRestaurantInfo(List<BoardVO> restList) throws Exception;
	
	// �ش� ���� ���� ��������
	public BoardVO getInfoDetail(String title);
	
	
}
