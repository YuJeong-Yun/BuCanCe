package com.bcc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class BoardDAOImpl implements BoardDAO{
	
	// DB접근을 위해 필요한 객체
	@Inject
	private SqlSession session;
	
	
	// mapper의 위치 정보 저장
	private static final String namespace = "com.bcc.mapper.BoardMapper";


	@Override
	public Integer checkThumb(String id) {
		
		return null;
	}
	
	


}
