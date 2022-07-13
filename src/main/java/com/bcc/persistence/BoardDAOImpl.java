package com.bcc.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	// DB접근을 위해 필요한 객체
	@Inject
	private SqlSession session;
	
	
	// mapper의 위치 정보 저장
	private static final String namespace = "com.bcc.mapper.BoardMapper";


	@Override
	public Integer checkThumb(int b_num, String id) {
		Map thuMap = new HashMap();
		thuMap.put("m_id", id);
		thuMap.put("b_num", b_num);
		
		return session.selectOne(namespace+".checkThumb",thuMap);
	}


	@Override
	public void addThumb(int num) {
		session.update(namespace+".addThumb", num);
		
	}


	@Override
	public void subThumb(int num) {
		session.update(namespace+".subThumb",num);
		
	}


	@Override
	public void insertThumb(int b_num, int b_category, String m_id) {
		Map thuMap = new HashMap();
		thuMap.put("b_num", b_num);
		thuMap.put("b_category", b_category);
		thuMap.put("m_id", m_id);
		
		session.insert(namespace+".insertThumb", thuMap);
		
	}


	@Override
	public void deleteThumb(int b_num, String id) {
		Map thuMap = new HashMap();
		thuMap.put("m_id", id);
		thuMap.put("b_num", b_num);
		
		session.delete(namespace+".deleteThumb",thuMap);
	}
	
	


}
