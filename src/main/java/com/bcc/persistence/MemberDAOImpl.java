package com.bcc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.MemberVO;

// @Repository : 해당 클래스를 DAO로 스프링에서 인식하도록 하는 표시

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(MemberDAOImpl.class);
	
	// 디비 연결정보가 필요하다. => 의존 주입
	@Inject
	private SqlSession sqlSession;
	// DB연결,자원해제,SQL실행

	// mapper의 위치값(주소) 이름
	private static final String NAMESPACE="com.bcc.mapper.MemberMapper";

	@Override
	public String getTime() {
		
		// selectOne(SQL 구문:mapper네임스페이스.sql구문아이디) : SQL실행 결과를 하나 가져오는 동작
		// selectOne(SQL 구문,전달값)
		String time = sqlSession.selectOne(NAMESPACE+".getTime");
		//sqlSession.selectOne("com.itwillbs.mapper.MemberMapper.getTime");
		
		return time;
	}

	@Override
	public Integer getMemberCount() {
		// DAO-sql 호출
		
		Integer cnt = sqlSession.selectOne(NAMESPACE+".countMember");
		
		return cnt;
	}

	@Override
	public void insertMember(MemberVO vo) {
		
		System.out.println(" DAO : 회원가입 실행");
		logger.info(" 회원가입 실행! ");
		
		// insert SQL구문 호출
		sqlSession.insert(NAMESPACE+".insertMember", vo);
		
		System.out.println(" DAO : 회원가입 완료 ");
		logger.info(" 회원가입 완료!!! ");
		
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		
		logger.info(" loginMember() 동작 호출 ");
		
		MemberVO resultVO = sqlSession.selectOne(NAMESPACE+".login",vo);
		
		logger.info(" 로그인 체크완료, "+resultVO);	
		logger.info(" 테스트파일로 이동 ");
		
		return resultVO;
	}

	@Override
	public MemberVO loginMember(String id, String pw) {
		// id,pw는 vo에 저장불가능한 상황(가정)
		
		//sqlSession.selectOne(NAMESPACE+".login", id, pw);
		// Map 을 사용하여  key,value 쌍으로 저장
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("pw", pw);	
		
		logger.info(paramMap.toString());
		
		return sqlSession.selectOne(NAMESPACE+".login",paramMap);
	}

	
	
	@Override
	public Integer updateMember(MemberVO vo) {
		
		logger.info(" 수정 정보를 전달받아서 sql 호출 ");
		
		int resultCnt = sqlSession.update(NAMESPACE+".update",vo);
		
		return resultCnt;
	}

	@Override
	public void deleteMember(MemberVO dvo) {
		
		sqlSession.delete(NAMESPACE+".delete", dvo);
		
	}

	@Override
	public MemberVO getMember(String id) {
		
		logger.info(" getMember(id) ");
		
		MemberVO vo = sqlSession.selectOne(NAMESPACE+".getMember", id);
		
		return vo;
	}

	@Override
	public List<MemberVO> getMemberList(String adminID) {
		
		logger.info(" getMemberList(String adminID) 호출 ");
		
		// mapper에 해당 sql구문 호출
		// => mapper결과를 List형태로 리턴하겠다
		//List memberList = sqlSession.selectList(adminID, adminID);
		//return memberList;
		
		return sqlSession.selectList(NAMESPACE+".memberList", adminID);
	}
	
	
	
}
