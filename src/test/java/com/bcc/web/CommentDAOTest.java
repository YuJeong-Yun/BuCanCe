package com.bcc.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bcc.domain.CommentVO;
import com.bcc.persistence.CommentDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentDAOTest {
	
	private static final Logger log = LoggerFactory.getLogger(CommentDAOTest.class);
	
	@Inject
	private CommentDAO dao;
	
	 @Test
	    public void testReplyCreate() throws Exception {

	            CommentVO CommentVO = new CommentVO();
	            CommentVO.setCno(8);
	            CommentVO.setContent(3+"번째 댓글입니다..");
	            CommentVO.setWriter("user");
	            CommentVO.setVisit(1);
	            dao.createComment(CommentVO);
	        }

	
	
	

}
