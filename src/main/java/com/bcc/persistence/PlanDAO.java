package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.MemberVO;

public interface PlanDAO {

	// 아이디 가진 회원 목록 가져오기
	public List<MemberVO> getMemberList(String id);

}
