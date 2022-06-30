package com.bcc.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.domain.BoardVO;
import com.bcc.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;
	
	//글 전체 목록
	//http://localhost:8088/board/NewFile
	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public void listAll(@ModelAttribute("result") String result, Model model, HttpSession session) throws Exception {
		// 서비스 <-> DAO <-> mapper <-> DB
		List<BoardVO> boardList = service.listAll();
		log.info("listGET@@@" + boardList);
		session.setAttribute("upFlag", "1");

		// 글 정보를 가지고 오기
		model.addAttribute("boardList", boardList);

	

	}
	
	
}