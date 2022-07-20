package com.bcc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.service.BoardService;

@RestController
public class BoardRESTController {
	

	private static final Logger log = LoggerFactory.getLogger(BoardRESTController.class);
	
	
	@Inject
	private BoardService service;
	
	// 사용자 좋아요 유무 체크
	// http://localhost:8088/checkThumb
    @GetMapping("/checkThumb")
	@RequestMapping(value = "checkThumb", method = RequestMethod.GET)
	public Integer checkThumbGET(@RequestParam("b_num") int b_num, HttpServletRequest request) {
		log.info(b_num+"");
		HttpSession session = request.getSession();

		return service.checkThumb(b_num,(String) session.getAttribute("id"));
	}


	// 좋아요 수 업데이트
	@RequestMapping(value = "/updateThumb", method = RequestMethod.PUT)
	public void updateThumbPUT(HttpSession session, HttpServletRequest request) {
		
		int b_num = (int) session.getAttribute("b_num");
		int t_category = (int) session.getAttribute("t_category");

		service.updateThumb(b_num, t_category, (String) session.getAttribute("id"));

	}


}