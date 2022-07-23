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

	// 댓글 조회
	@Override
	public List<CommentVO> readComment(Integer num) {
		return dao.getComment(num);
	}

	// 댓글 작성
	@Override
	public void createComment(CommentVO vo) {
		dao.putComment(vo);
	}

	// 댓글 수정
	@Override
	public void update(CommentVO vo) {
		dao.modComment(vo);
	}

	// 댓글 삭제
	@Override
	public void delete(CommentVO vo) {
		dao.delComment(vo);
	}

	// 선택된 댓글 조회
	@Override
	public CommentVO selectComment(Integer cno) {
		return dao.getSelectComment(cno);
	}

}
