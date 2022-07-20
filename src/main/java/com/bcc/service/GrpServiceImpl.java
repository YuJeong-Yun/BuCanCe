package com.bcc.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;
import com.bcc.persistence.GrpDAO;
import com.bcc.persistence.PlanDAO;

@Service
public class GrpServiceImpl implements GrpService {

	@Inject
	private GrpDAO dao;
	@Inject
	private PlanDAO planDao;

	@Override
	public List<MemberVO> getSearchMemList(String id) {
		return dao.getSearchMemList(id);
	}

	@Override
	public Integer calcGrpNum() {
		int num = 1;
		if (dao.getMaxGrpNum() != null) {
			num = dao.getMaxGrpNum() + 1;
		}

		return num;
	}

	@Override
	public String getLicense(String id) {
		int result = dao.getLicense(id);

		if (result == 0) {
			return "free";
		} else {
			return "premium";
		}
	}

	@Override
	public List<GrpAcceptVO> getGrpAcceptList(String receiver) {
		return dao.getGrpAcceptList(receiver);
	}

	@Override
	public void insertGrpMember(PlanMemberVO member) {
		dao.insertGrpMember(member);
	}

	@Override
	public void deleteInvitation(GrpAcceptVO vo) {
		dao.deleteInvitation(vo);
	}

	@Override
	public String getGrpName(int num) {
		return dao.getGrpName(num);
	}

	@Override
	public List<MemberVO> getGrpMemberList(int grp_num) {
		return dao.getGrpMemberList(grp_num);
	}

	@Override
	public void delGrpMember(PlanMemberVO vo) {
		dao.delGrpMember(vo);
	}

	@Override
	public String getLeader(int num) {
		return dao.getLeader(num);
	}

	@Override
	public List<GrpAcceptVO> getInvitingList(int grp_num) {
		return dao.getInvitingList(grp_num);
	}

	@Override
	public Integer inviteMember(GrpAcceptVO vo) {
		// 그룹 멤버 + 초대중 멤버 10명 이상이면 초대 불가
		if ((dao.getGrpMemberList(vo.getGrp_num()).size() + dao.getInvitingList(vo.getGrp_num()).size()) >= 10) {
			// 초대 실패하면 0 반환
			return 0;
		}
		// 이미 초대중인 회원일 경우
		if (dao.checkInviteMember(vo) == 1) {
			return -1;
		}
		// 초대 리스트에 추가
		dao.inviteMember(vo);

		// 초대 성공하면 1 반환
		return 1;

	}

	@Override
	public String getMemberName(String id) {
		return dao.getMemberName(id);
	}

	@Override
	public Integer inviteCancle(GrpAcceptVO vo) {

		// 이미 초대 수락한 상태이면
		PlanMemberVO member = new PlanMemberVO();
		member.setGrp_num(vo.getGrp_num());
		member.setId(vo.getReceiver());
		if (dao.checkGrpMember(member) == 1) {
			return 1;
		}

		// 초대 취소
		dao.inviteCancle(vo);
		return 0;
	}

	@Override
	public Integer checkGrpMember(PlanMemberVO vo) {
		return dao.checkGrpMember(vo);
	}

	@Override
	public void checkLeader(String id, int grpNum) {
		String leader = dao.getLeader(grpNum);

		// 회원이 해당 플랜의 리더이면
		if (id.equals(leader)) {
			// 다음 방장 아이디 가져오기
			String newLeader = dao.getNextLeader(grpNum);
			// 본인이 그룹의 마지막 멤버이면 플랜정보 완전 삭제
			if (newLeader == null) {
				// 초대중인 리스트 삭제
				dao.deleteInvitingList(grpNum);
				// 플랜 삭제
				planDao.delPlan(grpNum);

				return;
			}

			// 방장 새로 설정
			PlanVO plan = new PlanVO();
			plan.setLeader(newLeader);
			plan.setNum(grpNum);
			dao.updateLeader(plan);
		}
	}

	@Override
	public List<List<MemberVO>> getAllGrpMemberList(String id) {
		List<PlanVO> grpList = planDao.getPlanList(id);

		List<List<MemberVO>> allGrpMemberList = new ArrayList<>();
		// 소속 그룹의 모든 멤버 리스트 가져오기
		for (int i = 0; i < grpList.size(); i++) {
			List<MemberVO> memberList = dao.getGrpMemberList(grpList.get(i).getNum());
			allGrpMemberList.add(memberList);
		}
		return allGrpMemberList;
	}

	@Override
	public List<List<GrpAcceptVO>> getAllGrpInvitingList(String id) {
		List<PlanVO> grpList = planDao.getPlanList(id);

		List<List<GrpAcceptVO>> allGrpInvitingList = new ArrayList<>();
		// 소속 그룹의 모든 초대중 멤버 리스트 가져오기
		for (int i = 0; i < grpList.size(); i++) {
			List<GrpAcceptVO> invitingList = dao.getInvitingList(grpList.get(i).getNum());
			allGrpInvitingList.add(invitingList);
		}
		return allGrpInvitingList;
	}

}
