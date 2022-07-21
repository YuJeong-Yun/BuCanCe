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
	public void modBoardCnt(Integer num) {
		session.update(namespace + ".modBoardCnt", num);
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> getList(SearchCriteria scri) throws Exception {

		
		return session.selectList(namespace + ".getList", scri);
	}
	
	// 게시물 정렬결과 조회
	@Override
	public List<BoardVO> getAlignList(SearchCriteria scri) throws Exception {
		
		return session.selectList(namespace + ".getAlignList", scri);
	}
	
	
	// 주소 존재시 게시물 정렬결과 조회
	@Override
	public List<BoardVO> getAlignListAddr(SearchCriteria scri) throws Exception {
		
		return session.selectList(namespace + ".getAlignListAddr", scri);
	}
	

	// 게시물 총 갯수
	@Override
	public int getCountList(SearchCriteria scri) throws Exception {
		
		return session.selectOne(namespace + ".getCountList", scri);
	}

	@Override
	public List<BoardVO> getList(int page, int size) throws Exception {
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
		return session.selectList(namespace + ".getList", param);
	}
	
	@Override
	public Integer getCheckThumb(int b_num, String id) {
		Map thuMap = new HashMap();
		thuMap.put("m_id", id);
		thuMap.put("b_num", b_num);
		
		return session.selectOne(namespace+".getCheckThumb",thuMap);
	}


	@Override
	public void modAddThumb(int num) {
		session.update(namespace+".modAddThumb", num);
		
	}


	@Override
	public void modSubThumb(int num) {
		session.update(namespace+".modSubThumb",num);
		
	}


	@Override
	public void putThumb(int b_num, int b_category, String m_id) {
		Map thuMap = new HashMap();
		thuMap.put("b_num", b_num);
		thuMap.put("b_category", b_category);
		thuMap.put("m_id", m_id);
		
		session.insert(namespace+".putThumb", thuMap);
		
	}


	@Override
	public void delThumb(int b_num, String id) {
		Map thuMap = new HashMap();
		thuMap.put("m_id", id);
		thuMap.put("b_num", b_num);
		
		session.delete(namespace+".delThumb",thuMap);
	}
	

	@Override
	public List<BoardVO> getSearchList(String keyword) {
		
		return session.selectList(namespace+".getSearchList",keyword);
	}

	@Override
	public int getCountListAddr(SearchCriteria scri) throws Exception {
		
		return session.selectOne(namespace+".getListCountAddr", scri);
	}

	@Override
	public List<BoardVO> getListAddr(SearchCriteria scri) throws Exception {
		
		return session.selectList(namespace+".getListAddr", scri);
	}
	
	
	

}
