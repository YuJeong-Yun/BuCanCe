package com.bcc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcc.domain.PremiumOrderVO;
import com.bcc.persistence.AdminDAO;


@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;

	@Override
	public List<PremiumOrderVO> getPmInfo(String date) {
		
		return dao.getPmInfo(date);
	}

	@Override
	public List<String> getPm(String date) {
		
		return dao.getPm(date);
	}

	@Override
	public List<PremiumOrderVO> getOnlyPeriod(String date) {
		
		return dao.getOnlyPeriod(date);
	}
	
	
	
	
	
}
