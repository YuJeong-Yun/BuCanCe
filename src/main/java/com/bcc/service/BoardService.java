package com.bcc.service;

import java.util.List;

import com.bcc.domain.BoardVO;

public interface BoardService {
	/* 글 전체 목록 */
	public List<BoardVO> listAll() throws Exception;

	/* 글 번호에 해당 되는 페이지 상세보기 */
	public BoardVO readBoard(int num);
	
	/* 조회수 증가 */
	public void updateBoardCount(Integer num);

	/* 카테고리 */
	public List<BoardVO> category() throws Exception;
	
	
}
