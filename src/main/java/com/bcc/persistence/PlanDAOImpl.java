package com.bcc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.MemberVO;

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
}
