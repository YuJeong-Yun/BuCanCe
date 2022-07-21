package com.bcc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.PreMemberVO;

//@Repository : 해당 클래스를 DAO로 스프링에서 인식하도록 하는 표시

@Repository
public class PreMemberDAOImpl implements PreMemberDAO {

	private static final Logger log = LoggerFactory.getLogger(PreOrderDAOImpl.class);

	// 디비연결 및 mapper 연결처리 객체
	@Inject
	private SqlSession sqlSession;
   
    private static final String NAMESPACE = "com.bcc.mapper.preMapper"; // preMapper


	// 프리미엄 멤버
		@Override
		public void insertPreMember(PreMemberVO vo) {
			
			log.info("insertPreMember(PreMemberVO vo) 실행");
			
			sqlSession.insert(NAMESPACE + ".insertPreMember", vo);
			
		}
		
		// 구독종료 회원 삭제
		@Override
		public void deletePreMember(PreMemberVO dpv) {

		
			sqlSession.delete(NAMESPACE + ".deletePreMember", dpv);

		}

		// 이름 가져오기
		@Override
		public String getName(String id) {
			
			return sqlSession.selectOne(NAMESPACE + ".getName", id);
		}

		// 전화 가져오기
		@Override
		public String getTel(String id) {
			
			return sqlSession.selectOne(NAMESPACE + ".getTel", id);
		}

		// 이메일 가져오기
		@Override
		public String getEmail(String id) {
			
			return sqlSession.selectOne(NAMESPACE + ".getEmail", id);
		}

}
