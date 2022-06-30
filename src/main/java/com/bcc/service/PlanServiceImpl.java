package com.bcc.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;
import com.bcc.persistence.PlanDAO;

@Service
public class PlanServiceImpl implements PlanService {
	
	private static final Logger log = LoggerFactory.getLogger(PlanServiceImpl.class);
	
	@Inject
	private PlanDAO dao;

	@Override
	public List<MemberVO> getMemberList(String id) {
		return dao.getMemberList(id);
	}

	@Override
	public Integer getGrpNum() {
		return dao.getGrpNum();
	}

	@Override
	public void createGrp(PlanVO vo) {
		dao.createGrp(vo);
	}

	@Override
	public String getLicense(String id) {
		return dao.getLicense(id);
	}

	@Override
	public List<GrpAcceptVO> getGrpAcceptList(String receiver) {
		return dao.getGrpAcceptList(receiver);
	}

	@Override
	public void insertGrpMember(PlanMemberVO member) {
		dao.insertGrpMember(member);
	}

	@Override
	public void deleteInvitation(GrpAcceptVO vo) {
		dao.deleteInvitation(vo);
	}

	@Override
	public List<PlanMemberVO> getMemberGrpList(String id) {
		return dao.getMemberGrpList(id);
	}


}
