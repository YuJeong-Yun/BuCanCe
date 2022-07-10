package com.bcc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcc.domain.CommentVO;
import com.bcc.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO dao;

	//댓글 조회
	@Override
	public List<CommentVO> readComment(int num) throws Exception {
		return dao.readComment(num);
	}
	//댓글 작성
	@Override
	public void wriComment(CommentVO vo) throws Exception {
		dao.wriComment(vo);
	}
	//댓글 수정
	@Override
	public void modify(CommentVO vo) throws Exception {
		dao.modify(vo);		
	}
	//댓글 삭제
	@Override
	public void delete(CommentVO vo) throws Exception {
		dao.delete(vo);
	}
	
	

}
