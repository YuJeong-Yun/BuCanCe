package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;

public interface BoardDAO {

	// 글 리스트
	public List<BoardVO> listAll() throws Exception;

	// 글 내용
	public BoardVO getBoard(Integer bno) throws Exception;

	// 조회수 1 증가
	public void updateBoardCnt(Integer num) throws Exception;

	// 카테고리
	public List<BoardVO> category(String category) throws Exception;

	// 게시물 목록 조회 (페이징)
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	public List<BoardVO> list(int page, int size) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	//게시글 댓글 수 
	public void updateCommentCnt(int num) throws Exception;
	
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
