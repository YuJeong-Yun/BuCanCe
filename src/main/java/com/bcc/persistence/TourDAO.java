package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;

public interface TourDAO {
	
	// ���� ���� ��������
	public List<BoardVO> restaurantLists(String addr); 
	
	// ���� ������ ��������
	public BoardVO infoDetail(String title);

}
