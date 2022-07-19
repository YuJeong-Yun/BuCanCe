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
		
		return session.selectOne(NAMESPACE+".trendChart", date);
	}

	@Override
	public Integer getMonthlyChart(String date) {
		
		return session.selectOne(NAMESPACE+".monthlyChart", date);
	}

	@Override
	public Integer getWebMem(String date) {
		
		return session.selectOne(NAMESPACE+".webMem", date);
	}

	@Override
	public Integer getSNSMem(String date) {
		
		return session.selectOne(NAMESPACE+".SNSMem", date);
	}

	@Override
	public Integer totalMem() {
		
		return session.selectOne(NAMESPACE+".totalMem");
	}

	@Override
	public Integer totalPmMem() {
		
		return session.selectOne(NAMESPACE+".totalPmMem");
	}

	@Override
	public Integer totalComment() {
		
		return session.selectOne(NAMESPACE+".totalComment");
	}

	@Override
	public Integer totalAcc(String date) {
		
		return session.selectOne(NAMESPACE+".totalAcc", date);
	}
	
	
	
	
	
	
}
