package com.bcc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bcc.domain.BoardVO;

@Repository
public class TourDAOImpl implements TourDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bcc.mapper.BoardMapper";

	@Override
	public List<BoardVO> foodLists(String addr) {
		
		return sqlSession.selectList(NAMESPACE+".foodLists", addr);
	}

	@Override
	public BoardVO getFood(String title) {
		
		return sqlSession.selectOne(NAMESPACE+".getFood", title);
	}
	
	
	
}
