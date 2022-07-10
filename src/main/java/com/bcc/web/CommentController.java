package com.bcc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcc.domain.CommentVO;
import com.bcc.domain.SearchCriteria;
import com.bcc.service.CommentService;

@RestController
@RequestMapping("/comment/*")
public class CommentController {

	private static final Logger log = LoggerFactory.getLogger(CommentController.class);

	@Inject
	private CommentService commentservice;

	// 댓글 조회

	// 댓글 작성
	@RequestMapping(value = "/commentWrite", method = RequestMethod.POST)
	public String commentWirte(CommentVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpSession session)
			throws Exception {
		// 세션에 저장된 회원의 아이디
		String id = (String) session.getAttribute("id");
		// 테스트용 아이디 생성
		session.setAttribute("id", "admin");
		vo.setWriter(id);

		commentservice.wriComment(vo);

		rttr.addAttribute("num", vo.getnum());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/read";
	}

	// 댓글 수정

	// 댓글 삭제
}
