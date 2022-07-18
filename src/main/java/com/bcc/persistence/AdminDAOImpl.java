package com.bcc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.PreOrderVO;


@Repository
public class AdminDAOImpl implements AdminDAO{
	

	private static final Logger log = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	private SqlSession session;

	private static String NAMESPACE = "com.bcc.mapper.adminMapper";

	@Override
	public List<PreOrderVO> getPmInfo(String date) {
		Map<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("start", date.split(" ")[0]);
		dateMap.put("end", date.split(" ")[1]);
		
		return session.selectList(NAMESPACE+".pmInfo",dateMap);
	}

	@Override
	public List<PreOrderVO> getOnlyPeriod(String date) {
		Map<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("start", date.split(" ")[0]);
		dateMap.put("end", date.split(" ")[1]);
		
		return session.selectList(NAMESPACE+".onlyPeriodMems",dateMap);
	}

	@Override
	public Integer getTrendChart(String date) {
		Map<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("day", date.split(" ")[0]);
		dateMap.put("month", date.split(" ")[1]);
		
		return session.selectOne(NAMESPACE+".trendChart",dateMap);
	}

	@Override
	public Integer getMonthlyChart(String date) {
		Map<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("year", date.split(" ")[0]);
		dateMap.put("month", date.split(" ")[1]);
		
		return session.selectOne(NAMESPACE+".monthlyChart",dateMap);
	}
	

	
	
	
	
}
