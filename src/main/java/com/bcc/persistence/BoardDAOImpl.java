package com.bcc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class BoardDAOImpl implements BoardDAO{
	
	// DB������ ���� �ʿ��� ��ü
	@Inject
	private SqlSession session;
	
	
	// mapper�� ��ġ ���� ����
	private static final String namespace = "com.bcc.mapper.BoardMapper";


	@Override
	public Integer checkThumb(String id) {
		
		return null;
	}
	
	


}
