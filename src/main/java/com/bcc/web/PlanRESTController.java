package com.bcc.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.HotelVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;
import com.bcc.service.PlanService;

@RestController
@RequestMapping("/planREST/*")
public class PlanRESTController {

	private static final Logger log = LoggerFactory.getLogger(PlanRESTController.class);

	// 서비스 객체 주입
	@Inject
	private PlanService planService;

	// 그룹 초대 수락
	// http://localhost:8088/planREST/accept/8
	@RequestMapping(value = "/accept/{grp_num}", produces = "application/json; charset=utf8")
	public Map<String, Object> acceptREST(@PathVariable("grp_num") int grpNum, HttpSession session) {
		log.info("초대 수락 받아온 그룹 넘버 : " + grpNum);

		String id = (String) session.getAttribute("id");

		// 초대 수락 리스트에서 제거
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setReceiver(id);
		vo.setGrp_num(grpNum);
		planService.deleteInvitation(vo);

		// 그룹에 멤버 추가
		PlanMemberVO member = new PlanMemberVO();
		member.setId(id);
		member.setGrp_num(grpNum);
		planService.insertGrpMember(member);

		// 해당 그룹 소속 멤버 리스트 가져오기
		List<MemberVO> grpMember = planService.getGrpMemberList(grpNum);
		// 멤버 리스트, 그룹 이름, 그룹 리더 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grpMember", grpMember);
		map.put("grpName", planService.getGrpName(grpNum));
		map.put("leader", planService.getLeader(grpNum));

		return map;
	}

	// 그룹 초대 거절
	@RequestMapping(value = "/refusal/{grp_num}")
	public void refusalREST(@PathVariable("grp_num") int grpNum, HttpSession session) {
		log.info("초대 거절 받아온 그룹 넘버 : " + grpNum);

		String id = (String) session.getAttribute("id");

		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setReceiver(id);
		vo.setGrp_num(grpNum);
		// 초대 수락 리스트에서 제거
		planService.deleteInvitation(vo);
	}

	// 플랜 삭제
	@RequestMapping(value = "/delete/{grp_num}")
	public void deletePlanREST(@PathVariable("grp_num") int grpNum, HttpSession session) {
		log.info("플랜 삭제 : " + grpNum);

		String id = (String) session.getAttribute("id");

		// 플랜 멤버 삭제
		PlanMemberVO vo = new PlanMemberVO();
		vo.setId(id);
		vo.setGrp_num(grpNum);
		planService.delPlanMem(vo);

		// 방장이 그룹 나가면 방장 새로 설정
		String leader = planService.getLeader(grpNum);
		if (id.equals(leader)) {
			// 다음 방장 아이디 가져오기
			String newLeader = planService.getNextLeader(grpNum);
			log.info(grpNum + "그룹 새 방장 정보 : " + newLeader);

			PlanVO plan = new PlanVO();
			plan.setLeader(newLeader);
			plan.setNum(grpNum);

			// 방장 새로 설정
			planService.updateLeader(plan);
		}

	}

	// 아이디 검색
	@RequestMapping(value = "/memberID", produces = "application/json; charset=utf8")
	public Map<String, Object> memberID(String id, int grpNum) {
		log.info("memberID() 데이터 받기 : " + id);

		Map<String, Object> total = new HashMap<String, Object>();

		// 아이디 검색 결과
		List<MemberVO> memberList = planService.getMemberList(id);

		// 그룹의 초대중인 회원
		List<GrpAcceptVO> invitingList = planService.getInvitingList(grpNum);

		// 그룹의 멤버
		List<MemberVO> grpMemberList = planService.getGrpMemberList(grpNum);

		total.put("memberArr", memberList);
		total.put("invitingArr", invitingList);
		total.put("grpMemberArr", grpMemberList);

		return total;
	}

	// 그룹에 초대
	@RequestMapping(value = "/invite", produces = "application/text; charset=utf8")
	public String inviteREST(String id, int grpNum, HttpSession session) {
		log.info("그룹에 초대 : " + grpNum + "그룹, " + id);

		String sender = (String) session.getAttribute("id");

		// 그룹 멤버 + 초대중 멤버 10명 이상이면 초대 불가
		int grpMemberCnt = planService.getGrpMemberList(grpNum).size();
		int invitingMemberCnt = planService.getInvitingList(grpNum).size();
		if ((grpMemberCnt + invitingMemberCnt) >= 10) {
			return "더 이상 초대할 수 없습니다.";
		}

		// 초대 리스트에 추가
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setGrp_num(grpNum);
		vo.setSender(sender);
		vo.setReceiver(id);

		planService.inviteMember(vo);

		// 회원 이름 전달
		return planService.getName(id);
	}

	// 초대 취소
	@RequestMapping(value = "/inviteCancle")
	public int inviteCancleREST(String id, int grpNum) {
		log.info("초대 취소 : " + grpNum + "그룹, " + id);

		// 이미 초대 수락한 상태이면
		PlanMemberVO member = new PlanMemberVO();
		member.setGrp_num(grpNum);
		member.setId(id);

		if (planService.checkGrpMember(member) == 1) {
			return 1;
		}

		// 초대 취소
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setGrp_num(grpNum);
		vo.setReceiver(id);

		planService.inviteCancle(vo);
		return 0;
	}

	// 관광지 검색
	@RequestMapping(value = "/searchTour")
	public List<Object> searchTourREST(String category, String keyword, HttpSession session) {
		log.info("관광지 검색 : " + keyword);

		return planService.getSearchList(category, keyword, (List<HotelVO>) session.getAttribute("hotellist"));
	}

	// 플랜 저장
	@RequestMapping(value = "/planModify/{num}")
	public void planModifyREST(@PathVariable("num") int num, String plan, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		PlanVO vo = new PlanVO();
		vo.setWriter(id);
		vo.setTour_plan(plan);

		log.info("플랜 저장 : " + vo);
//		service.modifyPlan(vo);
	}
}
