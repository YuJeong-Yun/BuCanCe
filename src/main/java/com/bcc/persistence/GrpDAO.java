package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;

public interface GrpDAO {
	// 아이디 검색 결과 회원 목록 가져오기
	public List<MemberVO> getSearchMemList(String id);

	// 그룹 번호 계산
	public Integer getMaxGrpNum();

	// 회원 라이센스 가져오기
	public Integer getLicense(String id);

	// 회원 그룹 초대받은 목록
	public List<GrpAcceptVO> getGrpAcceptList(String receiver);

	// 회원이 소속된 그룹 정보 저장
	public void insertGrpMember(PlanMemberVO member);

	// 그룹 초대 수락 리스트에서 제거
	public void deleteInvitation(GrpAcceptVO vo);

	// 그룹의 초대 리스트 모두 삭제
	public void deleteInvitingList(int grp_num);
	
	// 그룹 이름 가져오기
	public String getGrpName(int num);

	// 그룹에 소속된 멤버 리스트 가져오기
	public List<MemberVO> getGrpMemberList(int grp_num);

	// 그룹 멤버 삭제
	public void delGrpMember(PlanMemberVO vo);

	// 방장 정보 가져오기
	public String getLeader(int num);

	// 해당 그룹의 초대 멤버 리스트
	public List<GrpAcceptVO> getInvitingList(int grp_num);

	// 그룹에 멤버 초대
	public void inviteMember(GrpAcceptVO vo);

	// 회원 이름 가져오기
	public String getMemberName(String id);

	// 초대 취소
	public void inviteCancle(GrpAcceptVO vo);
	
	// 그룹 멤버인지 확인
	public int checkGrpMember(PlanMemberVO vo);

	// 다음 방장 아이디 가져오기
	public String getNextLeader(int grp_num);

	// 방장 새로 설정
	public void updateLeader(PlanVO plan);
}
