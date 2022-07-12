package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.TourSpotVO;

public interface TourDAO {
	
	// ���� ���� ��������
	public List<TourSpotVO> restaurantLists(String addr); 
	
	// ���� ������ ��������
	public TourSpotVO infoDetail(String title);

}
