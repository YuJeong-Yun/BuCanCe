package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.Criteria;

public interface BoardDAO {

	// 글쓰기
	public void create(BoardVO vo) throws Exception;

	// 글 리스트
	public List<BoardVO> listAll() throws Exception;

	// 글 내용
	public BoardVO getBoard(Integer bno) throws Exception;

	// 조회수 1 증가
	public void updateBoardCnt(Integer num) throws Exception;

	// 카테고리
	public List<BoardVO> category(String category) throws Exception;

	// 게시물 목록 조회 (페이징)
	public List<BoardVO> list(Criteria cri) throws Exception;

	public List<BoardVO> list(int page, int size) throws Exception;

	// 게시물 총 갯수
	public int listCount() throws Exception;

}
