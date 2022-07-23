package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;

public interface BoardDAO {

	// 글 내용
	public BoardVO getTour(Integer bno);

	// 조회수 1 증가
	public void modBoardCnt(Integer num);

	// 게시물 목록 조회 (페이징)
	public List<BoardVO> getList(SearchCriteria scri);

	public List<BoardVO> getList(int page, int size);

	// 게시물 정렬 목록 조회
	public List<BoardVO> getAlignList(SearchCriteria scri);

	public List<BoardVO> getAlignListAddr(SearchCriteria scri);

	// 게시물 총 갯수
	public int getCountList(SearchCriteria scri);

	// 좋아요 유무 체크
	public Integer getCheckThumb(int b_num, String id);

	// 좋아요 수 +1
	public void modAddThumb(int b_num);

	// 좋아요 수 -1
	public void modSubThumb(int b_num);

	// 좋아요 테이블에 기록 추가
	public void putThumb(int b_num, int b_category, String m_id);

	// 좋아요 테이블에서 기록 삭제
	public void delThumb(int b_num, String id);

	// 검색 결과 가져오기
	public List<BoardVO> getSearchList(String keyword);

	// 주소 존재 시 페이징 처리 된 목록 가져오기
	public int getCountListAddr(SearchCriteria scri);

	public List<BoardVO> getListAddr(SearchCriteria scri);

}
