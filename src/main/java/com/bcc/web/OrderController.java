package com.bcc.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcc.domain.MemberVO;
import com.bcc.domain.PreMemberVO;
import com.bcc.domain.PreOrderVO;
import com.bcc.scheduler.Scheduler;
import com.bcc.service.MemberService;
import com.bcc.service.PreMemberService;
import com.bcc.service.PreOrderService;

@Controller
@RequestMapping(value = "/order/*")
public class OrderController extends PaypleController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	// 서비스 객체 주입
	@Inject
	private PreOrderService orderservice;
	@Inject
	private PreMemberService memberservice;
	@Inject	
	private MemberService service;

///////////////////////////////////////////////////////////////
	// 정기결제 정지(빌링키 삭제)
		// http://localhost:8088/order/deleteKey
		// http://localhost:8088/mypage
		@RequestMapping(value = "/deleteKey", method = RequestMethod.GET)
		public String deleteKeyGET(HttpSession session, PreOrderVO vo) throws Exception {
			
			// 임시
			session.setAttribute("id", "hg");
			String PCD_PAYER_NAME = (String) session.getAttribute("id");		
			
			log.info(" deleteKeyGET() 호출 ");
			
			// 서비스 - 빌링키 불러오기
			vo.setPCD_PAYER_NAME(PCD_PAYER_NAME);
			String PCD_PAYER_ID = orderservice.getKey(vo);
			log.info(" getKey(vo) : 빌링키 왔다 ");
			
			if(PCD_PAYER_ID == null) {
				log.info("빌링키 없노");
				
				return "order/noDeleteKey";
			}

			return "/order/deleteKeyForm";

		}
		
		@RequestMapping(value = "/deleteKey", method = RequestMethod.POST)
		public String deleteKeyPOST(HttpSession session, Model model, HttpServletResponse response,
				PreOrderVO vo) throws Exception {

			log.info(" deleteKeyPOST() 호출 ");

				// 임시
				session.setAttribute("id", "hg");
				String PCD_PAYER_NAME = (String) session.getAttribute("id");				
				
				// 서비스 - 빌링키 불러오기
				vo.setPCD_PAYER_NAME(PCD_PAYER_NAME);
				String PCD_PAYER_ID = orderservice.getKey(vo);
				log.info(" getKey(vo) : 빌링키 왔다 ");

				// 서비스 - 회원삭제동작
				orderservice.delKey(vo);
				log.info(" delKey(vo): 정기결제 해지 ");
				
			return "/order/goods";

		}

////////////////////////////////////////////////////////////////////////	
	
	/*
	 * goods.jsp : 물건 페이지
	 */
	@RequestMapping(value = "/goods")
// http://localhost:8088/order/goods
	public String goods(Model model) {
		model.addAttribute("pay_goods", "프리미엄 이용권"); // 상품명
		model.addAttribute("pay_total", "100"); // 결제요청금액
		return "/order/goods";
	}

	/*
	 * orderInfo.jsp : 주문안내 페이지
	 */
	@RequestMapping(value = "/orderInfo")
// http://localhost:8088/order/orderInfo
	public String orderInfo(Model model, HttpSession session) {
		
		model.addAttribute("payer_no", "1234"); // 파트너 회원 고유번호 > 선택사항 그거없셔
		model.addAttribute("payer_name", "itwill2"); // 결제자 이름
		model.addAttribute("payer_hp", "010-1111-1111"); // 결제자 휴대전화번호
		model.addAttribute("payer_email", "itwill2@naver.com"); // 결제자 이메일
		model.addAttribute("pay_goods", "프리미엄 이용권"); // 상품명
		model.addAttribute("pay_total", "100"); // 결제요청금액
		return "/order/orderInfo";
	}

	@RequestMapping(value = "/order1")
// http://localhost:8088/order/order1
	public String order1(Model model, HttpSession session) throws Exception {
		log.info("order1() 호출");
		log.info("일반 결제 페이지 호출");

// String id = (String) session.getAttribute("id");
// 이름 휴대전화 이메일 불러오기 에효
// String name = service2.getName(id);
// String tel = service2.getTel(id);
// String email = service2.getEmail(id);
		model.addAttribute("payer_no", "1234"); // 파트너 회원 고유번호 > 선택사항 그거없셔
		model.addAttribute("payer_name", "itwill2"); // 결제자 이름
		model.addAttribute("payer_hp", "010-1111-1111"); // 결제자 휴대전화번호
		model.addAttribute("payer_email", "itwill2@naver.com"); // 결제자 이메일
		model.addAttribute("pay_goods", "프리미엄 이용권"); // 상품명
		model.addAttribute("pay_total", "100"); // 결제요청금액
// 페이지 이동(메인페이지)
		return "/order/order1";
	}

	@RequestMapping(value = "/order2")
// http://localhost:8088/order/order2
	public String order2(Model model, HttpSession session) throws Exception {
		log.info("order2() 호출");
		log.info("정기 결제 페이지 호출");

// 이름 휴대전화 이메일 불러오기 에효
// String name = service2.getName(id);
// String tel = service2.getTel(id);
// String email = service2.getEmail(id);

		model.addAttribute("payer_no", "1234"); // 파트너 회원 고유번호 > 선택사항 그거없셔
		model.addAttribute("payer_name", "itwill2"/* name */); // 결제자 이름
		model.addAttribute("payer_hp", "010-1111-1111"/* tel */); // 결제자 휴대전화번호
		model.addAttribute("payer_email", "itwill2@naver.com"/* email */); // 결제자 이메일
		model.addAttribute("pay_goods", "프리미엄 정기 구독권"); // 상품명
		model.addAttribute("pay_total", "100"); // 결제요청금액

//
		model.addAttribute("id", "sb");
//model.addAttribute("credate_date", ""); 	
//model.addAttribute("license_deadline",""); 	
//model.addAttribute("next_order_date", ""); 

// 페이지 이동(메인페이지)
		return "/order/order2";
	}

	/*
	 * 
	 * order_confirm.jsp : 결제확인 페이지
	 */
	@RequestMapping(value = "/order_confirm")
// http://localhost:8088/order/orde_confirm
	public String order_confirm(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		model.addAttribute("pay_type", request.getParameter("pay_type")); // 결제수단 (transfer|card)
		model.addAttribute("pay_work", request.getParameter("pay_work")); // 결제요청 방식 (AUTH | PAY | CERT)
		model.addAttribute("payer_id", request.getParameter("payer_id")); // 결제자 고유 ID (빌링키)
		model.addAttribute("payer_no", request.getParameter("payer_no")); // 파트너 회원 고유번호
		model.addAttribute("payer_name", request.getParameter("payer_name")); // 결제자 이름
		model.addAttribute("payer_hp", request.getParameter("payer_hp")); // 결제자 휴대전화번호
		model.addAttribute("payer_email", request.getParameter("payer_email")); // 결제자 이메일
		model.addAttribute("pay_goods", request.getParameter("pay_goods")); // 상품명
		model.addAttribute("pay_total", request.getParameter("pay_total")); // 결제요청금액
		model.addAttribute("pay_taxtotal", request.getParameter("pay_taxtotal")); // 부가세(복합과세 적용 시)
		model.addAttribute("pay_istax", request.getParameter("pay_istax")); // 과세 여부 (과세:Y 비과세:N)
		model.addAttribute("pay_oid", request.getParameter("pay_oid")); // 주문번호
		model.addAttribute("taxsave_flag", request.getParameter("taxsave_flag")); // 현금영수증 발행요청 (Y|N)
		model.addAttribute("simple_flag", request.getParameter("simple_flag")); // 간편결제 여부 (Y|N)
		model.addAttribute("card_ver", request.getParameter("card_ver")); // 카드 세부 결제방식
		model.addAttribute("payer_authtype", request.getParameter("payer_authtype")); // 비밀번호 결제 인증방식 (pwd : 패스워드 인증)
		model.addAttribute("is_direct", request.getParameter("is_direct")); // 결제창 호출 방식 (DIRECT: Y | POPUP: N)
		model.addAttribute("hostname", System.getenv("HOSTNAME"));
// 임시
		model.addAttribute("id", request.getParameter("id"));
//model.addAttribute("credate_date", request.getParameter("credate_date")); 	
//model.addAttribute("license_deadline", request.getParameter("license_deadline")); 	
//model.addAttribute("next_order_date", request.getParameter("next_order_date")); 	

// 파트너 인증
		JSONObject obj = new JSONObject();
		obj = payAuth(null);
// 파트너 인증 후 결제요청 시 필요한 필수 파라미터
		model.addAttribute("authKey", obj.get("AuthKey")); // 인증 키
		model.addAttribute("payReqURL", obj.get("return_url")); // 결제요청 URL

		return "/order/order_confirm";
	}

	/*
	 * order_result.jsp : 결제결과 확인 페이지
	 */
// http://localhost:8088/order/order_result
// http://localhost:8088/order/goods
	@RequestMapping(value = "/order_result")
	public String order_result(HttpServletRequest request, Model model, HttpSession session, PreOrderVO pvo,
			PreMemberVO vo) throws Exception {

// 1. 결제결과 모두 출력
		Enumeration<String> params = request.getParameterNames();
		String result = "";
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();
			result += name + " => " + request.getParameter(name) + "<br>";
		}
		model.addAttribute("result", result);
// 2. 결제결과 파라미터로 받기 - 응답 파라미터를 받아서 활용해보세요.

		model.addAttribute("pay_rst", request.getParameter("PCD_PAY_RST")); // 결제요청 결과 (success | error)
		model.addAttribute("pay_code", request.getParameter("PCD_PAY_CODE")); // 결제요청 결과 코드
		model.addAttribute("pay_msg", request.getParameter("PCD_PAY_MSG")); // 결제요청 결과 메세지
		model.addAttribute("pay_type", request.getParameter("PCD_PAY_TYPE")); // 결제수단 (transfer|card)
		model.addAttribute("card_ver", request.getParameter("PCD_CARD_VER")); // 카드 세부 결제방식
		model.addAttribute("pay_work", request.getParameter("PCD_PAY_WORK")); // 결제요청 방식 (AUTH | PAY | CERT)
		model.addAttribute("auth_key", request.getParameter("PCD_AUTH_KEY")); // 결제요청 파트너 인증 토큰 값
		model.addAttribute("pay_reqkey", request.getParameter("PCD_PAY_REQKEY")); // (CERT방식) 최종 결제요청 승인키
		model.addAttribute("pay_cofurl", request.getParameter("PCD_PAY_COFURL")); // (CERT방식) 최종 결제요청 URL
		model.addAttribute("payer_id", request.getParameter("PCD_PAYER_ID")); // 결제자 고유 ID (빌링키)
		model.addAttribute("payer_no", request.getParameter("PCD_PAYER_NO")); // 결제자 고유번호 (파트너사 회원 회원번호)
		model.addAttribute("payer_name", request.getParameter("PCD_PAYER_NAME")); // 결제자 이름
		model.addAttribute("payer_hp", request.getParameter("PCD_PAYER_HP")); // 결제자 휴대전화번호
		model.addAttribute("payer_email", request.getParameter("PCD_PAYER_EMAIL")); // 결제자 이메일 (출금결과 수신)
		model.addAttribute("pay_oid", request.getParameter("PCD_PAY_OID")); // 주문번호
		model.addAttribute("pay_goods", request.getParameter("PCD_PAY_GOODS")); // 상품명
		model.addAttribute("pay_total", request.getParameter("PCD_PAY_TOTAL")); // 결제요청금액
		model.addAttribute("pay_taxtotal", request.getParameter("PCD_PAY_TAXTOTAL")); // 부가세(복합과세 적용 시)
		model.addAttribute("pay_istax", request.getParameter("PCD_PAY_ISTAX")); // 과세 여부 (과세:Y 비과세:N)
		model.addAttribute("pay_date", request.getParameter("PCD_PAY_TIME") == null ? ""
				: request.getParameter("PCD_PAY_TIME").substring(0, 8)); // 결제완료 일자
		model.addAttribute("pay_bankacctype", request.getParameter("PCD_PAY_BANKACCTYPE")); // 고객 구분 (법인 | 개인 or 개인사업자)
		model.addAttribute("pay_bank", request.getParameter("PCD_PAY_BANK")); // 은행코드
		model.addAttribute("pay_bankname", request.getParameter("PCD_PAY_BANKNAME")); // 은행명
		model.addAttribute("pay_banknum", request.getParameter("PCD_PAY_BANKNUM")); // 계좌번호
		model.addAttribute("taxsave_rst", request.getParameter("PCD_TAXSAVE_RST")); // 현금영수증 발행결과 (Y|N)
		model.addAttribute("pay_cardname", request.getParameter("PCD_PAY_CARDNAME")); // 카드사명
		model.addAttribute("pay_cardnum", request.getParameter("PCD_PAY_CARDNUM")); // 카드번호
		model.addAttribute("pay_cardtradenum", request.getParameter("PCD_PAY_CARDTRADENUM")); // 카드 거래번호
		model.addAttribute("pay_cardauthno", request.getParameter("PCD_PAY_CARDAUTHNO")); // 카드 승인번호
		model.addAttribute("pay_cardreceipt", request.getParameter("PCD_PAY_CARDRECEIPT")); // 카드 매출전표 URL
		
         // DB에 저장
		try {
            orderservice.putOrder(pvo);
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			memberservice.putPreMember(vo);
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/order/order_result";
	}

	/*
	 * payCertSend : 결제요청 재컨펌 (CERT)
	 */
// http://localhost:8088/order/goods
	@ResponseBody
	@PostMapping(value = "/payCertSend")
	public JSONObject payCertSend(HttpServletRequest request, PreOrderVO vo, PreMemberVO voo) {
		JSONObject jsonObject = new JSONObject();
		JSONParser jsonParser = new JSONParser();
// 결제요청 재컨펌(CERT) 데이터 - 필수
		String auth_key = request.getParameter("PCD_AUTH_KEY"); // 파트너 인증 토큰 값
		String payer_id = request.getParameter("PCD_PAYER_ID"); // 결제자 고유 ID (빌링키)
		String pay_reqkey = request.getParameter("PCD_PAY_REQKEY"); // 최종 결제요청 승인키
		String pay_cofurl = request.getParameter("PCD_PAY_COFURL"); // 최종 결제요청 URL
		try {
// 결제요청 재컨펌(CERT) 요청 전송
			JSONObject refundObj = new JSONObject();
			refundObj.put("PCD_CST_ID", "test"); // 파트너사 cst_id
			refundObj.put("PCD_CUST_KEY", "abcd1234567890"); // 파트너사 custKey
			refundObj.put("PCD_AUTH_KEY", auth_key);
			refundObj.put("PCD_PAYER_ID", payer_id); // 빌링키
			refundObj.put("PCD_PAY_REQKEY", pay_reqkey);
			URL url = new URL(pay_cofurl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("referer", "http://localhost:8080");
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(refundObj.toString());
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			jsonObject = (JSONObject) jsonParser.parse(response.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

//////////// 대망의 정기결제///////////////
////////// 하 스케쥴러랑 같이해야함 할 수 있다 있나?///////////////
////////////////////////////////////
// 정기결제 재결제(빌링키결제) (paySimpleSend.jsp)
	@RequestMapping(value = "/paySimpleSend")
	public String paySimpleSendRoute(Model model, HttpSession session, PreOrderVO vo) {
// 임시 아이디
		session.setAttribute("id", "et");
		String id = (String) session.getAttribute("id");
// 이름 휴대전화 이메일 불러오기 에효
		String email = memberservice.getEmail(id);
// 빌링키 가져오기
		String PCD_PAYER_ID = orderservice.getKey(vo);

		model.addAttribute("payer_id", PCD_PAYER_ID); // 결제자 고유 ID (빌링키)
		model.addAttribute("pay_goods", "프리미엄 이용권"); // 상품명
		model.addAttribute("pay_total", "100"); // 결제요청금액
		model.addAttribute("payer_no", "1234"); // 결제자 고유번호 (파트너사 회원 회원번호)
		model.addAttribute("payer_email", email); // 결제자 이메일
		return "/order/paySimpleSend";
	}

	/*
	 * paySimpleSend : 정기결제 재결제(빌링키 결제)
	 */
	@ResponseBody
	@PostMapping(value = "/paySimpleSend")
	public JSONObject paySimpleSend(HttpServletRequest request, HttpSession session, PreOrderVO vo, PreMemberVO mvo) {
		JSONObject jsonObject = new JSONObject();
		JSONParser jsonParser = new JSONParser();
// 정기결제 재결제 전 파트너 인증
		Map<String, String> bilingParams = new HashMap<String, String>();
		bilingParams.put("PCD_PAY_TYPE", request.getParameter("PCD_PAY_TYPE"));
		bilingParams.put("PCD_SIMPLE_FLAG", "Y");
// PCD_SIMPLE_FLAG : 빌링키 결제 , 빌링키아니면"N"
		JSONObject authObj = new JSONObject();
		authObj = payAuth(bilingParams);
		System.out.println(authObj.toString());
// 임시 아이디
		session.setAttribute("id", "et");
		String id = (String) session.getAttribute("id");
// 빌링키 가져오기
		String PCD_PAYER_ID = orderservice.getKey(vo);
// 파트너 인증 응답값
		String cstId = (String) authObj.get("cst_id"); // 파트너사 ID :"cst_id"
		String custKey = (String) authObj.get("custKey"); // 파트너사 키:"custKey"
		String authKey = (String) authObj.get("AuthKey"); // 인증 키
		String bilingURL = (String) authObj.get("return_url"); // 카드 정기결제 재결제 요청 URL
// 정기결제 재결제 요청 파라미터
		String pay_type = request.getParameter("card"); // (필수) 결제수단 (card | transfer)
		String payer_id = request.getParameter(PCD_PAYER_ID); // (필수) 결제자 고유 ID (빌링키)
		String pay_goods = request.getParameter("프리미엄 이용권"); // (필수) 상품명
		String pay_total = request.getParameter("100"); // (필수) 결제요청금액
		try {
// 정기결제 재결제 요청 전송
			JSONObject bilingObj = new JSONObject();
			bilingObj.put("PCD_CST_ID", cstId);
			bilingObj.put("PCD_CUST_KEY", custKey);
			bilingObj.put("PCD_AUTH_KEY", authKey);
			bilingObj.put("PCD_PAY_TYPE", pay_type);
			bilingObj.put("PCD_PAYER_ID", payer_id);
			bilingObj.put("PCD_PAY_GOODS", pay_goods);
			bilingObj.put("PCD_SIMPLE_FLAG", "Y");
			bilingObj.put("PCD_PAY_TOTAL", pay_total);
			System.out.println(bilingObj.toString());
			URL url = new URL(bilingURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("charset", "UTF-8");
			con.setRequestProperty("referer", "http://localhost:8088");
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(bilingObj.toString().getBytes());
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			jsonObject = (JSONObject) jsonParser.parse(response.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

// DB에 결과저장

		try {
			orderservice.putReOrder(vo);
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			memberservice.putPreMember(mvo);
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}


		return jsonObject;
	}

	/*
	 * 
	 * errorScheduled.jsp : 서버 점검 페이지
	 */
// http://localhost:8088/order/errorScheduled

	@RequestMapping(value = "/errorScheduled", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);
		Scheduler sche = new Scheduler();
		Scheduler sche2 = new Scheduler();

// 스케쥴러 실행중이면 서버 점검 페이지로 이동
		if (sche.onScheduled == true) {
			return "/order/errorScheduled";
		} else if (sche2.onScheduled == true) {
			return "/order/errorScheduled";
		} else {
			return "/order/goods";
		}

	}

}