package com.bcc.service;

import java.util.List;

import com.bcc.domain.CommentVO;

public interface CommentService {

	// 댓글 조회
	public List<CommentVO> readComment(Integer num) throws Exception;

	// 댓글 작성
	public void createComment(CommentVO vo) throws Exception;

	//댓글 수정
	public void update(CommentVO vo) throws Exception;
	
	//댓글 삭제
	public void delete(CommentVO vo) throws Exception;
	
//	//선택된 댓글 조회
	public CommentVO selectComment(Integer cno) throws Exception;


	

}
