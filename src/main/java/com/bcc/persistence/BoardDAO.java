package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;


public interface BoardDAO {
	
	//글쓰기
	public void create(BoardVO vo) throws Exception;
	
	// 글 리스트
	public List<BoardVO> listAll() throws Exception;

	//글 내용
	public BoardVO getBoard(Integer bno);
	
	//조회수 1 증가
	public void updateBoardCnt(Integer bno);
	
	//카테고리
	public List<BoardVO> category() throws Exception;

	

}
