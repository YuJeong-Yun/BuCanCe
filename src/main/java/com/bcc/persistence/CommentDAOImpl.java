package com.bcc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bcc.domain.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	SqlSession session;

	private static final String namespace = "com.bcc.mapper.CommentMapper";

	// 댓글 조회
	@Override
	public List<CommentVO> readComment(int num) throws Exception {
		return session.selectList(namespace + ".readComment", num);
	}

	// 댓글 작성
	@Override
	public void wriComment(CommentVO vo) throws Exception {
		session.insert(namespace + ".writeComment", vo);
	}

	// 댓글 수정
	@Override
	public void modify(CommentVO vo) throws Exception {
		session.update(namespace + ".modify", vo);

	}

	//댓글 삭제
	@Override
	public void delete(CommentVO vo) throws Exception {
		session.delete(namespace + ".delete", vo);
	}

}
