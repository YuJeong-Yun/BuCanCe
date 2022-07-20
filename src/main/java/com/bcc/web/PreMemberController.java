package com.bcc.web;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bcc.service.PreMemberService;

/*@Controller
@RequestMapping("/premember/*")*/
public class PreMemberController {
	
	private static final Logger log = LoggerFactory.getLogger(PreMemberController.class);
	

	// 서비스 객체 주입
	@Inject
	private PreMemberService service;

}
