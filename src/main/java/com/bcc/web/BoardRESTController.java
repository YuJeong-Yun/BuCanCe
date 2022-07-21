package com.bcc.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.service.BoardService;

@RestController
@RequestMapping("/boardREST/*")
public class BoardRESTController {
	

	private static final Logger log = LoggerFactory.getLogger(BoardRESTController.class);
	
	
	@Inject
	private BoardService service;
	
	// 사용자 좋아요 유무 체크
	@RequestMapping(value = "/checkThumb", method = RequestMethod.GET)
	public Integer checkThumbGET(@RequestParam("b_num") int b_num, HttpServletRequest request) {
		HttpSession session = request.getSession();

		return service.checkThumb(b_num,(String) session.getAttribute("id"));
	}


	// 좋아요 수 업데이트
	@RequestMapping(value = "/updateThumb", method = RequestMethod.PUT)
	public void updateThumbPUT(@RequestParam("b_num") int b_num,
			@RequestParam("t_category") int t_category,HttpServletRequest request) {
		HttpSession session = request.getSession();

		service.updateThumb(b_num, t_category, (String) session.getAttribute("id"));

	}
	
	// Naver API

	// 블로그 검색
	@RequestMapping(value = "/getBlog", method = RequestMethod.GET)
	public List getBlog(@RequestParam String title, String addr, String start) throws Exception {

		return service.getBlog(title, addr, start);
	}
	
	// 부산 실시간 날씨
	@RequestMapping(value = "getWeather", method = RequestMethod.GET)
	public JSONArray getWeatherdata() throws Exception {
		
     	return service.getWeather();
	}


}