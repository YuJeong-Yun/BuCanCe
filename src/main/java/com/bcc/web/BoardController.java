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


	// 댓글 작성
	@RequestMapping(value = "/commentWrite", method = RequestMethod.POST)
	public String commentWirte(CommentVO vo,
			 @ModelAttribute("scri") SearchCriteria scri,  RedirectAttributes rttr,
			HttpSession session) throws Exception {


		// 세션에 저장된 회원의 아이디
		String id = (String) session.getAttribute("id");
		// 테스트용 아이디 생성
		
		vo.setWriter(id);
		
		log.info(vo.getNum()+"");
		commentservice.wriComment(vo);
		


		return "redirect:/board/infoDetail?num="+vo.getNum()+"&t_category=0";
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
			
			rttr.addAttribute("num", vo.getNum());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return  "redirect:/board/read?num="+vo.getNum();
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
			
			rttr.addAttribute("num", vo.getNum());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return  "redirect:/board/read?num="+vo.getNum();
		}
		
		
		// http://localhost:8088/board/tourMap
		// 부산 지도 출력
		@RequestMapping(value = "/tourMap", method = RequestMethod.GET)
		public String tourMapGET() {
			
			return "/board/tourMap";
		}

		
		// 관광지 출력
		@RequestMapping(value = "/tourInfo", method = RequestMethod.GET)
		public String tourInfoGET(@RequestParam("addr") String addr, @RequestParam("t_category") int cate,
				HttpSession session, Model model) throws Exception {
			
			session.setAttribute("upFlag", "1");
			if(cate == 0) {
				model.addAttribute("tourVO",service.tourLists(addr));
				model.addAttribute("addr",addr);
			} else {
				model.addAttribute("tourVO",service.foodLists(addr));
				model.addAttribute("addr",addr);
			}
			
			return "/board/tourInfo";
		}

		
		
		// 맛집, 관광지 상세내역
		@RequestMapping(value = "/infoDetail", method = RequestMethod.GET)
		public String infoDetailGET(@RequestParam("num") Integer num, @RequestParam("t_category") Integer cate,
									Model model, HttpSession session) throws Exception {
			String url = "";
			
			//조회수
			String upFlag = (String) session.getAttribute("upFlag");

			if (upFlag.equals("1")) {
				service.updateBoardCount(num);
				session.setAttribute("upFlag", "0");
			}
			
			
			
			if(cate == 0) {
				BoardVO vo = service.getTour(num);
				model.addAttribute("vo", vo);

				// 댓글리스트
				List<CommentVO> commentList = commentservice.readComment(num);
				model.addAttribute("commentList", commentList);

				url = "board/readTour";
				
			} else {
				model.addAttribute("resVO",service.getFood(num));
				// 댓글리스트
				List<CommentVO> commentList = commentservice.readComment(num);
				model.addAttribute("commentList", commentList);
				
				url = "board/readFood";
			}
			
			return url;
		}
		
		

		// 맛집, 관광지 전체 내역 출력
		@RequestMapping(value = "/tourAll", method = RequestMethod.GET)
		public String tourAllGET(HttpSession session, @RequestParam("t_category") int cate,
				SearchCriteria scri, Model model) throws Exception {
			
			
			scri.setT_category(cate);
			// 조회수
			session.setAttribute("upFlag", "1");

			// 글 정보를 가지고 오기
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("boardList", service.list(scri));
			
			return "board/tourAll";
		}
		
		
		
		// 검색 결과 출력(제목 기준)
		@RequestMapping(value = "/tourSearch", method = RequestMethod.GET)
		public String tourSearchGET(@RequestParam("keyword") String keyword, Model model) {
			model.addAttribute("tourVO",service.searchList(keyword));
			
			return "board/tourInfo";
		}
		
		
		// 전체글목록 정렬하기
		@RequestMapping(value = "/tourAlign", method = RequestMethod.GET)
		public String tourAlignGET(@RequestParam("seq") String seq, Model model,
				@RequestParam("t_category") int cate, SearchCriteria scri, HttpSession session) throws Exception {
			
			scri.setT_category(cate);
			scri.setSearchType(seq);
			
			// 조회수
			session.setAttribute("upFlag", "1");

			// 글 정보를 가지고 오기
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("boardList", service.listAlign(scri));
			
			
			return "board/tourAll";
		}

}