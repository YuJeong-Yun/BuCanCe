package com.bcc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.BoardVO;
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
		return sqlSession.selectList(NAMESPACE + ".getMemberList", id);
	}

	@Override
	public Integer getGrpNum() {
		return sqlSession.selectOne(NAMESPACE + ".getGrpNum");
	}

	@Override
	public void createGrp(PlanVO vo) {
		sqlSession.insert(NAMESPACE + ".createGrp", vo);
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
	public void insertGrpMember(PlanMemberVO member) {
		sqlSession.insert(NAMESPACE + ".insertGrpMember", member);
	}

	@Override
	public void deleteInvitation(GrpAcceptVO vo) {
		sqlSession.delete(NAMESPACE + ".deleteInvitation", vo);
	}

	@Override
	public List<PlanVO> getGrpList(String id) {
		return sqlSession.selectList(NAMESPACE + ".getGrpList", id);
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
	public void delPlanMem(PlanMemberVO vo) {
		sqlSession.delete(NAMESPACE + ".delPlanMem", vo);
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
	public void inviteMember(GrpAcceptVO vo) {
		sqlSession.insert(NAMESPACE + ".inviteMember", vo);
	}

	@Override
	public String getName(String id) {
		return sqlSession.selectOne(NAMESPACE + ".getName", id);
	}

	@Override
	public void inviteCancle(GrpAcceptVO vo) {
		sqlSession.delete(NAMESPACE + ".inviteCancle", vo);
	}

	@Override
	public int checkGrpMember(PlanMemberVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".checkGrpMember", vo);
	}

	@Override
	public String getNextLeader(int grp_num) {
		return sqlSession.selectOne(NAMESPACE + ".getNextLeader", grp_num);
	}

	@Override
	public void updateLeader(PlanVO plan) {
		sqlSession.update(NAMESPACE + ".updateLeader", plan);
	}

	@Override
	public List<BoardVO> getTourList() {
		return sqlSession.selectList(NAMESPACE + ".getTourList");
	}

	@Override
	public List<BoardVO> getRestaurantList() {
		return sqlSession.selectList(NAMESPACE + ".getRestaurantList");
	}

	@Override
	public List<BoardVO> getTourSearch(String keyword) {
		return sqlSession.selectList(NAMESPACE + ".getTourSearch", keyword);
	}

	@Override
	public List<BoardVO> getRestaurantSearch(String keyword) {
		return sqlSession.selectList(NAMESPACE + ".getRestaurantSearch", keyword);
	}

	@Override
	public void modifyPlan(PlanVO vo) {
		sqlSession.update(NAMESPACE + ".modifyPlan", vo);
	}

	@Override
	public BoardVO getTourInfo(int num) {
		return sqlSession.selectOne(NAMESPACE + ".getTourInfo", num);
	}

	@Override
	public BoardVO getRestaurantInfo(int num) {
		return sqlSession.selectOne(NAMESPACE + ".getRestaurantInfo", num);
	}

	@Override
	public void delPlan(int num) {
		sqlSession.delete(NAMESPACE + ".delPlan", num);
	}

	@Override
	public void deleteInvitingList(int grp_num) {
		sqlSession.delete(NAMESPACE + ".deleteInvitingList", grp_num);
	}

	@Override
	public PlanVO getPlanInfo(int num) {
		return sqlSession.selectOne(NAMESPACE + ".getPlanInfo", num);
	}
}
