package com.bcc.persistence;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;

@Repository
public class PlanDAOImpl implements PlanDAO {

	private static final Logger log = LoggerFactory.getLogger(PlanDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.bcc.mapper.groupMapper";

	@Override
	public List<MemberVO> getMemberList(String id) {
		List<MemberVO> memberList = sqlSession.selectList(NAMESPACE+".getMemberList", id);
		
		return memberList;
	}

	@Override
	public Integer getGrpNum() {
		return sqlSession.selectOne(NAMESPACE+".getGrpNum");
	}

	@Override
	public void createGrp(PlanVO vo) {
		sqlSession.insert(NAMESPACE+".createGrp", vo);
	}

	@Override
	public String getLicense(String id) {
		return sqlSession.selectOne(NAMESPACE+".getLicense", id);
	}

	@Override
	public List<GrpAcceptVO> getGrpAcceptList(String receiver) {
		return sqlSession.selectList(NAMESPACE+".getGrpAcceptList", receiver);
	}

	@Override
	public void insertGrpMember(PlanMemberVO member) {
		sqlSession.insert(NAMESPACE+".insertGrpMember", member);
	}

	@Override
	public void deleteInvitation(GrpAcceptVO vo) {
		sqlSession.delete(NAMESPACE+".deleteInvitation", vo);
	}

	@Override
	public List<PlanMemberVO> getMemberGrpList(String id) {
		return sqlSession.selectList(NAMESPACE+".getMemberGrpList", id);
	}

	@Override
	public String getGrpName(int num) {
		return sqlSession.selectOne(NAMESPACE+".getGrpName", num);
	}

	

}
