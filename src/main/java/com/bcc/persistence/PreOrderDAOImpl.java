package com.bcc.persistence;

import javax.inject.Inject;
import javax.sound.midi.MidiDevice.Info;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.PreOrderVO;

//@Repository : 해당 클래스를 DAO로 스프링에서 인식하도록 하는 표시

@Repository
public class PreOrderDAOImpl implements PreOrderDAO {

	private static final Logger log = LoggerFactory.getLogger(PreOrderDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.bcc.mapper.preMapper";

	/////////////////

	// 정기결제
			@Override
			public void putOrder(PreOrderVO pvo) {
				log.info("putOrder(PreOrderVO pvo) 실행");
				
				
				sqlSession.insert(NAMESPACE+".putOrder", pvo);
				
			}

			// 정기결제 (재결제) 저장
			@Override
			public void putReOrder(PreOrderVO rvo) {
				sqlSession.update(NAMESPACE+".putReOrder", rvo);
				
			}


			// 빌링키 가져오기 
			@Override
			public String getKey(PreOrderVO vo) {

				return sqlSession.selectOne(NAMESPACE + ".getKey", vo);
			}

			// 결제 정지(빌링키 삭제)
			@Override
			public void delKey(PreOrderVO dvo) {
				
				sqlSession.selectOne(NAMESPACE + ".delKey", dvo);
				
			}
	

}
