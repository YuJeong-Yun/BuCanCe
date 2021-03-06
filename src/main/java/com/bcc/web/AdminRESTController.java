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

import com.bcc.domain.PreOrderVO;
import com.bcc.service.AdminService;

@RestController
@RequestMapping("/adminRest/*")
public class AdminRESTController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminRESTController.class);
	
	@Inject
	private AdminService service;
	
	// 날짜에 해당하는 구독 회원 정보(전체)
	@RequestMapping(value = "/pmMembers", method = RequestMethod.GET)
	public List<PreOrderVO> getVipInfo(@RequestParam("date") String date){
		//log.info(service.getPmInfo(date)+"");
		return service.getPmInfo(date);
	}
	
	// 날짜에 해당하는 구독 회원 정보(정기구독회원만)
	@RequestMapping(value = "/periodMems", method = RequestMethod.GET)
	public List<PreOrderVO> onlyPeriodGET(@RequestParam("date") String date){
		
		return service.getOnlyPeriod(date);
	}
	
	
	// 일주일간의 최신 수익 차트
	@RequestMapping(value = "/trendChart", method = RequestMethod.GET)
	public JSONObject trendChartGET() {
		
		return service.getTrendChart();
	}
	
	// 월간 수익 차트(5개월)
	@RequestMapping(value = "/monthlyChart", method = RequestMethod.GET)
	public JSONObject monthlyChartGET() {
		
		return service.getMonthlyChart();
	}
	
	// 일자별 회원가입수 추이
	@RequestMapping(value = "/dailyMember", method = RequestMethod.GET)
	public JSONObject dailyMemberGET() {
		
		return service.getDailyMember();
	}
	
	// 관광지 주소 추가
	@RequestMapping(value = "/searchAddr", method = RequestMethod.GET)
	public List searchAddrGET(@RequestParam("title") String title) throws Exception{
		
		return service.searchAddr(title);
	}
	
}
