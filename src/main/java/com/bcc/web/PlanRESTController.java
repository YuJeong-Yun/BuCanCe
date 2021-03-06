package com.bcc.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.domain.BoardVO;
import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.HotelVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;
import com.bcc.service.BoardService;
import com.bcc.service.GrpService;
import com.bcc.service.PlanService;

@RestController
@RequestMapping("/planREST/*")
public class PlanRESTController {

	private static final Logger log = LoggerFactory.getLogger(PlanRESTController.class);

	// 서비스 객체 주입
	@Inject
	private PlanService planService;
	@Inject
	private GrpService grpService;

	@Inject
	private BoardService boService;

	// 그룹 초대 수락
	// http://localhost:8088/planREST/accept/8
	@RequestMapping(value = "/accept/{grp_num}", produces = "application/json; charset=utf8")
	public Map<String, Object> acceptREST(@PathVariable("grp_num") int grpNum, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");

		log.info(id + "회원 초대 수락 그룹 넘버 : " + grpNum);

		// 초대 수락 리스트에서 제거
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setReceiver(id);
		vo.setGrp_num(grpNum);
		grpService.delInvitation(vo);

		// 그룹에 멤버 추가
		PlanMemberVO member = new PlanMemberVO();
		member.setId(id);
		member.setGrp_num(grpNum);
		grpService.insertGrpMember(member);

		// 멤버 리스트, 그룹 이름, 그룹 리더 저장
		Map<String, Object> map = new HashMap<String, Object>();
		// 해당 그룹 소속 멤버 리스트, 그룹 이름, 리더 가져오기
		map.put("grpMember", grpService.getGrpMemberList(grpNum));
		map.put("grpName", grpService.getGrpName(grpNum));
		map.put("leader", grpService.getLeader(grpNum));

		return map;
	}

	// 그룹 초대 거절
	@RequestMapping(value = "/refusal/{grp_num}")
	public void refusalREST(@PathVariable("grp_num") int grpNum, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");

		log.info(id + "회원 초대 거절 그룹 넘버 : " + grpNum);

		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setReceiver(id);
		vo.setGrp_num(grpNum);
		// 초대 수락 리스트에서 제거
		grpService.delInvitation(vo);
	}

	// 플랜 삭제
	@RequestMapping(value = "/delete/{grp_num}")
	public void deletePlanREST(@PathVariable("grp_num") int grpNum, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");

		log.info(id + "회원 플랜 삭제 : " + grpNum);

		// 플랜 멤버 삭제
		PlanMemberVO vo = new PlanMemberVO();
		vo.setId(id);
		vo.setGrp_num(grpNum);
		grpService.delGrpMember(vo);

		// 방장 여부에 따라 방장 새로 설정 - 본인이 마지막 멤버이면 DB에서 플랜 삭제함
		grpService.checkLeader(id, grpNum);
	}

	// 아이디 검색
	@RequestMapping(value = "/memberID", produces = "application/json; charset=utf8")
	public Map<String, Object> memberID(String id, int grpNum) throws Exception {
//		log.info("memberID() 데이터 받기 : " + id);

		Map<String, Object> total = new HashMap<String, Object>();

		// 아이디 검색 결과
		total.put("memberArr", grpService.getSearchMemList(id));
		// 그룹의 초대중인 회원
		total.put("invitingArr", grpService.getInvitingList(grpNum));
		// 그룹의 멤버
		total.put("grpMemberArr", grpService.getGrpMemberList(grpNum));

		return total;
	}

	// 그룹에 초대
	@RequestMapping(value = "/invite", produces = "application/text; charset=utf8")
	public String inviteREST(String id, int grpNum, HttpSession session) throws Exception {

		String sender = (String) session.getAttribute("id");

		log.info("그룹에 초대 : " + grpNum + "그룹, " + sender + " 회원");

		// 회원 초대
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setGrp_num(grpNum);
		vo.setSender(sender);
		vo.setReceiver(id);

		// 초대 성공하면 이름, 이미 초대중이면 ing, 초대 가능 인원수 초과면 no 반환
		return grpService.inviteMember(vo);
	}

	// 초대 취소
	@RequestMapping(value = "/inviteCancle")
	public int inviteCancleREST(String id, int grpNum) throws Exception {
		log.info("초대 취소 : " + grpNum + "그룹, " + id + " 회원");

		// 초대 취소
		GrpAcceptVO vo = new GrpAcceptVO();
		vo.setGrp_num(grpNum);
		vo.setReceiver(id);

		return grpService.inviteCancle(vo);
	}

	// 관광지 검색
	@RequestMapping(value = "/searchTour")
	public List<BoardVO> searchTourREST(String category, String keyword) throws Exception {

		return planService.getSearchList(category, keyword);
	}

	// 플랜 저장
	@RequestMapping(value = "/planModify")
	public void planModifyREST(@RequestBody PlanVO vo, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		vo.setWriter(id);

		log.info("플랜 저장 : " + vo);

		planService.modTourPlan(vo);
	}

	// 선택한 플랜 정보
	@RequestMapping(value = "/planList/{grp_num}")
	public List<List<Object>> planListREST(@PathVariable("grp_num") int grp_num, HttpSession session) throws Exception {
//		log.info("플랜 정보 가져오기 ");

		return planService.getTourPlanList(grp_num);
	}

	// 숙소 정보 크롤링
	@RequestMapping(value = "/accomodation")
	public List<HotelVO> getHotelList() throws Exception {

		return planService.getHotelList();
	}

	// 관광지 하나 정보 가져오기
	@RequestMapping(value = "/tourInfo")
	public BoardVO getTourInfo(int num) throws Exception {
		return boService.getTour(num);
	}
}