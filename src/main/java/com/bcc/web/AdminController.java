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
public class AdminController {
	

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	@RequestMapping(value = "/profitCal", method = RequestMethod.GET)
	public String profitGET() {
		
		return "/admin/profitCal";
	}
	
	@RequestMapping(value = "/pmMembers", method = RequestMethod.GET)
	public String pmMemberGET(@RequestParam("date") String date, Model model) {
		
		model.addAttribute("periodic", service.getPm(date));
		model.addAttribute("pmMems", service.getPmInfo(date));
		
		return "/admin/pmMembers";
	}
	
	@RequestMapping(value = "/periodMems", method = RequestMethod.GET)
	public String onlyPeriodicGET(@RequestParam("date") String date, Model model) {
		model.addAttribute("pmMems",service.getOnlyPeriod(date));
		
		return "/admin/pmMembers";
	}
	
	@RequestMapping(value = "/profitChart", method = RequestMethod.GET)
	public String profitChartGET() {
		
		
		return "/admin/profitChart";
	}

}
