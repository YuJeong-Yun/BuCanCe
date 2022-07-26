package com.bcc.persistence;

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
public class GrpDAOImpl implements GrpDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.bcc.mapper.groupMapper";

	@Override
	public List<MemberVO> getSearchMemList(String id) {
		return sqlSession.selectList(NAMESPACE + ".getSearchMemList", id);
	}

	@Override
	public Integer getMaxGrpNum() {
		return sqlSession.selectOne(NAMESPACE + ".getMaxGrpNum");
	}

	@Override
	public Integer getLicense(String id) {
		return sqlSession.selectOne(NAMESPACE + ".getLicense", id);
	}

	@Override
	public List<GrpAcceptVO> getGrpAcceptList(String receiver) {
		return sqlSession.selectList(NAMESPACE + ".getGrpAcceptList", receiver);
	}

	@Override
	public void putGrpMember(PlanMemberVO member) {
		sqlSession.insert(NAMESPACE + ".putGrpMember", member);
	}

	@Override
	public void delInvitation(GrpAcceptVO vo) {
		sqlSession.delete(NAMESPACE + ".delInvitation", vo);
	}

	@Override
	public void delInvitingList(int grp_num) {
		sqlSession.delete(NAMESPACE + ".delInvitingList", grp_num);
	}

	@Override
	public String getGrpName(int num) {
		return sqlSession.selectOne(NAMESPACE + ".getGrpName", num);
	}

	@Override
	public List<MemberVO> getGrpMemberList(int grp_num) {
		return sqlSession.selectList(NAMESPACE + ".getGrpMemberList", grp_num);
	}

	@Override
	public void delGrpMember(PlanMemberVO vo) {
		sqlSession.delete(NAMESPACE + ".delGrpMember", vo);
	}

	@Override
	public String getLeader(int num) {
		return sqlSession.selectOne(NAMESPACE + ".getLeader", num);
	}

	@Override
	public List<GrpAcceptVO> getInvitingList(int grp_num) {
		return sqlSession.selectList(NAMESPACE + ".getInvitingList", grp_num);
	}

	@Override
	public void putInviteMember(GrpAcceptVO vo) {
		sqlSession.insert(NAMESPACE + ".putInviteMember", vo);
	}
	
	@Override
	public Integer getCheckInviteMember(GrpAcceptVO vo) {
		return sqlSession.selectOne(NAMESPACE+".getCheckInviteMember", vo);
	}

	@Override
	public String getMemberName(String id) {
		return sqlSession.selectOne(NAMESPACE + ".getMemberName", id);
	}

	@Override
	public int getCheckGrpMember(PlanMemberVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".getCheckGrpMember", vo);
	}

	@Override
	public String getNextLeader(int grp_num) {
		return sqlSession.selectOne(NAMESPACE + ".getNextLeader", grp_num);
	}

	@Override
	public void modLeader(PlanVO plan) {
		sqlSession.update(NAMESPACE + ".modLeader", plan);
	}


}
