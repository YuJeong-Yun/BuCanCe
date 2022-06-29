package com.bcc.service;

import java.util.List;

import com.bcc.domain.MemberVO;

public interface PlanService {

	// 아이디 가진 회원 목록 가져오기
	public List<MemberVO> getMemberList(String id);
	
	// 해당 아이디 소속 그룹 수 가져오기
	public Integer getMemberGrpCnt(String id);

}
