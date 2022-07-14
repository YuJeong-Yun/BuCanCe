package com.bcc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.CommentVO;
import com.bcc.web.BoardController;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	SqlSession session;

	private static final String namespace = "com.bcc.mapper.CommentMapper";

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	// 댓글 조회
	@Override
	public List<CommentVO> readComment(int num) throws Exception {
		return session.selectList(namespace + ".readComment", num);
	}

	// 댓글 작성
	@Override
	public void wriComment(CommentVO vo) throws Exception {
		log.info(vo + "");
		session.insert(namespace + ".writeComment", vo);
	}

	// 댓글 수정
	@Override
	public void modify(CommentVO vo) throws Exception {
		session.update(namespace + ".modify", vo);

	}

	// 댓글 삭제
	@Override
	public void delete(CommentVO vo) throws Exception {
		session.delete(namespace + ".delete", vo);
	}

	// 선택된 댓글 조회
	@Override
	public CommentVO selectComment(int cno) throws Exception {
		System.out.println(session.selectOne(namespace + ".selectComment", cno) + "");
		System.out.println(cno);
		return session.selectOne(namespace + ".selectComment", cno);
	}

}
