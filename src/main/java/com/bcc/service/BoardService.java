package com.bcc.service;


public interface BoardService {
	
	// 좋아요 기록 체크
	public Integer checkThumb(int b_num, String id);
	
	// 좋아요 기록 체크 후 insert 또는 delete 실행 
	public void updateThumb(int b_num, int b_category, String id);

}