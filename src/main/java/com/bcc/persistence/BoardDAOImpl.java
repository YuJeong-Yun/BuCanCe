package com.bcc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	// DB접근을 위해 필요한 객체
	@Inject
	private SqlSession session;

	// mapper의 위치 정보 저장
	private static final String namespace = "com.bcc.mapper.BoardMapper";

	// 글쓰기
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		System.out.println("DAO: 글쓰기메서드");
	}

	// 글 전체 목록
	@Override
	public List<BoardVO> listAll() throws Exception {
		System.out.println("DAO: 글전체목록 메서드");
		// sqlSession 객체 사용하여 Mapper 호출
		return session.selectList(namespace + ".listAll");
	}

	// 글 내용
	@Override
	public BoardVO getBoard(Integer num) {
		return session.selectOne(namespace + ".getBoard", num);
	}

	// 조회수
	@Override
	public void updateBoardCnt(Integer num) {
		session.update(namespace + ".updateBoardCnt", num);
	}

	// 카테고리
	@Override
	public List<BoardVO> category(String category) throws Exception {
		return session.selectList(namespace + ".category", category);
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return session.selectList(namespace + ".listCri", scri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return session.selectOne(namespace + ".listCount", scri);
	}

	@Override
	public List<BoardVO> list(int page, int size) throws Exception {
		Map<String, Integer> param = new HashMap<String, Integer>();

		if (page <= 0) {
			page = 1;
		}
		if (size <= 0) {
			size = 10;
		}

		page = (page - 1) * size;

		param.put("pageStart", page);
		param.put("perPageNum", size);
		return session.selectList(namespace + ".listCri", param);
	}
}
