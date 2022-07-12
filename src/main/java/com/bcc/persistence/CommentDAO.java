package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.CommentVO;

public interface CommentDAO {
	//댓글 조회
	public List<CommentVO> readComment(int num) throws Exception;

	//댓글 작성
	public void wriComment(CommentVO vo) throws Exception;
	
	//댓글 수정
	public void modify(CommentVO vo) throws Exception;
	
	//댓글 삭제
	public void delete(CommentVO vo) throws Exception;
	
	//선택된 댓글 조회
	public CommentVO selectComment(int cno) throws Exception;

}
