package com.bcc.service;

import java.util.List;

import org.json.simple.JSONArray;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;

public interface BoardService {

	// 관광지 상세페이지
	public BoardVO getTour(int num);
	
	// 조회수 증가 
	public void updateBoardCount(Integer num);

	// 게시물 목록 조회 
	public List<BoardVO> getList(SearchCriteria scri);
	
	// 게시물 정렬 목록 조회 
	public List<BoardVO> alignList(SearchCriteria scri);
	
	// 블로그 조회 목록
	public List getBlog(String title, String addr, String start) throws Exception;

	// 실시간 날씨 조회
	public JSONArray getWeather() throws Exception;
	
	// 게시물 총 갯수 
	public int countList(SearchCriteria scri);
	
	// 좋아요 기록 체크
	public Integer checkThumb(int b_num, String id);

	// 좋아요 기록 체크 후 insert 또는 delete 실행
	public void updateThumb(int b_num, int b_category, String id);
	
	// 검색 결과 가져오기
	public List<BoardVO> searchList(String keyword);

	// 주소 존재 시 페이징 처리 된 목록 가져오기
	public int countListAddr(SearchCriteria scri); 
	public List<BoardVO> getListAddr(SearchCriteria scri);
	
}
