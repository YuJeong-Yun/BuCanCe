package com.bcc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.PremiumOrderVO;

@Repository
public class PreOrderDAOImpl implements PreOrderDAO {

	private static final Logger log = LoggerFactory.getLogger(PreOrderDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.bcc.mapper.testMapper";

	/////////////////

	// 정기결제
			@Override
			public void insertOrder(PremiumOrderVO pvo) {
				
				sqlSession.insert(NAMESPACE+".insertOrder", pvo);
				
			}

			// 정기결제 (재결제) 저장
			@Override
			public void ReOrder(PremiumOrderVO rvo) {
				sqlSession.insert(NAMESPACE+".ReOrder", rvo);
				
			}


			// 빌링키 가져오기 
			@Override
			public String getKey(String id) {

				return sqlSession.selectOne(NAMESPACE + ".getKey", id);
			}

			// 결제 정지(빌링키 삭제)
			@Override
			public void deleteKey(PremiumOrderVO dvo) {
				
				sqlSession.selectOne(NAMESPACE + ".deleteKey", dvo);
				
			}
	

}
