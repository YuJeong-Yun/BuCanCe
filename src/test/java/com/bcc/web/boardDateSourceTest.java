package com.bcc.web;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class boardDateSourceTest {
	
	@Inject
	private DataSource ds;
	
	@Test
	public void testDateSoruce() {
		System.out.println("ds 테스트: "+ds);
		
		try {
			Connection con =ds.getConnection();
			System.out.println("연결 성공: "+con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
