package com.bcc.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.PreOrderVO;
import com.bcc.persistence.PreOrderDAO;

@Service
public class PreOrderServiceImpl implements PreOrderService {

	private static final Logger log = LoggerFactory.getLogger(PreOrderServiceImpl.class);

	// DAO 객체 주입
	@Inject
	private PreOrderDAO dao;

	// 결제
	@Override
	public void putOrder(PreOrderVO pvo) {
		
		System.out.println(" service.insertOrder 호출");

		dao.putOrder(pvo);

	}

	// 재결제(정기결제)
	@Override
	public void putReOrder(PreOrderVO rvo) {
		log.info(" service.ReOrder 호출");

		dao.putReOrder(rvo);

	}

	// 빌링키 가져오기
	@Override
	public String getKey(PreOrderVO vo) {
		log.info(" service.getKey 호출");

		return dao.getKey(vo);
	}

	// 결제 정지 (빌링키 삭제)
	@Override
	public void delKey(PreOrderVO dvo) {
		log.info(" service.delKey 호출");

		dao.delKey(dvo);

	}
}
