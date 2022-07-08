package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.MemberVO;

public interface MemberDAO {
	
	// 시간정보 가져오기
	public String getTime();
	
	// 회원수 가져오기
	public Integer getMemberCount();

	// 회원가입
	public void insertMember(MemberVO vo);
	
	// 로그인
	public MemberVO loginMember(MemberVO vo);
	
//	// 로그인2
//	public MemberVO loginMember(String id,String pw);
	
	// 회원정보 수정(이름,이메일,수정일)
	public Integer updateMember(MemberVO vo);
	
	// 회원정보 삭제
	public void deleteMember(MemberVO dvo);
	
	// 회원정보 조회
	public MemberVO getMember(String id);
	
	// 전체 회원정보 조회
	public List<MemberVO> getMemberList(String adminID);
	
	// sns email 조회
	public MemberVO getEmail(String email);
	
	// id 중복 검사
    public int idCheck(String id);
    
    // license up
    public int licenseUp(String license);
    
    // license down
    public int licenseDown(String license);

}