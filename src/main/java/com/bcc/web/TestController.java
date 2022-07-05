package com.bcc.web;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcc.domain.MemberVO;
import com.bcc.service.KakaoService;
import com.bcc.service.MemberService;

@Controller
public class TestController {
	
	private static final Logger log = LoggerFactory.getLogger(TestController.class);
	
	@Inject
	private MemberService service;
	
	// http://localhost:8088/index
		@RequestMapping(value = "/index", method = RequestMethod.GET)
		public String indexGET() {
			log.info(" insertGET() 호출 ");
			log.info(" view 페이지 출력 -> 정보 입력 ");
			
			return "/member/index";
		}

		// http://localhost:8088/insert
		// 회원가입
		@RequestMapping(value = "/insert", method = RequestMethod.GET)
		public String insertGET() {
			log.info(" insertGET() 호출 ");
			log.info(" view 페이지 출력 -> 정보 입력 ");
			
			return "/member/insertForm";
		}
		
		@RequestMapping(value = "/insert", method = RequestMethod.POST)
		public String insertPOST(MemberVO vo, HttpServletRequest request) throws Exception {
			
			log.info(" insertPOST() 호출 ");
			log.info(vo+"");
			
			// DB에 회원정보 저장 => 서비스 계층 호출 => DAO 호출
			// DAO 객체 주입? (동작가능) => 강한결합 (종속적인 상황이 발생)
			service.memberInsert(vo);
			
			log.info("회원가입 완료 -> 로그인 페이지 이동");
			
			// 페이지 이동( 로그인페이지 )
			return "redirect:/login";
			
		}
		
		// http://localhost:8088/login
		// 로그인 /login
		@RequestMapping(value = "/login",method = RequestMethod.GET)
		public String loginGet() {
			log.info("loginGet() 호출");
			log.info(" /member/loginForm.jsp 페이지로 이동");
			
			return "/member/loginForm";
		}
		
		
		@RequestMapping(value = "/login",method = RequestMethod.POST)
		public String loginPOST(MemberVO vo,HttpSession session) {
			log.info("loginPOST() 호출");

			log.info(vo+"");
			
			// db동작 호출을 위해서 서비스 동작을 호출 - loginCheck()
			MemberVO resultVO = service.loginCheck(vo);
			// 로그인 실패 - 페이지 이동(로그인페이지)
			if(resultVO == null) {
				log.info("로그인 정보 없음! 페이지 이동 ");
				
				return "redirect:/login";
			}
			
			// 로그인 성공 - 아이디를 세션객체에 저장
			session.setAttribute("id", resultVO.getId());
			
			log.info(" 로그인 성공 ");
			
			// 메인페이지로 이동
			return "redirect:/index";
		}
		
		// http://localhost:8088/logout
		// 로그아웃
		@RequestMapping(value = "/logout",method = RequestMethod.GET)
		public String logoutGET(HttpSession session) {
			log.info(" logoutGET() 호출 ");
			
			// 로그아웃 => 세션정보 초기화
			session.invalidate();
			
			// 페이지이동
			return "redirect:/index";
		}
		
		// http://localhost:8088/mypage
		// 마이페이지
		@RequestMapping(value = "/mypage",method = RequestMethod.GET)
		public String mypageGET(HttpSession session) {
			log.info(" mypageGET() 호출 ");
			log.info(" view 페이지 출력 -> 정보 입력 ");
			
			// 페이지이동
			return "/member/mypageForm";
		}
		
		// http://localhost:8088/info
		// 회원정보 조회
		@RequestMapping(value = "/info", method = RequestMethod.GET)
		public void infoGET(HttpSession session,Model model) {
			log.info("infoGET() 호출");
			
			// 아이디 값 가져오기(세션)
			String id =(String)session.getAttribute("id");
			
			// 아이디 값에 해당하는 회원정보 모두 조회 -> 서비스 동작 호출
			MemberVO vo = service.getMember(id);
			
			// 가져온 회원정보 확인
			log.info(vo+"");
			
			//DB에서 전달받은 정보를 view 페이지로 전달
			//model.addAttribute("memberVO", vo);
			model.addAttribute(vo);
			
		}
		
		// http://localhost:8088/update
		// 회원정보 수정
		@RequestMapping(value = "/update",method = RequestMethod.GET)
		public String updateGET(HttpSession session,Model model) {
			log.info(" updateGET() 호출 ");
			
			String id = (String)session.getAttribute("id");

			model.addAttribute(service.getMember(id));
			
			return "/member/updateForm";
		}
		
		
		// 회원정보 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String updatePOST(MemberVO vo) {
			// 수정할 정보를 저장(전달)
			log.info("수정 데이터 :"+vo);
			
			// 서비스 - 정보 수정동작 호출
			int result = service.updateMember(vo);
			
			if(result != 1) {
				return "redirect:/update";
			}
			
			// 페이지 이동(main)
			return "redirect:/mypage";
		}
		

		// 회원정보 삭제(탈퇴)
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String deleteGET() {
			
			log.info(" deleteGET() 호출 ");
			
			return "/member/deleteForm";
		}
		
		// 회원정보 삭제(탈퇴)
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String deletePOST(HttpSession session,MemberVO vo/* @ModelAttribute("pw") String pw, */) {
			log.info(" deletePOST() 호출 ");
			//log.info(pw);
			vo.setId((String)session.getAttribute("id"));
			log.info(vo+"");
			
			// 서비스 - 회원삭제동작
			service.deleteMember(vo);
			
			// 회원정보(세션) 초기화
			session.invalidate();
			
			// 페이지 이동
			return "redirect:/index";
		}

	    @Autowired
	    private KakaoService ks;
	    
		// http://localhost:8088/kakao_login
	    
	    @RequestMapping("/kakao_login")
	    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception{
	    	log.info("#########" + code);
	        String access_Token = ks.getAccessToken(code);
	        
	        HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
	        
	        log.info("###access_Token#### : " + access_Token);
	        log.info("###userInfo#### : " + userInfo.get("email"));
	        log.info("###nickname#### : " + userInfo.get("nickname"));
	        log.info("###profile_image#### : " + userInfo.get("profile_image"));
	        
//	        return "testPage";
	        return "/member/loginForm";
	    }
	    
	    // 아이디 체크
	    @PostMapping("/idCheck")
	    @ResponseBody
	    public int idCheck(@RequestParam("id") String id){
	        log.info("userIdCheck 진입");
	        log.info("전달받은 id:"+id);
	        int cnt = service.idCheck(id);
	        log.info("확인 결과:"+cnt);
	        
	        return cnt;
	    }
	    
}