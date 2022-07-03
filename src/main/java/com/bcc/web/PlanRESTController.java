package com.bcc.web;

import java.util.Arrays;
import java.util.Collections;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.service.PlanService;

@RestController
@RequestMapping("/planREST/*")
public class PlanRESTController {

	private static final Logger log = LoggerFactory.getLogger(PlanRESTController.class);

	// 서비스 객체 주입
	@Inject
	private PlanService service;

	// 그룹 초대 수락
	@RequestMapping(value = "/accept/{grp_num}", produces = "application/json; charset=utf8")
	public JSONObject acceptREST(@PathVariable("grp_num") int grpNum, HttpSession session) {
		log.info("초대 수락 받아온 그룹 넘버 : " + grpNum);

		String id = (String) session.getAttribute("id");

		// 초대 수락 리스트에서 제거
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setReceiver(id);
		vo.setGrp_num(grpNum);
		service.deleteInvitation(vo);

		// 그룹에 멤버 추가
		PlanMemberVO member = new PlanMemberVO();
		member.setId(id);
		member.setGrp_num(grpNum);
		service.insertGrpMember(member);

		// 해당 그룹 소속 멤버 리스트 가져오기
		List<MemberVO> grpMember = service.getGrpMemberList(grpNum);
		// 멤버 리스트, 그룹 이름, 그룹 리더 저장
		JSONObject obj = new JSONObject();
		obj.put("grpMember", grpMember);
		obj.put("grpName", service.getGrpName(grpNum));
		obj.put("leader", service.getGrpLeader(grpNum));

		return obj;

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
		service.deleteInvitation(vo);
	}

	// 플랜 삭제
	@RequestMapping(value = "/delete/{grp_num}")
	public void deletePlanREST(@PathVariable("grp_num") int grpNum, HttpSession session) {
		log.info("플랜 삭제 : " + grpNum);

		String id = (String) session.getAttribute("id");

		PlanMemberVO vo = new PlanMemberVO();
		vo.setId(id);
		vo.setGrp_num(grpNum);
		// 플랜 멤버 삭제
		service.delPlanMem(vo);

	}

	// 아이디 검색
	@RequestMapping(value = "/memberID", produces = "application/json; charset=utf8")
	public JSONObject memberID(String id, int grpNum) {
		log.info("memberID() 데이터 받기 : " + id);

		JSONObject total = new JSONObject();

		// 아이디 검색 결과
		List<MemberVO> memberList = service.getMemberList(id);
		JSONArray memberArr = new JSONArray();
		for (MemberVO vo : memberList) {
			JSONObject obj = new JSONObject();

			obj.put("id", vo.getId());
			obj.put("name", vo.getName());

			memberArr.add(obj);
		}

		// 그룹의 초대중인 회원
		List<GrpAcceptVO> invitingList = service.getInvitingList(grpNum);
		String[] invitingArr = new String[invitingList.size()];
		for (int i = 0; i < invitingList.size(); i++) {
			invitingArr[i] = invitingList.get(i).getReceiver();
		}

		// 그룹의 멤버
		List<MemberVO> grpMemberList = service.getGrpMemberList(grpNum);
		String[] grpMemberArr = new String[grpMemberList.size()];
		for (int i = 0; i < grpMemberList.size(); i++) {
			grpMemberArr[i] = grpMemberList.get(i).getId();
		}

		total.put("memberArr", memberArr);
		total.put("invitingArr", invitingArr);
		total.put("grpMemberArr", grpMemberArr);

		return total;
	}

	// 그룹에 초대
	@RequestMapping(value = "/invite", produces = "application/text; charset=utf8")
	public String inviteREST(String id, int grpNum, HttpSession session) {
		log.info("그룹에 초대 : " + grpNum + "그룹, " + id);

		String sender = (String) session.getAttribute("id");

		System.out.println("grpNum : " + grpNum);
		// 그룹 멤버 + 초대중 멤버 10명 이상이면 초대 불가
		int grpMemberCnt = service.getGrpMemberList(grpNum).size();
		System.out.println("gm : " + grpMemberCnt);
		int invitingMemberCnt = service.getInvitingList(grpNum).size();
		System.out.println("im : " + invitingMemberCnt);
		if ((grpMemberCnt + invitingMemberCnt) >= 10) {
			return "더 이상 초대할 수 없습니다.";
		}

		// 초대 리스트에 추가
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setGrp_num(grpNum);
		vo.setSender(sender);
		vo.setReceiver(id);

		service.inviteMember(vo);

		// 회원 이름 전달
		return service.getName(id);
	}

	// 초대 취소
	@RequestMapping(value = "/inviteCancle")
	public int inviteCancleREST(String id, int grpNum) {
		log.info("초대 취소 : " + grpNum + "그룹, " + id);
		
		// 이미 초대 수락한 상태이면
		PlanMemberVO member = new PlanMemberVO();
		member.setGrp_num(grpNum);
		member.setId(id);
		
		if(service.checkGrpMember(member) == 1) {
			return 1;
		}
		
		// 초대 취소
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setGrp_num(grpNum);
		vo.setReceiver(id);
		
		service.inviteCancle(vo);
		return 0;
	}

}
