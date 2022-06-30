package com.bcc.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bcc.domain.BoardVO;
import com.bcc.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;

	@Test
	public void testInsertBoard() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setId("관리자");
		vo.setPw("1234");
		vo.setTitle("test");
		vo.setContent("test111");
		vo.setReadcount(1);
		vo.setBno(1);
		vo.setcom_cnt(1);
		vo.setHeart_cnt(1);
		
		
		dao.create(vo);
		
	}

}
