package com.bcc.service;

import javax.inject.Inject;

import com.bcc.persistence.BoardDAO;

public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;

	@Override
	public Integer checkThumb(String id) {
		
		return null;
	}
	
	

}
