package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.SearchCriteria;

public interface MemberDAO {
	
	// 회원수 가져오기
	public Integer getMemberCount();

	// 회원가입
	public void putInsertMember(MemberVO vo);
	
	// 로그인
	public MemberVO getLogin(MemberVO vo);
	
	// 회원정보 수정(이름,이메일,수정일)
	public Integer modMember(MemberVO vo);
	
	// 회원정보 삭제
	public void delMember(MemberVO vo);

	// 회원정보 보관
	public void putStorageMember(MemberVO vo);
	
	// 회원정보 조회
	public MemberVO getMember(String id);
	
	// 전체 회원정보 조회
	public List<MemberVO> getMemberList(String adminID);
	
	// sns email 조회
	public MemberVO getEmail(String email);
	
	// id 중복 검사
    public int getIdCheck(String id);
    
	// 라이센스 조회
	public int getLicense(String license);
    
    // license up
    public void modLicenseUp(String id);
    
    // license down
    public void modLicenseDown(String id);
    
	// 좋아요 목록 조회
	public List<BoardVO> getThumbList(SearchCriteria scri) throws Exception;
	public List<BoardVO> getSNSThumbList(SearchCriteria scri) throws Exception;
	
	// 좋아요 삭제
	public void delThumb(int b_num, String id) throws Exception;
	
	// 좋아요 갯수 조회
	public Integer getThumbCount(String id);
	public Integer getSNSThumbCount(String id);

}