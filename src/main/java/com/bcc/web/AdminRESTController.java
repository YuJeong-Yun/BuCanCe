package com.bcc.web;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.domain.PremiumOrderVO;
import com.bcc.service.AdminService;

@RestController
@RequestMapping("/admin/*")
public class AdminRESTController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminRESTController.class);
	
	@Inject
	private AdminService service;
	
	@RequestMapping(value = "/getVipInfo", method = RequestMethod.GET)
	public List<PremiumOrderVO> getVipInfo(@RequestParam("date") String date){
		
		return service.getPmInfo(date);
	}
	
	@RequestMapping(value = "/getPm", method = RequestMethod.GET)
	public List<String> test(@RequestParam("date") String date) {
		
		return service.getPm(date);
	}
	
	@RequestMapping(value = "/trendChart", method = RequestMethod.GET)
	public JSONObject trendChartGET() {
		
		return service.getTrendChart();
	}
	
	@RequestMapping(value = "/monthlyChart", method = RequestMethod.GET)
	public JSONObject monthlyChartGET() {
		
		return service.getMonthlyChart();
	}
	
	
}
