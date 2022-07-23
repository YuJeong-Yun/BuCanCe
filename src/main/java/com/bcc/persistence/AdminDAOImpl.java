package com.bcc.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.KakaoVO;
import com.bcc.domain.MemberVO;
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
		
		return session.selectList(NAMESPACE+".getPmInfo",dateMap);
	}

	@Override
	public List<PreOrderVO> getOnlyPeriod(String date) {
		Map<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("start", date.split(" ")[0]);
		dateMap.put("end", date.split(" ")[1]);
		
		return session.selectList(NAMESPACE+".getOnlyPeriodMems",dateMap);
	}

	@Override
	public Integer getTrendChart(String date) {
		
		return session.selectOne(NAMESPACE+".getTrendChart", date);
	}

	@Override
	public Integer getMonthlyChart(String date) {
		
		return session.selectOne(NAMESPACE+".getMonthlyChart", date);
	}

	@Override
	public Integer getWebMem(String date) {
		
		return session.selectOne(NAMESPACE+".getWebMem", date);
	}

	@Override
	public Integer getSNSMem(String date) {
		
		return session.selectOne(NAMESPACE+".getSNSMem", date);
	}

	@Override
	public Integer getTotalMem() {
		
		return session.selectOne(NAMESPACE+".getTotalMem");
	}

	@Override
	public Integer getTotalPmMem() {
		
		return session.selectOne(NAMESPACE+".getTotalPmMem");
	}

	@Override
	public Integer getTotalComment() {
		
		return session.selectOne(NAMESPACE+".getTotalComment");
	}

	@Override
	public Integer getTotalAcc(String date) {
		
		return session.selectOne(NAMESPACE+".getTotalAcc", date);
	}

	@Override
	public List<MemberVO> getAllWebMem() {
	List<MemberVO> mg = new ArrayList<MemberVO>();
		return session.selectList(NAMESPACE+".getAllWebMem");
	}

	@Override
	public List<KakaoVO> getAllSnsMem() {
		List<KakaoVO> kakao = new ArrayList<KakaoVO>();
		return session.selectList(NAMESPACE+".getAllSnsMem", kakao);
	}

	@Override
	public void delMem(MemberVO vo) {
		 session.delete(NAMESPACE+".delMem",vo);
	}
}
