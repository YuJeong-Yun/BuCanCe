package com.bcc.service;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.SearchCriteria;

public interface MemberService {

	// 회원가입
	public void memberInsert(MemberVO vo);
	
	// 로그인
	public MemberVO loginCheck(MemberVO vo);
	
	// 회원정보 조회
	public MemberVO getMember(String id);
	
	// 회원정보 수정
	public Integer updateMember(MemberVO vo);
	
	// 회원정보 삭제
	public void deleteMember(MemberVO vo);

	// 회원정보 보관
	public void storageMember(MemberVO vo);
	
	// 회원목록 조회
	public List<MemberVO> getMemberList(String id);
	
	// 아이디 중복 확인
    public int idCheck(String id);
    
	// 라이센스 확인
    public int getLicense(String license);
    
    // license UP
    public void liUp(String id);
    
    // license Down
	public void liDown(String id);

	// 찜 목록 조회 //
	public List<BoardVO> getThumbList(SearchCriteria scri) throws Exception;
	public List<BoardVO> getSNSThumbList(SearchCriteria scri) throws Exception;
	
	// 찜 삭제
	public void deleteThumb(int b_num, String id) throws Exception;
	
	// 찜 목록 갯수 조회
	public Integer getThumbCount(String id);
	public Integer getSNSThumbCount(String id);
}
