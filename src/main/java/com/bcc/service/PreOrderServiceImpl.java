package com.bcc.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcc.domain.PreOrderVO;
import com.bcc.persistence.PreOrderDAO;

@Service
public class PreOrderServiceImpl implements PreOrderService{
	
	// DAO 객체 주입
	@Inject
	private PreOrderDAO dao;

	@Override
	public void insertPay(PreOrderVO vo) {
		dao.insertPay(vo);
		
	}


}
