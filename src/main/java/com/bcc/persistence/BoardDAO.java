package com.bcc.persistence;


public interface BoardDAO {
	
	
		public Integer checkThumb(int b_num, String id);
	
		// 좋아요 수 +1
		public void addThumb(int b_num);

		// 좋아요 수 -1
		public void subThumb(int b_num);

		// 좋아요 테이블에 기록 추가
		public void insertThumb(int b_num, int b_category, String m_id);

		// 좋아요 테이블에서 기록 삭제
		public void deleteThumb(int b_num, String id);
	
}
