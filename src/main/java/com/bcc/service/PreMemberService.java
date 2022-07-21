package com.bcc.service;

import com.bcc.domain.PreMemberVO;

public interface PreMemberService {

	// 프리미엄 회원
	public void insertPreMember(PreMemberVO vo);

	// 구독종료 회원 삭제
	public void deletePreMember(PreMemberVO dpv);

	// 이름 가져오기
	public String getName(String id);

	// 휴대전화 가져오기
	public String getTel(String id);

	// 이메일 가져오기
	public String getEmail(String id);

}
