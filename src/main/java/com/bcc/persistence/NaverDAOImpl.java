package com.bcc.persistence;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bcc.domain.NaverVO;

@Repository
public class NaverDAOImpl implements NaverDAO {
	
	// 디비 연결정보가 필요하다. => 의존 주입
	@Inject
	private SqlSession sqlSession;
	// DB연결,자원해제,SQL실행
	
	private static final String NAMESPACE="com.bcc.mapper.memberMapper";
	
	@Override
	public void naverInsert(HashMap<String, Object> userInfo) {
		sqlSession.insert(NAMESPACE+".naverInsert",userInfo);
		
	}

	@Override
	public NaverVO findnaver(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		return sqlSession.selectOne(NAMESPACE+".findnaver", userInfo);
	}
	
}
