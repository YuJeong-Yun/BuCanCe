package com.bcc.service;


public interface BoardService {
	
	// ���ƿ� ��� üũ
	public Integer checkThumb(int b_num, String id);
	
	// ���ƿ� ��� üũ �� insert �Ǵ� delete ���� 
	public void updateThumb(int b_num, int b_category, String id);

}