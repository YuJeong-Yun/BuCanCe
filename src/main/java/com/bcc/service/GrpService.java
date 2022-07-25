package com.bcc.service;

import java.util.List;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;

public interface GrpService {
	// 아이디 검색 결과 회원 목록 가져오기
	public List<MemberVO> getSearchMemList(String id);

	// 다음 그룹 번호 계산
	public Integer calcGrpNum();

	// 회원 라이센스 가져오기
	public String getLicense(String id);

	// 회원 초대받은 목록
	public List<GrpAcceptVO> getGrpAcceptList(String receiver);

	// 회원이 소속된 그룹 정보 저장
	public void insertGrpMember(PlanMemberVO member);

	// 그룹 이름 가져오기
	public String getGrpName(int num);

	// 그룹의 멤버 리스트 가져오기
	public List<MemberVO> getGrpMemberList(int grp_num);

	// 그룹 멤버 삭제
	public void delGrpMember(PlanMemberVO vo);

	// 방장 정보 가져오기
	public String getLeader(int num);

	// 해당 그룹의 초대 중인 멤버
	public List<GrpAcceptVO> getInvitingList(int grp_num);

	// 그룹에 멤버 초대
	public String inviteMember(GrpAcceptVO vo);

	// 회원 이름 가져오기
	public String getMemberName(String id);

	// 초대 취소
	public Integer inviteCancle(GrpAcceptVO vo);
	
	// 초대 리스트에서 제거 (초대 수락했을 때)
	public void delInvitation(GrpAcceptVO vo);

	// 그룹 회원인지 확인
	public Integer checkGrpMember(PlanMemberVO vo);

	// 방장 여부에 따라 방장 새로 설정
	public void checkLeader(String id, int grpNum);

	// 회원이 속한 모든 그룹의 멤버 리스트 가져오기
	public List<List<MemberVO>> getAllGrpMemberList(String id);

	// 회원이 속한 모든 그룹의 초대중 멤버 리스트 가져오기
	public List<List<GrpAcceptVO>> getAllGrpInvitingList(String id);

}
