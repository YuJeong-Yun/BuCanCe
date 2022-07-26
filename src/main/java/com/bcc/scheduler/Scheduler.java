package com.bcc.scheduler;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.bcc.domain.PreMemberVO;
import com.bcc.domain.PreOrderVO;
import com.bcc.persistence.PreMemberDAO;
import com.bcc.service.PreMemberService;

public class Scheduler {

	private static final Logger log = LoggerFactory.getLogger(Scheduler.class);

	@Autowired
	private PreMemberDAO dao;
	@Autowired
	private PreMemberVO dpv;
	@Autowired
	private PreOrderVO ovo;
	@Autowired
	private PreMemberService service;

	public static boolean onScheduled = false;

	// 프리미엄 회원 자동삭제 스케줄 : 매일 1시 진행
	// Premium_Member테이블에 license_deadline = curdate()시 삭제
	@Scheduled(cron = "* * 1 * * ?")
	public void delete(HttpSession session) {
		// 스케쥴러 시작
		log.info(new Date() + " 회원 삭제 스케쥴러 실행");
		onScheduled = true;

		// 서비스 시작
		service.delPreMember(dpv);

		System.out.println("delPreMember 스케줄러");

		// 스케쥴러 끝남
		onScheduled = false;

	}

	// 구독권 정기결재(재결제) 스케줄 : 매일 3시 진행
	// Premium_Order테이블에 next_order_date = curdate()시 삭제
	@Scheduled(cron = "* * 3 * * ?")
	public void reOrder(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {

		// 스케쥴러 시작
		log.info(new Date() + "재결제 스케쥴러 실행");
		onScheduled = true;

		Date reorderDay = ovo.getNext_order_date();
		Date today = new Date();
		String key = ovo.getPCD_PAYER_ID();

		if (reorderDay == today && key.length() != 0) {
			// paySimpleSend.jsp 실행해야함
			response.sendRedirect(request.getContextPath() + "/order/paySimpleSend");

		} else {
			System.out.println("reOrder 변동사항 없음");
		}
		// 스케쥴러 끝남
		onScheduled = false;

	}

}
