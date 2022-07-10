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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcc.domain.BoardVO;
import com.bcc.domain.CommentVO;
import com.bcc.domain.Criteria;
import com.bcc.domain.PageMaker;
import com.bcc.domain.SearchCriteria;
import com.bcc.service.BoardService;
import com.bcc.service.CommentService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	@Inject
	private CommentService commentservice;

	// 카테고리 화면 변환
	@RequestMapping(value = "/ajaxListAll", method = RequestMethod.GET)
	public @ResponseBody List ajaxListAll(SearchCriteria scri) throws Exception {
		List boardList = service.list(scri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		boardList.add(pageMaker);

		return boardList;
	}

	@RequestMapping(value = "/ajaxListByCategory", method = RequestMethod.GET)
	public @ResponseBody List<BoardVO> ajaxListByCategory(@RequestParam(value = "category") String category,
			Model model) throws Exception {
		List boardList = service.category(category);

		PageMaker pageMaker = new PageMaker();
		if (boardList != null) {
			pageMaker.setCri(new Criteria());
			pageMaker.setTotalCount(boardList.size());
		}
		boardList.add(pageMaker);
		return boardList;
	}

	// 글 전체 목록
	// http://localhost:8088/board/listAll
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(@ModelAttribute("result") String result, SearchCriteria scri, Model model, HttpSession session)
			throws Exception {

		// 서비스 <-> DAO <-> mapper <-> DB
		// List<BoardVO> boardList = service.listAll();
		session.setAttribute("upFlag", "1");

		// 글 정보를 가지고 오기
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList", service.list(scri));

	}

	// http://localhost:8088/board/read?num=12
	/* 글 본문 + 조회수 증가 */
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(@RequestParam(value = "num", required = false) Integer num, Model model, HttpSession session)
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

		List<CommentVO> commentList = commentservice.readComment(vo.getNum());
		model.addAttribute("commentList", commentList);

	}

	// http://localhost:8088/board/list?Page=5
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) throws Exception {
		model.addAttribute("boardList", service.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		session.setAttribute("upFlag", "1");

		return "board/listAll";

	}
}