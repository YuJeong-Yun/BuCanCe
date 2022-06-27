package com.bcc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.service.MemberService;

@Controller
public class TestController {
	
	private static final Logger log = LoggerFactory.getLogger(TestController.class);
	
	@Inject
	private MemberService service;
	
	// http://localhost:8088/
		@RequestMapping(value = "", method = RequestMethod.GET)
		public String indexGET() {
			log.info(" insertGET() 호출 ");
			log.info(" view 페이지 출력 -> 정보 입력 ");
			
			return "member/index";
		}

}
