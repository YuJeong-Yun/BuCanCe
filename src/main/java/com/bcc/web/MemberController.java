package com.bcc.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcc.domain.KakaoVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PageMaker;
import com.bcc.domain.SearchCriteria;
import com.bcc.service.BoardService;
import com.bcc.service.KakaoService;
import com.bcc.service.MemberService;
import com.bcc.service.NaverService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Inject	
	private MemberService service;
	
	@Inject
	private BoardService bs;

    @Inject
    private KakaoService ks;
    
    @Inject
    private NaverService ns;
    
	private String apiResult = null;

	private void setNaverService(NaverService ns) {
		this.ns = ns;
	}

	// http://localhost:8088/main
		@RequestMapping(value = "/main", method = RequestMethod.GET)
		public String indexGET() {
//			log.info(" insertGET() 호출 ");
//			log.info(" view 페이지 출력 -> 정보 입력 ");
			
			return "/main";
		}

		// 찜 목록
		// http://localhost:8088/main
		// http://localhost:8088/favorite
		@RequestMapping(value = "/favorite", method = RequestMethod.GET)
		public String thumbList(SearchCriteria scri, Model model,
				HttpSession session) throws Exception {
			//session.setAttribute("kakao", "kakao");
			
			String id = (String) session.getAttribute("id");
			
			if(id == null) {

				return "redirect:/main";
			}
			
			scri.setKeyword(id);
			// 글 정보를 가지고 오기
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			
			// 일반회원, SNS 회원 구별(sns회원 -> id 영역에 이메일 저장)
			if(id.indexOf("@") != -1) {
				pageMaker.setTotalCount(service.getSNSThumbCount((String) session.getAttribute("id")));
				model.addAttribute("thumbList", service.getSNSThumbList(scri));
				
			} else {
				pageMaker.setTotalCount(service.getThumbCount((String) session.getAttribute("id")));
				model.addAttribute("thumbList", service.getThumbList(scri));
				
			}

			log.info(pageMaker + "");
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("scri", scri);

			return "/member/favorite";

		}
		
		// 찜삭제
		@RequestMapping(value = "/delThumb", method = RequestMethod.GET)
		public String delThumb(HttpSession session, @RequestParam("num") int num) throws Exception {
			service.deleteThumb(num,(String) session.getAttribute("id"));
			
			return "redirect:/member/favorite";
		}
		
		// http://localhost:8088/member/insert
		// 회원가입
		@RequestMapping(value = "/insert", method = RequestMethod.GET)
		public String insertGET(HttpSession session) throws Exception {
//			log.info(" insertGET() 호출 ");
//			log.info(" view 페이지 출력 -> 정보 입력 ");
			
			String id = (String)session.getAttribute("id");
			
			if(id != null) {
				return "redirect:/main";
			}
			
			return "/member/insertForm";
		}
		
		@RequestMapping(value = "/insert", method = RequestMethod.POST)
		public String insertPOST(MemberVO vo, HttpServletRequest request) throws Exception {
			
//			log.info(" insertPOST() 호출 ");
//			log.info(vo+"");
			
			// DB에 회원정보 저장 => 서비스 계층 호출 => DAO 호출
			// DAO 객체 주입? (동작가능) => 강한결합 (종속적인 상황이 발생)
			service.memberInsert(vo);
			
//			log.info("회원가입 완료 -> 로그인 페이지 이동");
			
			// 페이지 이동( 로그인페이지 )
			return "redirect:/member/login";
			
		}
		
		// http://localhost:8088/member/login
		// 로그인
		@RequestMapping(value = "/login",method = RequestMethod.GET)
		public String loginGet(HttpSession session) throws IOException {
//			log.info("loginGet() 호출");
//			log.info(" /member/loginForm.jsp 페이지로 이동");
			
			String id = (String)session.getAttribute("id");
			
			if(id != null) {

				return "redirect:/main";
			}
			
			return "/member/loginForm";
		}
		
		@RequestMapping(value = "/login",method = RequestMethod.POST)
		public String loginPOST(MemberVO vo,HttpSession session, HttpServletRequest request) throws Exception {
//			log.info("loginPOST() 호출");
	
			// db동작 호출을 위해서 서비스 동작을 호출 - loginCheck()
			MemberVO resultVO = service.loginCheck(vo);
			log.info("resultVO : "+ resultVO);

			// 로그인 실패 - 페이지 이동(로그인페이지)
			if(resultVO == null) {
				request.setAttribute("msg", "로그인 실패!!!");
				request.setAttribute("url", "/member/login");
				return "/member/alert";
			}
			
			// 로그인 성공 - 아이디를 세션객체에 저장
			// log.info(" 로그인 성공 ");
			session.setAttribute("id", resultVO.getId());
			// 메인페이지로 이동
			return "redirect:/main";
}
		// http://localhost:8088/member/logout
		// 로그아웃
		@RequestMapping(value = "/logout",method = RequestMethod.GET)
		public String logoutGET(HttpSession session) throws Exception {
//			log.info(" logoutGET() 호출 ");
			
			// 로그아웃 => 세션정보 초기화
			session.invalidate();
			
			// 페이지이동
			return "redirect:/main";
		}
		
		// http://localhost:8088/member/mypage
		// 마이페이지
		@RequestMapping(value = "/mypage",method = RequestMethod.GET)
		public String mypageGET(MemberVO vo, HttpSession session, HttpServletRequest request) throws Exception {
//			log.info(" mypageGET() 호출 ");
//			log.info(" view 페이지 출력 -> 정보 입력 ");
			
			// db동작 호출을 위해서 서비스 동작을 호출 - loginCheck()
			String id = (String)session.getAttribute("id");
			
			if(id == null) {
				request.setAttribute("msg", "로그인이 필요합니다.");
				request.setAttribute("url", "/member/login");
				return "/member/alert";
			}
			
			// 페이지이동
			return "/member/mypageForm";
		}

		// http://localhost:8088/member/login	
		// http://localhost:8088/member/update
		// 회원정보 수정
		@RequestMapping(value = "/update",method = RequestMethod.GET)
		public String updateGET(HttpSession session, Model model, HttpServletRequest request) throws Exception {
//			log.info(" updateGET() 호출 ");
			
			String id = (String)session.getAttribute("id");
			
			int cnt = service.idCheck(id);
			
			if(id == null) {
					return "redirect:/main";
					
				} else if(cnt != 1) {
					
					request.setAttribute("msg", "sns 회원은 수정 불가");
					request.setAttribute("url", "/member/mypage");
					return "/member/alert";
					
				}

			model.addAttribute(service.getMember(id));
			
			return "/member/updateForm";
		}
		
		// 회원정보 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String updatePOST(HttpSession session, MemberVO vo) throws Exception {
			
			int result = service.updateMember(vo);

//			log.info("result : "+result);
//			
//			log.info("vo : "+vo);

			if(result != 1) {
				// 서비스 - 정보 수정동작 호출
//				log.info(" 수정 실패 ");
				return "redirect:/member/update";
			}
			
//			log.info(" 수정 완료 ");
			// 페이지 이동
			return "redirect:/member/mypage";
		}

		@RequestMapping(value = "/liUp", method = RequestMethod.POST)
		public String liUpPOST(HttpSession session) throws Exception {
			
//			log.info(" liUpPOST() 호출 ");
			
			String id = (String)session.getAttribute("id");
			
			service.liUp(id);
			
			return "redirect:/member/update";
		}
		
		// http://localhost:8088/member/login
		@RequestMapping(value = "/liDown", method = RequestMethod.POST)
		public String liDownPOST(HttpSession session) throws Exception {
			
//			log.info(" liDownPOST() 호출 ");
			
			String id = (String)session.getAttribute("id");
			
			service.liDown(id);
			
			return "redirect:/member/update";
		}
		
		// 회원정보 삭제(탈퇴)
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String deleteGET(HttpSession session, HttpServletRequest request) throws Exception {
			
//			log.info(" deleteGET() 호출 ");
			
			String id = (String)session.getAttribute("id");
			
			int cnt = service.idCheck(id);
			
			if(id == null) {
				
					return "redirect:/main";
					
				} else if(cnt != 1) {
					
					request.setAttribute("msg", "sns 회원은 접근 불가");
					request.setAttribute("url", "/member/mypage");
					return "/member/alert";
					
				} 
			
			return "/member/deleteForm";
		}
		
		// 회원정보 삭제(탈퇴)
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String deletePOST(HttpSession session,MemberVO vo, HttpServletRequest request) throws Exception {
//			log.info(" deletePOST() 호출 ");
			//log.info(pw);
			vo.setId((String)session.getAttribute("id"));
//			log.info(vo+"");
			
			int cnt = service.delCheck(vo);
//			log.info("cnt : "+ cnt);
			
			if(cnt != 1) {
				
				request.setAttribute("msg", "비밀번호가 다릅니다.");
				request.setAttribute("url", "/member/delete");
				return "/member/alert";
				
			}
			
			service.storageMember(vo);
			service.deleteMember(vo);
			
			session.invalidate();
			
			request.setAttribute("msg", "탈퇴가 완료되었습니다.");
			request.setAttribute("url", "/main");
			
			return "/member/alert";
		}

	    // 아이디 체크

	    @PostMapping("/idCheck")
	    @ResponseBody
	    public int idCheck(@RequestParam("id") String id) throws Exception {
//	        log.info("userIdCheck 진입");
//	        log.info("전달받은 id:"+id);
	        int cnt = service.idCheck(id);
//	        log.info("확인 결과:"+cnt);
	        
	        return cnt;
	    }

	    
	    @PostMapping("/telCheck")
	    @ResponseBody
	    public int telCheck(@RequestParam("tel") String tel) throws Exception {
//	        log.info("userTelCheck 진입");
//	        log.info("전달받은 tel:"+tel);
	        int tCnt = service.telCheck(tel);
//	        log.info("확인 결과:"+tCnt);
	        
	        return tCnt;
	    }
	    
	    @PostMapping("/emailCheck")
	    @ResponseBody
	    public int emailCheck(@RequestParam("email") String email) throws Exception {
//	        log.info("userEmailCheck 진입");
//	        log.info("전달받은 email:"+email);
	        int eCnt = service.emailCheck(email);
//	        log.info("확인 결과:"+eCnt);
	        
	        return eCnt;
	    }
	    
		// http://localhost:8088/member/login
		// http://localhost:8088/member/kakao_login
	    @RequestMapping(value="/kakao_login", method=RequestMethod.GET)
	    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
	    	System.out.println("#########" + code);
	    	
	    	String access_Token = ks.getAccessToken(code);
	    	KakaoVO userInfo = ks.getUserInfo(access_Token);
	    	
//	    	System.out.println("###access_Token#### : " + access_Token);
//	    	System.out.println("###nickname#### : " + userInfo.getK_name());
//	    	System.out.println("###email#### : " + userInfo.getK_email());
	    	
	    	// 아래 코드가 추가되는 내용
	    	// session.invalidate();
	    	// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
	    	
	    	// id는 실행한 앱에서만 고유값... 실행 위치마다 달라진다. 그러므로 사용 X
	    	
	    	session.setAttribute("k_name", userInfo.getK_name());
	    	session.setAttribute("id", userInfo.getK_email());
	    	session.setAttribute("kakao", "kakao");

	    	// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
	    	// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.

	    	return "redirect:/main";
			
	    	}
	    
//		//로그인 첫 화면 요청 메소드
//		// http://localhost:8088/member/testlogin
//		@RequestMapping(value = "/testlogin", method = { RequestMethod.GET, RequestMethod.POST })
//		public String login(Model model, HttpSession session) throws Exception {
//			
//			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//			String naverAuthUrl = ns.getAuthorizationUrl(session);
//			
////			System.out.println("네이버:" + naverAuthUrl);
//			
//			// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=mh2HJRSmhFxLpWvyHva1&redirect_uri=http%3A%2F%2Flocalhost%3A8088%2Fcallback&state=063e8713-b6a0-4235-b05f-b64982f7a6f8
//			//네이버 
//			model.addAttribute("url", naverAuthUrl);
//
//			/* 생성한 인증 URL을 View로 전달 */
//			return "/member/testlogin";
//		}
//
//		//네이버 로그인 성공시 callback호출 메소드
//		@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
//		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
//				throws IOException {
////			System.out.println("callback(redirect URL) 접속 완료");
//			OAuth2AccessToken oauthToken;
//	        oauthToken = ns.getAccessToken(session, code, state);
//	        //로그인 사용자 정보를 읽어온다.
//	        
//	        apiResult = ns.getUserProfile(oauthToken);
//	        System.out.println("oauthToken : "+oauthToken);
//	        System.out.println("apiResult : "+apiResult);
//			model.addAttribute("result", apiResult);
//
//			/* 네이버 로그인 성공 페이지 View 호출 */
//			return "/member/nss";
//		}
	    
}