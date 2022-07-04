package com.bcc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcc.domain.BoardVO;
import com.bcc.domain.Criteria;
import com.bcc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO dao;

	//글쓰기
//		@Override
//		public void regist(BoardVO vo) throws Exception{
//			dao.create(vo);
//			System.out.println("S: regist메서드 "+vo);
//		}

		//글 전체 목록
		@Override
		public List<BoardVO> listAll() throws Exception {
			List<BoardVO> boardList = dao.listAll();
			System.out.println("S: listAll메서드 ");
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
		public List<BoardVO> list(Criteria cri) throws Exception {
			return dao.list(cri);
		}
		//게시물 총 갯수

		@Override
		public int listCount() throws Exception {
			return dao.listCount();
		}
		
	}