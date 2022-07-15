package com.bcc.service;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;

public interface BoardService {
	/* 글 전체 목록 */
	public List<BoardVO> tourLists() throws Exception;

	/* 글 번호에 해당 되는 페이지 상세보기 */
	public BoardVO getTour(int num) throws Exception;
	
	/* 조회수 증가 */
	public void updateBoardCount(Integer num) throws Exception;

	/* 카테고리 */
	public List<BoardVO> category(String category) throws Exception;
	
	/* 게시물 목록 조회 */
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	/* 게시물 총 갯수 */
	public int listCount(SearchCriteria scri) throws Exception;
	
	/* 게시물 댓글 수 */
	public void updateCommentCnt(int num)throws Exception;

	
	// 좋아요 기록 체크
	public Integer checkThumb(int b_num, String id);

	// 좋아요 기록 체크 후 insert 또는 delete 실행 
	public void updateThumb(int b_num, int b_category, String id);

}
