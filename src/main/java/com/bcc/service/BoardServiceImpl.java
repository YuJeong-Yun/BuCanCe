package com.bcc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;
import com.bcc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO dao;

		//글 전체 목록
		@Override
		public List<BoardVO> listAll() throws Exception {
			List<BoardVO> boardList = dao.listAll();
			return boardList;
		}

		//글 번호에 해당 되는 페이지 상세보기
		@Override
		public BoardVO readBoard(int num) throws Exception {
			BoardVO vo = dao.getBoard(num);
			return vo;
		}	
		// 조회수
		@Override
		public void updateBoardCount(Integer num) throws Exception {
			dao.updateBoardCnt(num);
		}
		//카테고리
		@Override
		public List<BoardVO> category(String category) throws Exception {
			return dao.category(category);
		}
		//게시물 목록 조회
		@Override
		public List<BoardVO> list(SearchCriteria scri) throws Exception {
			return dao.list(scri);
		}
		//게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception {
			return dao.listCount(scri);
		}
		
	}