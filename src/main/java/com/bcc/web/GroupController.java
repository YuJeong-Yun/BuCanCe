package com.bcc.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.service.GroupService;

@Controller
@RequestMapping("/group/*")
public class GroupController {

	private static final Logger log = LoggerFactory.getLogger(GroupController.class);

	// 서비스 객체 주입
	@Inject
	private GroupService service;

	// 글쓰기 - GET
	// http://localhost:8088/group/invite
	@RequestMapping(value = "/invite", method = RequestMethod.GET)
	public void inviteGET() {
		log.info(" inviteGET() 호출 ");

	}

}
