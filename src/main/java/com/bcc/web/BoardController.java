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
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.domain.BoardVO;
import com.bcc.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;
	
	//글 전체 목록
	//http://localhost:8088/board/listAll
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(@ModelAttribute("result") String result, Model model, HttpSession session) throws Exception {
		List<BoardVO> boardList = service.listAll();
	//	log.info("boardList");
		session.setAttribute("upFlag", "1");
		
		//???=all
		List<BoardVO> category = service.category();
		
		//1
		model.addAttribute("category", category);
		
		// 글 정보를 가지고 오기
		model.addAttribute("boardList", boardList);
	}
	
	// http://localhost:8088/board/read?num=12
		/* 글 본문 + 조회수 증가 */
		@RequestMapping(value = "/read", method = RequestMethod.GET)
		public void readGET(@RequestParam(value="num",required=false) int num, Model model, HttpSession session) throws Exception {
			log.info("readGET@@00");
			log.info("글번호" + num);

			String upFlag = (String) session.getAttribute("upFlag");
			log.info("dfsdfsfdf");
			log.info(upFlag);

			if (upFlag.equals("1")) {
				service.updateBoardCount(num);
				session.setAttribute("upFlag", "0");
			}
			BoardVO vo = service.readBoard(num);
			model.addAttribute("vo", vo);
		}
	
	
}