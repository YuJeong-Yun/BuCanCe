package com.bcc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bcc.domain.TourSpotVO;

@Repository
public class TourDAOImpl implements TourDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bcc.mapper.tourMapper";

	@Override
	public List<TourSpotVO> restaurantLists(String addr) {
		
		return sqlSession.selectList(NAMESPACE+".restaurantLists", addr);
	}

	@Override
	public TourSpotVO infoDetail(String title) {
		
		return sqlSession.selectOne(NAMESPACE+".infoDetail", title);
	}
	
	
	
}
