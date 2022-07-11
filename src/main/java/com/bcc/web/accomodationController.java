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
import com.bcc.domain.roomSearch;
import com.bcc.service.roomService;

//숙박컨트롤러 
@Controller
@RequestMapping("/accomodation/*")
public class accomodationController {

	private static final Logger log = LoggerFactory.getLogger(accomodationController.class);

	@Inject
	private roomService service;
	


	// roomList 페이지 방목록페이지
	// http://localhost:8088/accomodation/roomList
	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public void roomListGET(Model model) throws IOException {

		log.info(" roomListGET() 호출 ");

		
			JSONArray roomList = service.roomList();

			model.addAttribute("roomList", roomList);

	
	
		
	}
	
	// roomList 페이지 방목록검색
	// http://localhost:8088/accomodation/roomList
	@RequestMapping(value = "/roomList", method = RequestMethod.POST)
	public void roomListPOST(Model model,roomSearch rs) throws IOException {

		log.info(" roomListPOST() 호출 ");

		
		
		JSONArray roomList = service.roomSearchList(rs);
//
		model.addAttribute("roomList", roomList);
		model.addAttribute("select_area", rs.getArea() );
		model.addAttribute("select_place", rs.getPlace_name() );
		
		
			
	}
	
	

	
	// 방정보상세보기
	// roomDetail 페이지
		// http://localhost:8088/accomodation/roomDetail
		@RequestMapping(value = "/roomDetail" ,method = RequestMethod.GET)
		public void roomDetailGET(Model model,@RequestParam("bno")
		String bno) throws IOException {

			log.info("roomDetailGET() 호출");


			log.info(bno);
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
			
			model.addAttribute("bno", bno);
			
			
			int ano_idx = bno.indexOf("ano=");
			
			log.info(ano_idx+"");
			
			String cc = bno.substring(ano_idx+4,bno.length());
			
			log.info(cc);
			model.addAttribute("ano", cc);
			
			
			
			
		}
	
	
		
		
		// 가격상세정보 roomPrice 페이지
		// http://localhost:8088/accomodation/roomPrice
		@RequestMapping(value = "/roomPrice" ,method = RequestMethod.GET)
			public void roomPriceGET(Model model,@RequestParam("bno")
			String bno) throws IOException {

			log.info("roomPriceGET() 호출");
				

			JSONArray roomPrice = service.roomPrice(bno);
			
			
			
			model.addAttribute("roomPrice", roomPrice);
			
		
	}
		
		
		
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
			
	   
		model.addAttribute("bno", bno);
		
		model.addAttribute("checkout",rd.getSel_date2().substring(8));
		model.addAttribute("checkin",rd.getSel_date().substring(8));
				
		model.addAttribute("checkoutFull",rd.getSel_date2());
		model.addAttribute("checkinFull",rd.getSel_date());
		
		
		
//				
		JSONArray roomReserve = service.roomReserve(bno,rd,ano);

		System.out.println("roomReserve : " +roomReserve);
		
		model.addAttribute("roomReserve", roomReserve);
		model.addAttribute("room_title", room_title);
			
	
		}
		
		
		// 대실예약페이지
		// http://localhost:8088/accomodation/roomPayment
		@RequestMapping(value = "/roomPayment" ,method = RequestMethod.GET)
		public void roomPaymentGET(roomReVO vo,Model model,
		HttpSession session
				) throws IOException {

		log.info("roomPaymentGET() 호출");
						
		log.info("vo : "+vo);
//		log.info(vo.getRoom_title());			
		model.addAttribute("vo", vo);
		
		session.setAttribute("userid", "admin");
		session.setAttribute("username", "김영수");
		session.setAttribute("useremail", "kld9223@naver.com");
		session.setAttribute("priId", "ddfv45fvfvdvs3a");
		session.setAttribute("usertel", "010-3795-9228");
		session.setAttribute("userAddress", "부산광역시 금정구 금정로 233-21번길 한진스카이 아파트 1003호");
		session.setAttribute("userPostCode", "46243");
		
		
		}
		
		// 숙박예약페이지
		// http://localhost:8088/accomodation/roomPayment2
		@RequestMapping(value = "/roomPayment2" ,method = RequestMethod.GET)
		public void roomPayment2GET(roomReVO vo,Model model,
		HttpSession session
				) throws IOException {

		log.info("roomPayment2GET() 호출");
								
		log.info("vo : "+vo);
//		log.info(vo.getRoom_title());			
				
		model.addAttribute("vo", vo);
		session.setAttribute("userid", "admin");
		session.setAttribute("username", "김영수");
		session.setAttribute("useremail", "kld9223@naver.com");
		session.setAttribute("priId", "1234432fgg0000122");
		session.setAttribute("usertel", "010-3795-9228");
		session.setAttribute("userAddress", "부산광역시 금정구 금정로 233-21번길 한진스카이 아파트 1003호");
		session.setAttribute("userPostCode", "46243");
				
				
		}
		
		
		
		// 결제 완료시 DB
		// http://localhost:8088/accomodation/roomPayDB
		@RequestMapping(value = "/roomPayDB" ,method =RequestMethod.GET)
		public void roomPayDBGET(roomPayVO vo,Model model) throws IOException {

		log.info("roomPayDBGET() 호출");
										
		log.info("vo : "+vo);	
						
		service.roomPay(vo);
		
		model.addAttribute("vo", vo);
		
		
		}
		
		
		// 결제완료후 내역 페이지
		// http://localhost:8088/accomodation/roomPaymentDB
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
		
		
		String userId="admin";
		
		List<roomPayVO> list = service.roomUserPayInfo(userId);	
				
		log.info("payList : "+list);
		
		//해당 유저의 예약정보
		model.addAttribute("UserPayList", list);
				
		}
		
		
		//결제환불
		
		
		
		
		
		
		
		
		
		
}
