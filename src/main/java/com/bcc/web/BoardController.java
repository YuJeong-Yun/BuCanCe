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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcc.domain.BoardVO;
import com.bcc.domain.Criteria;
import com.bcc.domain.PageMaker;
import com.bcc.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	// 카테고리 이동
	@RequestMapping(value = "/ajaxListAll", method = RequestMethod.GET)
	public @ResponseBody List<BoardVO> ajaxListAll() throws Exception {
		List<BoardVO> boardList = service.listAll();
		return boardList;
	}

	@RequestMapping(value = "/ajaxListByCategory", method = RequestMethod.GET)
	public @ResponseBody List<BoardVO> ajaxListByCategory(@RequestParam(value = "category") String category)
			throws Exception {
		List<BoardVO> boardList = service.category(category);

		return boardList;
	}

	// 글 전체 목록
	// http://localhost:8088/board/listAll
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(@ModelAttribute("result") String result, Model model, HttpSession session) throws Exception {

		// 서비스 <-> DAO <-> mapper <-> DB
		List<BoardVO> boardList = service.listAll();
		session.setAttribute("upFlag", "1");

		// 글 정보를 가지고 오기
		model.addAttribute("boardList", boardList);

	}

	// http://localhost:8088/board/read?num=12
	/* 글 본문 + 조회수 증가 */
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(@RequestParam(value = "num", required = false) int num, Model model, HttpSession session)
			throws Exception {
		log.info("글번호" + num);
		String upFlag = (String) session.getAttribute("upFlag");
		log.info(upFlag);
		if (upFlag.equals("1")) {
			service.updateBoardCount(num);
			session.setAttribute("upFlag", "0");
		}
		BoardVO vo = service.readBoard(num);
		model.addAttribute("vo", vo);
	}

	//http://localhost:8088/board/list?perPageNum=5
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri,HttpSession session) throws Exception {
		log.info("list");
		model.addAttribute("list", service.list(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
		session.setAttribute("upFlag", "1");

		return "board/listAll";

	}

}