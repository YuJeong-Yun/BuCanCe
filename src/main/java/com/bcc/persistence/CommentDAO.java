package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.CommentVO;

public interface CommentDAO {
	// 댓글 조회
	public List<CommentVO> getComment(Integer num);

	// 댓글 작성
	public void putComment(CommentVO vo);

	// 댓글 수정
	public void modComment(CommentVO vo);

	// 댓글 삭제
	public void delComment(CommentVO vo);

//	//선택된 댓글 조회
	public CommentVO getSelectComment(Integer cno);

}
