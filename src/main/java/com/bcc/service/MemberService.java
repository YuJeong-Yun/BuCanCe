package com.bcc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bcc.domain.LikeVO;
import com.bcc.domain.MemberVO;


public interface MemberService {

	// 회원가입
	public void memberInsert(MemberVO vo);
	
	// 로그인
	public MemberVO loginCheck(MemberVO vo);
	//public MemberVO loginCheck(String id,String pw);
	
	// 회원정보 조회
	public MemberVO getMember(String id);
	
	// 회원정보 수정
	public Integer updateMember(MemberVO vo);
	
	// 회원정보 삭제
	public void deleteMember(MemberVO vo);
	
	// 회원목록 조회
	public List<MemberVO> getMemberList(String id);
	
	// 아이디 중복 확인
    public int idCheck(String id);
    
    // license UP
    public int liUp(String id);
    
    // license Down
	public int liDown(String id);
    
    
    
}
