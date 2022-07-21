package com.bcc.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;
import com.bcc.service.GrpService;
import com.bcc.service.PlanService;

@Controller
@RequestMapping(value = "/plan/*")
public class PlanController {

	private static final Logger log = LoggerFactory.getLogger(PlanController.class);

	// 서비스 객체 주입
	@Inject
	private PlanService planService;
	@Inject
	private GrpService grpService;

	// 플랜 목록 페이지 - GET
	// http://localhost:8088/plan/planList
	@RequestMapping(value = "/planList", method = RequestMethod.GET)
	public String planListGET( Model model, HttpSession session, HttpServletResponse response) throws Exception {
		log.info(" planListGET() 호출 ");
		
		///////////////////////////////////// 지울코드 //////////////////////////////////////////
		session.setAttribute("id", "yun1");
		
		String id = (String) session.getAttribute("id");
		
		// 로그인 안하면 로그인 페이지로 이동
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원만 이용 가능합니다.'); location.href='/login';</script>");
			out.flush();
			
			return "";
		}

		// 회원 license 가져오기
		model.addAttribute("license", grpService.getLicense(id));

		// 초대받은 그룹 목록 가져오기
		model.addAttribute("grpAcceptList", grpService.getGrpAcceptList(id));

		// 소속된 플랜 정보 가져오기
		model.addAttribute("grpList", planService.getPlanList(id));

		// 회원이 속한 모든 각 그룹의 멤버 정보 가져오기
		model.addAttribute("grpMemberList", grpService.getAllGrpMemberList(id));
		
		// 회원이 속한 모든 각 그룹의 초대중인 멤버 목록 가져오기
		model.addAttribute("invitingMemberList", grpService.getAllGrpInvitingList(id));
		
		return "plan/planList";
	}

		
	// 플랜 생성 - POST
	// http://localhost:8088/plan/addPlan
	@RequestMapping(value = "/addPlan", method = RequestMethod.POST)
	public String addPlanPOST(HttpSession session, String grp_name) throws Exception {
		log.info(" addPlanPOST() 호출 ");

		String id = (String) session.getAttribute("id");
		// 그룹 번호 생성
		int num = grpService.calcGrpNum();
		
		// 그룹 생성
		grp_name = grp_name.trim();
		PlanVO vo = new PlanVO();
		vo.setLeader(id);
		vo.setNum(num);
		vo.setGrp_name(grp_name);
		planService.createPlan(vo);

		// 소속된 그룹 정보 저장
		PlanMemberVO member = new PlanMemberVO();
		member.setGrp_num(num);
		member.setId(id);
		grpService.insertGrpMember(member);

		return "redirect:/plan/planContent/" + num;
	}

	// 플랜 작성 - GET
	// http://localhost:8088/plan/planWrite/1
	@RequestMapping(value = "/planWrite/{num}", method = RequestMethod.GET)
	public String planWriteGET(@PathVariable("num") int num, Model model, HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		
		// 그룹 멤버만 이동 가능
		PlanMemberVO vo = new PlanMemberVO();
		vo.setGrp_num(num);
		vo.setId(id);
		if(grpService.checkGrpMember(vo) !=1 ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 그룹 멤버가 아닙니다.'); location.href='/plan/planList';</script>");
			out.flush();
			
			return "";
		}
		
		// 플랜명 전달
		model.addAttribute("grpName", grpService.getGrpName(num));
		// 관광지 정보 저장
		model.addAttribute("tourlist", planService.getTourList());
		// 맛집 정보
		model.addAttribute("restlist", planService.getRestaurantList());
//		// 숙소 정보
//		if (session.getAttribute("hotellist") == null) {
//			// 숙소 정보 세션에 저장
//			session.setAttribute("hotellist", planService.getHotelList());
//			log.info("숙소 정보 세션 저장 완료");
//		}
		
		// 선택한 관강지 플랜 정보 전달 
		model.addAttribute("planList", planService.getTourPlanList(num));

		return "/plan/planWrite";
	}
	
	
	// 플랜 확인 페이지
	// http://localhost:8088/plan/planContent/1
	@RequestMapping(value="/planContent/{num}", method=RequestMethod.GET)
	public String planContentGET(@PathVariable("num") int num, Model model,HttpSession session, HttpServletResponse response) throws IOException {
		log.info("플랜 정보 확인 : "+num);
		
		String id = (String) session.getAttribute("id");
		
		// 그룹 멤버만 이동 가능
		PlanMemberVO vo = new PlanMemberVO();
		vo.setGrp_num(num);
		vo.setId(id);
		if(grpService.checkGrpMember(vo) !=1 ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 그룹 멤버가 아닙니다.'); location.href='/plan/planList';</script>");
			out.flush();
			
			return "";
		}
		
//		// 숙소 정보 없으면 저장
//		if (session.getAttribute("hotellist") == null) {
//			// 숙소 정보 세션에 저장
//			session.setAttribute("hotellist", planService.getHotelList());
//			log.info("숙소 정보 세션 저장 완료");
//		}
		
		// 그룹 멤버 전달
		model.addAttribute("grpMemberList",grpService.getGrpMemberList(num));
		// 여행 경로 정보 전달
		model.addAttribute("planList", planService.getTourPlanList(num));
		// 초대중인 멤버 리스트 전달
		model.addAttribute("invitingList",  grpService.getInvitingList(num));
		// 플랜 정보 전달
		model.addAttribute("plan", planService.getPlanInfo(num));
		
		return "/plan/planContent";
	}
}