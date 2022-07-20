package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.SearchCriteria;

public interface MemberDAO {
	
	// 시간정보 가져오기
	public String getTime();
	
	// 회원수 가져오기
	public Integer getMemberCount();

	// 회원가입
	public void insertMember(MemberVO vo);
	
	// 로그인
	public MemberVO loginMember(MemberVO vo);
	
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
    
	// 라이센스 조회
	public int getLicense(String license);
    
    // license up
    public void licenseUp(String license);
    
    // license down
    public void licenseDown(String license);
    
	// 좋아요 리스트
	public List<BoardVO> thumbListAll() throws Exception;
	
	// 게시물 목록 조회
	public List<BoardVO> thumbList(String id) throws Exception;
	
	// 좋아요 삭제
	public void deleteThumb(int b_num) throws Exception;

}