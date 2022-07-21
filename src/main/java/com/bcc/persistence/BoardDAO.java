package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;

public interface BoardDAO {


	// 글 내용
	public BoardVO getTour(Integer bno) throws Exception;

	// 조회수 1 증가
	public void updateBoardCnt(Integer num) throws Exception;

	// 게시물 목록 조회 (페이징)
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

	public List<BoardVO> list(int page, int size) throws Exception;

	// 게시물 정렬 목록 조회
	public List<BoardVO> listAlign(SearchCriteria scri) throws Exception;
	
	public List<BoardVO> addrListAlign(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 좋아요 유무 체크
	public Integer checkThumb(int b_num, String id);


	// 검색 결과 가져오기
	public List<BoardVO> searchList(String keyword);

	// 좋아요 수 +1
	public void addThumb(int b_num);

	// 좋아요 수 -1
	public void subThumb(int b_num);

	// 좋아요 테이블에 기록 추가
	public void insertThumb(int b_num, int b_category, String m_id);

	// 좋아요 테이블에서 기록 삭제
	public void deleteThumb(int b_num, String id);

	// 주소 존재 시 페이징 처리 된 목록 가져오기
	public int listCountAddr(SearchCriteria scri) throws Exception;
	public List<BoardVO> listAddr(SearchCriteria scri) throws Exception;

}
