package com.bcc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.BoardVO;
import com.bcc.domain.SearchCriteria;


@Repository
public class BoardDAOImpl implements BoardDAO {
	

	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);


	// DB접근을 위해 필요한 객체
	@Inject
	private SqlSession session;

	// mapper의 위치 정보 저장
	private static final String namespace = "com.bcc.mapper.BoardMapper";

	// 글 내용
	@Override
	public BoardVO getTour(Integer num) {
		return session.selectOne(namespace + ".getTour", num);
	}

	// 조회수
	@Override
	public void updateBoardCnt(Integer num) {
		session.update(namespace + ".updateBoardCnt", num);
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return session.selectList(namespace + ".listCri", scri);
	}
	
	// 게시물 정렬결과 조회
	@Override
	public List<BoardVO> listAlign(SearchCriteria scri) throws Exception {
		return session.selectList(namespace + ".listAlign", scri);
	}

	// 주소 존재시 게시물 정렬결과 조회
	@Override
	public List<BoardVO> addrListAlign(SearchCriteria scri) throws Exception {

		return session.selectList(namespace + ".addrListAlign", scri);
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
	@Override
	public Integer checkThumb(int b_num, String id) {
		Map thuMap = new HashMap();
		thuMap.put("m_id", id);
		thuMap.put("b_num", b_num);

		return session.selectOne(namespace + ".checkThumb", thuMap);
	}

	@Override
	public void addThumb(int num) {
		session.update(namespace + ".addThumb", num);

	}

	@Override
	public void subThumb(int num) {
		session.update(namespace + ".subThumb", num);

	}

	@Override
	public void insertThumb(int b_num, int b_category, String m_id) {
		Map thuMap = new HashMap();
		thuMap.put("b_num", b_num);
		thuMap.put("b_category", b_category);
		thuMap.put("m_id", m_id);

		session.insert(namespace + ".insertThumb", thuMap);

	}

	@Override
	public void deleteThumb(int b_num, String id) {
		Map thuMap = new HashMap();
		thuMap.put("m_id", id);
		thuMap.put("b_num", b_num);

		session.delete(namespace + ".deleteThumb", thuMap);
	}


	@Override
	public List<BoardVO> searchList(String keyword) {
		return session.selectList(namespace + ".search", keyword);
	}

	@Override
	public int listCountAddr(SearchCriteria scri) throws Exception {

		return session.selectOne(namespace + ".listCountAddr", scri);
	}

	@Override
	public List<BoardVO> listAddr(SearchCriteria scri) throws Exception {
		return session.selectList(namespace + ".listCriAddr", scri);
	}

}
