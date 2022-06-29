package com.bcc.service;

import java.util.List;

import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanVO;

public interface PlanService {

	// 아이디 가진 회원 목록 가져오기
	public List<MemberVO> getMemberList(String id);
	
	// 그룹 번호 계산
	public Integer getGrpNum();

	// 그룹 생성
	public void createGrp(PlanVO vo);

}
