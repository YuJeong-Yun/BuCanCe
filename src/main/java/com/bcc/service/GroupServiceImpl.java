package com.bcc.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.MemberVO;
import com.bcc.persistence.GroupDAO;

@Service
public class GroupServiceImpl implements GroupService {
	
	private static final Logger log = LoggerFactory.getLogger(GroupServiceImpl.class);
	
	@Inject
	private GroupDAO dao;

	@Override
	public List<MemberVO> getMemberList(String id) {
		return dao.getMemberList(id);
	}

	@Override
	public Integer getMemberGrpCnt(String id) {
		
		return null;
	}
}
