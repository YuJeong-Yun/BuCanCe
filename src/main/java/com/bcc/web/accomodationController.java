package com.bcc.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomReVO;
import com.bcc.domain.roomRefundVO;
import com.bcc.domain.roomSearch;
import com.bcc.service.roomService;

//숙박컨트롤러 
@Controller
@RequestMapping("/accomodation/*")
public class accomodationController {

	private static final Logger log = LoggerFactory.getLogger(accomodationController.class);

	@Inject
	private roomService service;
	


	// 숙소목록을 보여주는 페이지로 이동
	// 크롤링한 숙소정보들를 테이블 형태로 보여줌
	// http://localhost:8088/accomodation/roomList
	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public void roomListGET(Model model) throws IOException {

		log.info(" roomListGET() 호출 ");
		log.info(" 전체숙소목록 정보 ");
		
		//service에서 저장한 크롤링 정보들을 JSONArray형태로 저장
		JSONArray roomList = service.roomList();

		model.addAttribute("roomList", roomList);
	}
	
	
	
	// 숙소목록을 지역선택이나 검색을 통해 원하는 목록만 보여줌
	// http://localhost:8088/accomodation/roomList
	@RequestMapping(value = "/roomList", method = RequestMethod.POST)
	public void roomListPOST(Model model,roomSearch rs) throws IOException {

		log.info(" roomListPOST() 호출 ");
		log.info(" 입력한 정보를 바탕으로 숙소항목을 보여줌 ");
		
		//service에서 입력한 정보를 바탕으로 원하는 크롤링 정보만 보여줌
		JSONArray roomList = service.roomSearchList(rs);
		
		model.addAttribute("roomList", roomList);
		
		//roomList.jsp에서 선택한 select 정보를 저장
		model.addAttribute("select_area", rs.getArea());
		
		//roomList.jsp에서 input태그에 입력한 정보를 저장
		model.addAttribute("select_place", rs.getPlace_name());
			
	}
	
	

	
	// roomList.jsp에서 선택한 숙소를 자세하게 보여주는 페이지
	// 방 정보를 볼수있고 날짜 정보를 입력후에 예약페이지로 이동가능함
	// http://localhost:8088/accomodation/roomDetail
	@RequestMapping(value = "/roomDetail" ,method = RequestMethod.GET)
	public void roomDetailGET(Model model,@RequestParam("bno")
	String bno) throws IOException {

		log.info("roomDetailGET() 호출");
		log.info(" 숙소정보를 상세하게 보여주는 페이지 ");

		//상세정보를 크롤링하여 저장함
		JSONArray roomdetail0 = service.roomDetail0(bno);
		JSONArray roomdetail = service.roomDetail(bno);
		JSONArray roomdetail2 = service.roomDetail2(bno);
		JSONArray roomdetail3 = service.roomDetail3(bno);
		JSONArray roomdetail4 = service.roomDetail4(bno);
		JSONArray roomdetail5 = service.roomDetail5(bno);
			
		model.addAttribute("roomdetail0", roomdetail0);
		model.addAttribute("roomdetail", roomdetail);
		model.addAttribute("roomdetail2", roomdetail2);
		model.addAttribute("roomdetail3", roomdetail3);
		model.addAttribute("roomdetail4", roomdetail4);
		model.addAttribute("roomdetail5", roomdetail5);
			
		
		//이후에 크롤링할 사이트를 bno에 저장 
		model.addAttribute("bno", bno);
		
		//roomReserve.jsp에서 활용하기위해 
		//bno라는 크롤링할 사이트와 그 주소값에 있는 ano값을 추출
		int ano_idx = bno.indexOf("ano=");
		String cc = bno.substring(ano_idx+4,bno.length());
		model.addAttribute("ano", cc);
		
		log.info("bno ="+bno);
		log.info("ano ="+cc);
			
	}
	
	
		
		
	// 가격상세정보를 보여줌(사용할지말지 고민중 거의 가공못한 형태)
	// roomDetail에서 가격상세정보를 클릭하면 보여줌
	// http://localhost:8088/accomodation/roomPrice
	@RequestMapping(value = "/roomPrice" ,method = RequestMethod.GET)
		public void roomPriceGET(Model model,@RequestParam("bno")
		String bno) throws IOException {

	    log.info("roomPriceGET() 호출");
				
	    //bno라는 크롤링할 사이트를 사용
		JSONArray roomPrice = service.roomPrice(bno);
			
		model.addAttribute("roomPrice", roomPrice);
	}
		
		
		//
		// 예약 roomReserve 페이지
		// http://localhost:8088/accomodation/roomReserve 
		@RequestMapping(value = "/roomReserve" ,method = RequestMethod.GET)
		public void roomReserveGET(Model model,@RequestParam("bno")
		String bno,roomDate rd, @RequestParam("ano") String ano,
		@RequestParam("room_title") String room_title) throws IOException, ParseException {
			
		log.info("roomReserveGET() 호출");

		//날짜정보가져오기
		log.info(rd.getSel_date());
		log.info(rd.getSel_date2());
			
	    //크롤링할 사이트 주소가져오기
		model.addAttribute("bno", bno);
		
		//체크인,체크아웃날짜
		model.addAttribute("checkout",rd.getSel_date2().substring(8));
		model.addAttribute("checkin",rd.getSel_date().substring(8));
		
		//체크인,체크아웃날짜를 시간까지 전부가져오기
		model.addAttribute("checkoutFull",rd.getSel_date2());
		model.addAttribute("checkinFull",rd.getSel_date());
		
		//해당날짜와 숙소에 해당하는 크롤링정보들을 가져옴
		JSONArray roomReserve = service.roomReserve(bno,rd,ano);
		System.out.println("roomReserve : " +roomReserve);
		model.addAttribute("roomReserve", roomReserve);

		
		//이전페이지의 숙소이름저장
		model.addAttribute("room_title", room_title);
	
		}
		
		
		// 대실예약페이지
		// http://localhost:8088/accomodation/roomPayment
		@RequestMapping(value = "/roomPayment" ,method = RequestMethod.GET)
		public void roomPaymentGET(roomReVO vo,Model model,
		HttpSession session
				) throws IOException {

		log.info("roomPaymentGET() 호출");
		log.info("대실예약페이지 호출");
						
		log.info("vo : "+vo);
//		log.info(vo.getRoom_title());			
		model.addAttribute("vo", vo);
		
		//숙박주문번호 설정
		String accId = service.SearchPayId();
		
		//로그인정보들(임의의값)
		session.setAttribute("id", "admin");
		session.setAttribute("user_name", "김영수");
		session.setAttribute("email", "kld9223@naver.com");
		session.setAttribute("accId", accId);
		session.setAttribute("tel", "010-3795-9228");
		session.setAttribute("address1", "부산광역시 금정구 금정로 233-21번길 한진스카이 아파트 1003호");
		session.setAttribute("zip", "46243");
		session.setAttribute("license", 1);
		
		}
		
		
		// 숙박예약페이지
		// http://localhost:8088/accomodation/roomPayment2
		@RequestMapping(value = "/roomPayment2" ,method = RequestMethod.GET)
		public void roomPayment2GET(roomReVO vo,Model model,
		HttpSession session
				) throws IOException {

		log.info("roomPayment2GET() 호출");
		log.info("숙박예약페이지 호출");
		
		log.info("vo : "+vo);
//		log.info(vo.getRoom_title());			
				
		//숙박 주문번호 설정
		String accId = service.SearchPayId();
		
		model.addAttribute("vo", vo);
		
		
		//로그인정보들(임의의값)
		session.setAttribute("id", "admin");
		session.setAttribute("user_name", "김영수");
		session.setAttribute("email", "kld9223@naver.com");
		session.setAttribute("accId", accId);
		session.setAttribute("tel", "010-3795-9228");
		session.setAttribute("zip", "46243");
		session.setAttribute("license", 1);
				
				
		}
		
		
		
		// roomReserve.jsp에서 예약항목선택시 
		// 그정보를 바탕으로 예약페이지로 이동
		// http://localhost:8088/accomodation/roomPayDB
		@RequestMapping(value = "/roomPayDB" ,method =RequestMethod.GET)
		public void roomPayDBGET(roomPayVO vo,Model model) throws IOException {

		log.info("roomPayDBGET() 호출");
										
		log.info("vo : "+vo);	
						
		service.roomPay(vo);
		
		model.addAttribute("vo", vo);
		
		
		}
		
		
		// 결제완료후 내역 페이지
		// http://localhost:8088/accomodation/roomReComplete
		@RequestMapping(value = "/roomReComplete" ,method =RequestMethod.GET)
		public void roomReCompleteGET(Model model,
				@RequestParam("accId") String accId  
				) throws IOException {
		
		log.info("accId : "+accId);
	    //결제내역
		log.info("roomReCompleteGET() 호출");
				
		roomPayVO vo = service.roomPayInfo(accId);	
		
		//해당 예약정보
		model.addAttribute("vo", vo);
		
		}
				
		
		// 유저 결제내역
		// http://localhost:8088/accomodation/roomReList
		@RequestMapping(value = "/roomReList" ,method =RequestMethod.GET)
		public void roomReListGET(Model model) throws IOException {
				
			
		//결제내역
		log.info("roomReListGET() 호출");
		
		
		String id="admin";
		
		
		List<roomPayVO> list = service.roomUserPayInfo(id);	
				
		log.info("payList : "+list);
		
		//해당 유저의 예약정보
		model.addAttribute("UserPayList", list);
				
		}
		
		
		//결제환불
		//http://localhost:8088/accomodation/roomRefund
		@RequestMapping(value = "/roomRefund" ,method =RequestMethod.POST)
		public void roomRefundPOST(roomPayVO vo, Model model) throws IOException {
						
					
		//결제내역
		log.info("roomRefundPOST() 호출");
				
		//환불고유아이디
		String rfId = service.roomRf();
		
		log.info("vo : "+vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("rfId", rfId);
						
		}
		
		
		//결제환불 db에 저장
		//http://localhost:8088/accomodation/roomRfDB
		@RequestMapping(value = "/roomRfDB" ,method =RequestMethod.GET)
		public void roomRefundGET(roomRefundVO vo,Model model) throws IOException {
			
							
		//결제내역
		log.info("roomRfDBGET() 호출");
		
						
		//첫번째로 결제테이블의 정보를 환불됨으로 바꾸기(status)
		service.payStatus(vo.getAccId());
		
		//두번째로 환불테이블 정보입력
		service.inRoomRefund(vo);
		
		
	
		
		log.info("vo : "+vo);
				
		model.addAttribute("vo", vo);
	
		
								
		}
		
		
		
		
		
		
}
