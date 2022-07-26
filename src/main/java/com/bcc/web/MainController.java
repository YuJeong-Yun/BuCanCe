package com.bcc.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.service.BoardService;

@Controller
public class MainController {
	
	@Inject
	private BoardService service;

	// http://localhost:8088/main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainGET(Model model) throws Exception {
		model.addAttribute("hotList",service.getHotList());
	}
	
	

}
