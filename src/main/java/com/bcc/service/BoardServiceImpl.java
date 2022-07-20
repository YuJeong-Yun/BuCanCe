package com.bcc.service;

import java.util.List;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;
import com.bcc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	

	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDAO dao;


		//글 번호에 해당 되는 페이지 상세보기
		@Override
		public BoardVO getTour(int num) throws Exception {
			BoardVO vo = dao.getTour(num);
			return vo;
		}	
		// 조회수
		@Override
		public void updateBoardCount(Integer num) throws Exception {
			dao.updateBoardCnt(num);
		}
		//게시물 목록 조회
		@Override
		public List<BoardVO> list(SearchCriteria scri) throws Exception {
			return dao.list(scri);
		}
		
		// 게시물 정렬 목록 조회
		@Override
		public List<BoardVO> listAlign(SearchCriteria scri) throws Exception {
			
			if(scri.getAddr().equals("all"))
				return dao.listAlign(scri);
			else
				return dao.addrListAlign(scri);
			
		}

		//게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception {
			
			if(scri.getAddr().equals("all"))
				return dao.listCount(scri);
			else
				return dao.listCountAddr(scri);
			
		}
		
	@Override
	public Integer checkThumb(int b_num, String id) {
		
		return dao.checkThumb(b_num,id);
	}

	@Override
	public void updateThumb(int b_num, int b_category, String id) {
		int result = dao.checkThumb(b_num, id);
		
		if(result == 1) {
			// 좋아요 기록 있을 시 카운트-1, 테이블에서 기록 삭제
			dao.subThumb(b_num);
			dao.deleteThumb(b_num, id);
		} else if (result == 0) {
			// 좋아요 기록 없을 시 카운트+1, 테이블에 삽입
			dao.addThumb(b_num);
			dao.insertThumb(b_num, b_category, id);
		}
		
	}


	@Override
	public BoardVO getFood(int num) {
		
		return dao.getFood(num);
	}

	@Override
	public List<BoardVO> searchList(String keyword) {
		
		return dao.searchList(keyword);
	}

	@Override
	public int listCountAddr(SearchCriteria scri) throws Exception {
		
		return dao.listCountAddr(scri);
	}

	@Override
	public List<BoardVO> listAddr(SearchCriteria scri) throws Exception {
		
		return dao.listAddr(scri);
	}
	
	
	

}
