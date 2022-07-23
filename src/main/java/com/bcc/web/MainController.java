package com.bcc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	// http://localhost:8088/main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainGET() throws Exception {

	}

}
