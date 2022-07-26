package com.bcc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.BoardVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.SearchCriteria;

// @Repository : 해당 클래스를 DAO로 스프링에서 인식하도록 하는 표시

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	// 디비 연결정보가 필요하다. => 의존 주입
	@Inject
	private SqlSession sqlSession;
	// DB연결,자원해제,SQL실행

	// mapper의 위치값(주소) 이름
	private static final String NAMESPACE = "com.bcc.mapper.memberMapper";

	@Override
	public Integer getMemberCount() {

		Integer cnt = sqlSession.selectOne(NAMESPACE + ".getCountMember");

		return cnt;
	}

	@Override
	public void putInsertMember(MemberVO vo) {

		System.out.println(" DAO : 회원가입 실행");
		logger.info(" 회원가입 실행! ");

		// insert SQL구문 호출
		sqlSession.insert(NAMESPACE + ".putInsertMember", vo);

		System.out.println(" DAO : 회원가입 완료 ");
		logger.info(" 회원가입 완료!!! ");

	}

	@Override
	public MemberVO getLogin(MemberVO vo) {

		logger.info(" loginMember() 동작 호출 ");

		MemberVO resultVO = sqlSession.selectOne(NAMESPACE + ".getLogin", vo);

		logger.info(" 로그인 체크완료, " + resultVO);
		logger.info(" 테스트파일로 이동 ");

		return resultVO;
	}

	@Override
	public Integer modMember(MemberVO vo) {

		logger.info(" 수정 정보를 전달받아서 sql 호출 ");

		int resultCnt = sqlSession.update(NAMESPACE + ".modMember", vo);

		return resultCnt;
	}

	@Override
	public void delMember(MemberVO vo) {

		sqlSession.delete(NAMESPACE + ".delMember", vo);

	}
	
	
	@Override
	public int delCheck(MemberVO vo) {
		
		int cnt = sqlSession.selectOne(NAMESPACE + ".delCheck", vo);

		return cnt;
	}

	@Override
	public void putStorageMember(MemberVO vo) {

		sqlSession.insert(NAMESPACE + ".putStorageMember", vo);
		
	}

	@Override
	public MemberVO getMember(String id) {

		logger.info(" getMember(id) ");

		MemberVO vo = sqlSession.selectOne(NAMESPACE + ".getMember", id);

		return vo;
	}

	@Override
	public List<MemberVO> getMemberList(String adminID) {

		logger.info(" getMemberList(String adminID) 호출 ");

		return sqlSession.selectList(NAMESPACE + ".getMemberList", adminID);
	}

	@Override
	public int getIdCheck(String id) {

		int cnt = sqlSession.selectOne(NAMESPACE + ".getIdCheck", id);

		return cnt;
	}
	
	@Override
	public int getSnsCheck(String sns) {
		
		int cnt = sqlSession.selectOne(NAMESPACE + ".getSnsCheck", sns);

		return cnt;
	}

	@Override
	public int getTelCheck(String tel) {
		
		int cnt = sqlSession.selectOne(NAMESPACE + ".getTelCheck", tel);

		return cnt;
	}

	@Override
	public int getEmailCheck(String email) {
		
		int cnt = sqlSession.selectOne(NAMESPACE + ".getEmailCheck", email);

		return cnt;
	}

	@Override
	public int getLicense(String license) {

		logger.info(" getLicense(license) ");

		int liCnt = sqlSession.selectOne(NAMESPACE + ".liCheck", license);

		return liCnt;
	}

	@Override
	public void modLicenseUp(String id) {

		logger.info(" licenseUp(String license) 호출 ");

		sqlSession.update(NAMESPACE + ".modLicenseUp", id);

	}

	@Override
	public void modLicenseDown(String id) {

		logger.info(" licenseDown(String license) 호출 ");

		sqlSession.update(NAMESPACE + ".modLicenseDown", id);

	}
	// 게시물 목록 조회
	@Override
	public List<BoardVO> getThumbList(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getThumbList", scri);
	}

	@Override
	public List<BoardVO> getSNSThumbList(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getSNSThumbList", scri);
	}

	@Override
	public void delThumb(int b_num, String id) throws Exception {
		Map thuMap = new HashMap();
		thuMap.put("b_num", b_num);
		thuMap.put("m_id", id);

		sqlSession.delete(NAMESPACE + ".delThumb", thuMap);
	}

	@Override
	public Integer getThumbCount(String id) {
		
		return sqlSession.selectOne(NAMESPACE+".getThumbCount",id);
	}

	@Override
	public Integer getSNSThumbCount(String id) {
		
		return sqlSession.selectOne(NAMESPACE+".getSNSThumbCount",id);
	}
	
	// 카카오
	@Override
	public void putKakao(HashMap<String, Object> userInfo) {
		sqlSession.insert(NAMESPACE+".putKakao",userInfo);
		
	}

	@Override
	public MemberVO getKakao(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("name"));
		System.out.println("RE:"+userInfo.get("email"));
		return sqlSession.selectOne(NAMESPACE+".getKakao", userInfo);
	}
	
	
}
