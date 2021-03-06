package com.bcc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcc.domain.BoardVO;
import com.bcc.domain.MemberVO;
import com.bcc.service.AdminService;
import com.bcc.service.BoardService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService service;

	// 차트 & 프리미엄 회원 조회 창으로 이동
	@RequestMapping(value = "/profitChart", method = RequestMethod.GET)
	public String profitChartGET(Model model) throws Exception{
		model.addAttribute("totalMem", service.getTotalMem());
		model.addAttribute("totalPmMem", service.getTotalPmMem());
		model.addAttribute("totalComment", service.getTotalComment());
		model.addAttribute("totalAcc", service.getTotalAcc());

		return "/admin/profitChart";
	}

	// 회원 목록
	@RequestMapping(value = "/memberMg", method = RequestMethod.GET)
	public String allWebMemberGET(Model model) throws Exception{
		model.addAttribute("mg", service.getAllWebMem());

		return "admin/memberMg";
	}

	// 회원 삭제
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public String deleteMemberGET() throws Exception{
		return "/admin/memberMg";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletMemberPOST(HttpSession session, MemberVO vo) throws Exception{
		service.delMem(vo);
		session.invalidate();

		return "redirect:/admin/memberMg";

	}
	
	// 관광지 추가 글쓰기
	@RequestMapping(value = "/addTour", method = RequestMethod.GET)
	public String addTourGET() {
		
		
		return "admin/addTour";
	}
	
	// 관광지 주소 찾기
	@RequestMapping(value = "/findAddr", method = RequestMethod.GET)
	public String findAddrGET() {
		
		return "admin/findAddr";
	}
	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	public String writeBoard(RedirectAttributes rttr, BoardVO vo, HttpServletRequest request) {
		
		//log.info(vo+"");
		int result = service.putBoard(vo);
		
		return "redirect:/admin/addTour?result="+result;
	}
	

}
