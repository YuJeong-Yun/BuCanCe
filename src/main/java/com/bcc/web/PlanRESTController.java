package com.bcc.web;

import java.util.List;

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
	@RequestMapping(value = "/accept/{grp_num}", produces = "application/text; charset=utf8")
	public String acceptREST(@PathVariable("grp_num") int grp_num, HttpSession session) {
		log.info("초대 수락 받아온 그룹 넘버 : " + grp_num);

		String id = (String) session.getAttribute("id");
		
		// 초대 수락 리스트에서 제거
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setReceiver(id);
		vo.setGrp_num(grp_num);
		service.deleteInvitation(vo);
		
		// 그룹에 멤버 추가
		PlanMemberVO member = new PlanMemberVO();
		member.setId(id);
		member.setGrp_num(grp_num);
		service.insertGrpMember(member);
		
		// 그룹 이름 가져오기
		return service.getGrpName(grp_num);
		
	}

	// 그룹 초대 거절
	@RequestMapping(value = "/refusal/{grp_num}")
	public void refusalREST(@PathVariable("grp_num") int grp_num, HttpSession session) {
		log.info("초대 거절 받아온 그룹 넘버 : " + grp_num);
		
		String id = (String) session.getAttribute("id");

		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setReceiver(id);
		vo.setGrp_num(grp_num);
		// 초대 수락 리스트에서 제거
		service.deleteInvitation(vo);
	}

	@RequestMapping(value = "/memberID", method = RequestMethod.POST)
	public JSONArray memberID(String id) {
		log.info("memberID() 데이터 받기 : " + id);

		List<MemberVO> memberList = service.getMemberList(id);

		JSONArray memberArr = new JSONArray();
		for (MemberVO vo : memberList) {
			JSONObject member = new JSONObject();

			member.put("id", vo.getId());
			member.put("name", vo.getName());

			memberArr.add(member);
		}

		return memberArr;
	}

}
