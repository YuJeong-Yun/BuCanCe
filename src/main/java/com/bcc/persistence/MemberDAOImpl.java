package com.bcc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.BoardVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.ThumbVO;

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
	private static final String NAMESPACE="com.bcc.mapper.memberMapper";

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

	@Override
	public MemberVO getEmail(String email) {
		
		logger.info(" getEmail(email) ");
		
		MemberVO vo = sqlSession.selectOne(NAMESPACE+".getEmail", email);
		
		return vo;
	}

	@Override
	public int idCheck(String id) {
		
        int cnt = sqlSession.selectOne(NAMESPACE+".idCheck", id);
        
        return cnt;
	}
	

	@Override
	public int getLicense(String license) {
		
		logger.info(" getLicense(license) ");
		
		int liCnt = sqlSession.selectOne(NAMESPACE+".liCheck", license);
		
		return liCnt;
	}

	@Override
	public void licenseUp(String license) {
		
		logger.info(" licenseUp(String license) 호출 ");
		
		sqlSession.update(NAMESPACE+".licenseUp", license);
		
	}

	
	@Override
	public void licenseDown(String license) {
		
		logger.info(" licenseDown(String license) 호출 ");
		
		sqlSession.update(NAMESPACE+".licenseDown", license);
		
	}
	
	@Override
	public List<BoardVO> thumbListAll() throws Exception {
		
		List<BoardVO> thumbList = sqlSession.selectList(NAMESPACE+".thumbList");
		
		return thumbList;
	}
	

	// 게시물 목록 조회
	@Override
	public List<BoardVO> thumbList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".thumbList", id);
	}

	@Override
	public void deleteThumb(int b_num) throws Exception {
		
		sqlSession.delete(NAMESPACE+".deleteThumb", b_num);
	}
	
	
	
}
