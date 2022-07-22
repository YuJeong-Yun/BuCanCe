package com.bcc.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcc.domain.PreOrderVO;
import com.bcc.service.PreOrderService;

@Controller
@RequestMapping("/preOrder/*")
public class PreOrderController{
	
	private static final Logger log = LoggerFactory.getLogger(PreOrderController.class);
	

	// 서비스 객체 주입
	@Inject
	private PreOrderService service;
	
	// 주문하기 - GET
	// http://localhost:8088/preOrder/payTest
	@RequestMapping(value = "/payTest", method = RequestMethod.GET)
	public void payTestGET() throws Exception{
		log.info("payTestGET() 호출");
		
	}
	

	// 주문하기 - POST
	@RequestMapping(value = "/payTest", method = RequestMethod.POST)
	public String payTestPOST(PreOrderVO vo, RedirectAttributes rttr) throws Exception {
		log.info("payTestPOST() 호출");

		// 한글처리(=> web.xml 필터로 처리)
		// 전달된 정보 저장(글쓰기 정보) - form 태그는 parameter로
		log.info("주문정보 : " + vo);

		// 서비스 동작 호출
		service.insertPay(vo);
		log.info("주문 완료");

		// 정보를 전달
		rttr.addFlashAttribute("result", "REGOK");

		// return "/board/success";
		// return "redirect:/board/listAll?msg=ok";
		
		return "redirect:/index";
	}



	
	
	

}