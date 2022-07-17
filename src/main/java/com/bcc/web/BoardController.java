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
import com.bcc.domain.MemberVO;
import com.bcc.domain.PageMaker;
import com.bcc.domain.SearchCriteria;
import com.bcc.service.BoardService;
import com.bcc.service.CommentService;
import com.bcc.service.MemberService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	@Inject
	private CommentService commentservice;
	
	@Inject
	private MemberService ms;

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
		
		// 조회수
		session.setAttribute("upFlag", "1");

		// 글 정보를 가지고 오기
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		log.info(pageMaker+"");
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList", service.list(scri));

	}

	// http://localhost:8088/board/read?num=12
	/* 글 본문 */
	@RequestMapping(value = "/read", method = RequestMethod.GET )
	public String readGET(
			@RequestParam(value = "num", required = false) Integer num, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession session) throws Exception {
		log.info("글번호" + num);
		
		//조회수
		String upFlag = (String) session.getAttribute("upFlag");

		if (upFlag.equals("1")) {
			service.updateBoardCount(num);
			session.setAttribute("upFlag", "0");
		}
		
		//게시물 댓글 수
		service.updateCommentCnt(num); 
		
		BoardVO vo = service.readBoard(num);
		model.addAttribute("vo", vo);
		model.addAttribute("scri", scri);

		// 댓글리스트
		List<CommentVO> commentList = commentservice.readComment(vo.getNum());
		model.addAttribute("commentList", commentList);

		return "board/read";

	}

	// http://localhost:8088/board/list
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

	// 댓글 작성
	@RequestMapping(value = "/commentWrite", method = RequestMethod.POST)
	public String commentWirte(CommentVO vo,
			 @ModelAttribute("scri") SearchCriteria scri,  RedirectAttributes rttr,
			HttpSession session) throws Exception {


		// 세션에 저장된 회원의 아이디
		String id = (String) session.getAttribute("id");
		// 테스트용 아이디 생성
		
		vo.setWriter(id);
		
		log.info(vo.getnum()+"");
		commentservice.wriComment(vo);

		rttr.addAttribute("num", vo.getnum());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/read?num="+vo.getnum();
	}
	
	//댓글 수정 GET
		@RequestMapping(value="/commentModify", method = RequestMethod.GET)
		public String commentModifyView(CommentVO vo, SearchCriteria scri, Model model) throws Exception {
			
			model.addAttribute("commentModify", commentservice.selectComment(vo.getCno()));
			model.addAttribute("scri", scri);
			
			return "board/commentModify";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/commentModify", method = RequestMethod.POST)
		public String commentModify(CommentVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
			commentservice.modify(vo);
			
			rttr.addAttribute("num", vo.getnum());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return  "redirect:/board/read?num="+vo.getnum();
		}
	
		//댓글 삭제 GET
		@RequestMapping(value="/commentDelete", method = RequestMethod.GET)
		public String commentDeleteView(CommentVO vo, SearchCriteria scri, Model model) throws Exception {

			model.addAttribute("commentDelete", commentservice.selectComment(vo.getCno()));
			model.addAttribute("scri", scri);
			
			return "board/commentDelete";
		}
		
		//댓글 삭제
		@RequestMapping(value="/commentDelete", method = RequestMethod.POST)
		public String commentDelete(CommentVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
			commentservice.delete(vo);
			
			rttr.addAttribute("num", vo.getnum());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return  "redirect:/board/read?num="+vo.getnum();
		}

}