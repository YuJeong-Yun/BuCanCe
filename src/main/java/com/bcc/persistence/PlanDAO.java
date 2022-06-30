package com.bcc.persistence;

import java.sql.Date;
import java.util.List;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;

public interface PlanDAO {

	// 아이디 가진 회원 목록 가져오기
	public List<MemberVO> getMemberList(String id);

	// 그룹 번호 계산
	public Integer getGrpNum();

	// 그룹 생성
	public void createGrp(PlanVO vo);

	// 회원 라이센스 가져오기
	public String getLicense(String id);

	// 회원 그룹 초대받은 목록
	public List<GrpAcceptVO> getGrpAcceptList(String receiver);

	// 회원이 소속된 그룹 정보 저장
	public void insertGrpMember(PlanMemberVO member);

	// 그룹 초대 수락 리스트에서 제거
	public void deleteInvitation(GrpAcceptVO vo);

	// 소속된 그룹 리스트 가져오기
	public List<PlanMemberVO> getMemberGrpList(String id);

	// 그룹 이름 가져오기
	public String getGrpName(int num);

}
