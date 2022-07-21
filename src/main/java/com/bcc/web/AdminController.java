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
	
	// 차트 & 프리미엄 회원 조회 창으로 이동
	@RequestMapping(value = "/profitChart", method = RequestMethod.GET)
	public String profitChartGET(Model model) {
		model.addAttribute("totalMem", service.getTotalMem());
		model.addAttribute("totalPmMem", service.getTotalPmMem());
		model.addAttribute("totalComment", service.getTotalComment());
		model.addAttribute("totalAcc", service.getTotalAcc());
		
		
		return "/admin/profitChart";
	}
	
	

}
