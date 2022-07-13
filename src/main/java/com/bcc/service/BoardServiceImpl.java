package com.bcc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;

	@Override
	public Integer checkThumb(int b_num, String id) {
		
		return dao.checkThumb(b_num,id);
	}

	@Override
	public void updateThumb(int b_num, int b_category, String id) {
		int result = dao.checkThumb(b_num, id);
		
		if(result == 1) {
			// ���ƿ� ��� ���� �� ī��Ʈ-1, ���̺��� ��� ����
			dao.subThumb(b_num);
			dao.deleteThumb(b_num, id);
		} else if (result == 0) {
			// ���ƿ� ��� ���� �� ī��Ʈ+1, ���̺� ����
			dao.addThumb(b_num);
			dao.insertThumb(b_num, b_category, id);
		}
		
	}
	
	

}
