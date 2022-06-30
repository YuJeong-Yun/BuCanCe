package com.bcc.web;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;
import com.bcc.service.PlanService;

@Controller
@RequestMapping(value = "/plan/*")
public class PlanController {

	private static final Logger log = LoggerFactory.getLogger(PlanController.class);

	// 서비스 객체 주입
	@Inject
	private PlanService service;

	// 플랜 목록 페이지 - GET
	// http://localhost:8088/plan/planList
	@RequestMapping(value = "/planList", method = RequestMethod.GET)
	public void planListGET(HttpSession session, Model model) throws Exception {
		log.info(" planListGET() 호출 ");

		session.setAttribute("id", "yun1");
		String id = (String) session.getAttribute("id");

		// 회원 license 가져오기
		String license = service.getLicense(id);
		model.addAttribute("license", license);

		// 초대받은 그룹 목록 가져오기
		List<GrpAcceptVO> grpAcceptList = service.getGrpAcceptList(id);
		model.addAttribute("grpAcceptList", grpAcceptList);

		// 소속된 그룹 정보 가져오기
		List<PlanMemberVO> grpList = service.getMemberGrpList(id);
		model.addAttribute("grpList", grpList);
	}

	// 플랜 작성 페이지 - POST
	// http://localhost:8088/plan/planContent
	@RequestMapping(value = "/planContent", method = RequestMethod.POST)
	public String planContentPOST(HttpSession session, @ModelAttribute("grp_name") String grp_name) throws Exception {
		log.info(" planContentPOST() 호출 ");

		String id = (String) session.getAttribute("id");
		// 그룹 번호 생성
		int num = 1;
		if (service.getGrpNum() != null) {
			num = service.getGrpNum() + 1;
		}

		// 그룹 생성
		PlanVO vo = new PlanVO();
		vo.setLeader(id);
		vo.setNum(num);
		vo.setGrp_name(grp_name);
		service.createGrp(vo);

		// 소속된 그룹 정보 저장
		PlanMemberVO member = new PlanMemberVO();
		member.setGrp_num(num);
		member.setId(id);
		service.insertGrpMember(member);

		return "redirect:/plan/planContent";
	}

	// 플랜 작성 페이지 - GET
	// http://localhost:8088/plan/planContent
	@RequestMapping(value = "/planContent", method = RequestMethod.GET)
	public void planContentGET() throws Exception {
		log.info(" planContentGET() 호출 ");
	}

}
