package com.bcc.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.service.GroupService;

@Controller
@RequestMapping(value="/plan/*")
public class PlanController {
	
	private static final Logger log = LoggerFactory.getLogger(PlanController.class);

	// 서비스 객체 주입
	@Inject
	private GroupService service;
	
	// 플랜 목록 페이지 - GET
	// http://localhost:8088/plan/planList
	@RequestMapping(value = "/planList", method = RequestMethod.GET)
	public void planListGET() {
		log.info(" planListGET() 호출 ");
	}
	
	// 플랜 작성 페이지 - GET
	// http://localhost:8088/plan/planContent
	@RequestMapping(value="/planContent", method=RequestMethod.GET)
	public void planContentGET() {
		log.info(" planContentGET() 호출 ");
		
		String id = "yun1";
		
	}
}
