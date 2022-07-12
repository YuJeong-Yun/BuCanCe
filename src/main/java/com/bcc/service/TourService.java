package com.bcc.service;

import java.util.List;

import com.bcc.domain.TourSpotVO;

public interface TourService {
	
	
	public List<TourSpotVO> restaurantLists(String addr);

	// ���̹� �˻� api�� ���� ������ ��ũ ��������
	public void getRestaurantInfo(List<TourSpotVO> restList) throws Exception;
	
	// �ش� ���� ���� ��������
	public TourSpotVO getInfoDetail(String title);
	
	
}
