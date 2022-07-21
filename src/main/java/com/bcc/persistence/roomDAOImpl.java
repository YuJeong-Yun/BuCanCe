package com.bcc.persistence;




import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomRefundVO;


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
	public void putPaymentRoom(roomPayVO vo) {
		
		 sqlSession.insert(NAMESPACE+".putPaymentRoom",vo);
		
	}


	@Override
	public roomPayVO getReInfo(String accId) {
		return sqlSession.selectOne(NAMESPACE+".getReInfo",accId);
	}


	@Override
	public List<roomPayVO> getRoomReInfo(String id) {
		return sqlSession.selectList(NAMESPACE+".getRoomReInfo",id);
	}


	@Override
	public String getMaxReRoom() {
		return sqlSession.selectOne(NAMESPACE+".getMaxReRoom");
	}


	@Override
	public void modReStatus(String accId) {
		sqlSession.update(NAMESPACE+".modReStatus",accId);
	}

	@Override
	public String getMaxRefund() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getMaxRefund");
	}

	@Override
	public void putRfRoom(roomRefundVO vo2) {
		sqlSession.insert(NAMESPACE+".putRfRoom",vo2);
	}



	
	
	
}


