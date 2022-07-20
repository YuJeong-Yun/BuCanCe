package com.bcc.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	// '전체회원 보기' 클릭시 날짜에 해당하는 모든 프리미엄 회원 출력
	@RequestMapping(value = "/pmMembers", method = RequestMethod.GET)
	public String pmMemberGET(@RequestParam("date") String date, Model model) {
		model.addAttribute("pmMems", service.getPmInfo(date));
		
		return "/admin/pmMembers";
	}
	
	// '구독회원만 보기' 클릭시 날짜에 해당하는 구독회원 정보만 출력
	@RequestMapping(value = "/periodMems", method = RequestMethod.GET)
	public String onlyPeriodicGET(@RequestParam("date") String date, Model model) {
		model.addAttribute("pmMems",service.getOnlyPeriod(date));
		
		return "/admin/pmMembers";
	}
	
	// 차트 & 프리미엄 회원 조회 창으로 이동
	@RequestMapping(value = "/profitChart", method = RequestMethod.GET)
	public String profitChartGET(Model model) {
		model.addAttribute("totalMem", service.getTotalMem());
		model.addAttribute("totalPmMem", service.getTotalPmMem());
		model.addAttribute("totalComment", service.getTotalComment());
		model.addAttribute("totalAcc", service.getTotalAcc());
		
		
		return "/admin/profitChart";
	}
	
	// 웹 회원 목록
	@RequestMapping(value = "/memberMg", method = RequestMethod.GET)
	public String allWebMemberGET(Model model) {
		model.addAttribute("mg", service.getallWebMember());
			
		return "/admin/memberMg";
	}
	
	// 카카오 회원 목록
	@RequestMapping(value = "/memberkako", method = RequestMethod.GET)
	public String allSnsMemberGET(Model model) {
		model.addAttribute("kakao", service.getallSnsMember());
		
		return "/admin/memberMg";
	}
	//회원 강제 탈퇴
	
	//public String 
}
