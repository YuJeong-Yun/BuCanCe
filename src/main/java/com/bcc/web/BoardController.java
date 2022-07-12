package com.bcc.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	
	// 사용자 좋아요 유무 체크
	@RequestMapping(value = "checkThumb", method = RequestMethod.GET)
	public Integer checkThumbGET(@RequestParam("id") String id) {
		
		
		
		return null;
	}

}
