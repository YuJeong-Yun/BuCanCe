package com.bcc.persistence;




import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.roomPayVO;


@Repository
public class roomDAOImpl implements roomDAO {

	private static final Logger log = LoggerFactory.getLogger(roomDAOImpl.class);

	// 디비 연결정보가 필요하다. => 의존 주입
	@Inject
	private SqlSession sqlSession;
	// DB연결,자원해제,SQL실행
		
	//mapper의 위치값(주소) 이름
	private static final String NAMESPACE="com.bcc.mapper.RoomMapper";
	
	
	
	
	@Override
	public void roomPaySuc(roomPayVO vo) {
		
		 sqlSession.selectOne(NAMESPACE+".insertRoom",vo);
		
	}

	
	
	
}


