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
	public List<CommentVO> getComment(Integer num) {
		return session.selectList(namespace + ".getComment", num);
	}

	// 댓글 작성
	@Override
	public void putComment(CommentVO vo) {
		log.info(vo + "");
		session.insert(namespace + ".putComment", vo);
		session.update(namespace + ".modCommentCnt", vo.getNum());
	}

	// 댓글 수정
	@Override
	public void modComment(CommentVO vo) {
		session.update(namespace + ".modComment", vo);

	}

	// 댓글 삭제
	@Override
	public void delComment(CommentVO vo) {
		session.delete(namespace + ".delComment", vo);
	}

	// 선택된 댓글 조회
	@Override
	public CommentVO getSelectComment(Integer cno) {
		System.out.println(cno);
		return session.selectOne(namespace + ".getSelectComment", cno);
	}

}
