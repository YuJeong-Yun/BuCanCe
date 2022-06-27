package com.bcc.web;

import javax.inject.Inject;

import org.json.simple.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.service.roomService;

//숙박컨트롤러 
@Controller
@RequestMapping("/accomodation/*")
public class accomodationController {

	private static final Logger log = LoggerFactory.getLogger(accomodationController.class);

	@Inject
	private roomService service;

	// roomSearch 페이지
	// http://localhost:8088/accomodation/roomSearch
	@RequestMapping(value = "/roomSearch", method = RequestMethod.GET)
	public void roomSearchGET(Model model) {
		log.info(" roomSearchGET() 호출 ");


	}

	// roomList 페이지
	// http://localhost:8088/accomodation/roomList
	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public void roomListGET(Model model) {

		log.info(" roomListGET() 호출 ");

		JSONArray roomList = service.roomSearch();

		model.addAttribute("roomList", roomList);

	}

}
