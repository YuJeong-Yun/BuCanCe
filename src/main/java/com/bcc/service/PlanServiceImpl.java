package com.bcc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.BoardVO;
import com.bcc.domain.GrpAcceptVO;
import com.bcc.domain.HotelVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PlanMemberVO;
import com.bcc.domain.PlanVO;
import com.bcc.persistence.PlanDAO;

@Service
public class PlanServiceImpl implements PlanService {
	
	private static final Logger log = LoggerFactory.getLogger(PlanServiceImpl.class);
	
	@Inject
	private PlanDAO dao;

	@Override
	public List<MemberVO> getMemberList(String id) {
		return dao.getMemberList(id);
	}

	@Override
	public Integer getGrpNum() {
		return dao.getGrpNum();
	}

	@Override
	public void createGrp(PlanVO vo) {
		dao.createGrp(vo);
	}

	@Override
	public String getLicense(String id) {
		int result = dao.getLicense(id);
		if(result == 0) {
			return "free";
		}else {
			return "premium";
		}
	}

	@Override
	public List<GrpAcceptVO> getGrpAcceptList(String receiver) {
		return dao.getGrpAcceptList(receiver);
	}

	@Override
	public void insertGrpMember(PlanMemberVO member) {
		dao.insertGrpMember(member);
	}

	@Override
	public void deleteInvitation(GrpAcceptVO vo) {
		dao.deleteInvitation(vo);
	}

	@Override
	public List<PlanMemberVO> getGrpList(String id) {
		return dao.getGrpList(id);
	}

	@Override
	public String getGrpName(int num) {
		return dao.getGrpName(num);
	}

	@Override
	public List<MemberVO> getGrpMemberList(int grp_num) {
		return dao.getGrpMemberList(grp_num);
	}

	@Override
	public void delPlanMem(PlanMemberVO vo) {
		dao.delPlanMem(vo);
	}

	@Override
	public String getLeader(int num) {
		return dao.getLeader(num);
	}

	@Override
	public List<GrpAcceptVO> getInvitingList(int grp_num) {
		return dao.getInvitingList(grp_num);
	}

	@Override
	public void inviteMember(GrpAcceptVO vo) {
		dao.inviteMember(vo);
	}

	@Override
	public String getName(String id) {
		return dao.getName(id);
	}

	@Override
	public void inviteCancle(GrpAcceptVO vo) {
		dao.inviteCancle(vo);
	}

	@Override
	public int checkGrpMember(PlanMemberVO vo) {
		return dao.checkGrpMember(vo);
	}

	@Override
	public String getNextLeader(int grp_num) {
		return dao.getNextLeader(grp_num);
	}

	@Override
	public void updateLeader(PlanVO plan) {
		dao.updateLeader(plan);
	}

	@Override
	public List<BoardVO> getTourList() {
		return dao.getTourList();
	}

	@Override
	public List<BoardVO> getRestaurantList() {
		return dao.getRestaurantList();
	}

	@Override
	public List<HotelVO> getHotelList() {
		// Jsoup를 이용해서 크롤링
		String url = "https://www.goodchoice.kr/product/home/12"; // 크롤링할 url지정
		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// select를 이용하여 원하는 태그를 선택
		Elements lngLat = doc.select(".list_2.adcno1 > a");
		Elements titleImg = doc.select(".list_2.adcno1 > a > p.pic > img");
		
		List<HotelVO> hotelList = new ArrayList<HotelVO>();
		
		for (int i = 0; i < lngLat.size(); i++) {
			HotelVO vo = new HotelVO();

			vo.setNum(Integer.parseInt(lngLat.get(i).attr("data-ano")));
			vo.setLat(Double.parseDouble(lngLat.get(i).attr("data-alat")));
			vo.setLng(Double.parseDouble(lngLat.get(i).attr("data-alng")));
			vo.setImg(titleImg.get(i).attr("data-original"));
			vo.setTitle(titleImg.get(i).attr("alt"));
			hotelList.add(vo);
		}
		return hotelList;
	}

	@Override
	public List<Object> getSearchList(String category, String keyword, List<HotelVO> hotellist) {
		List searchList;
		// 선택 카테고리별로 검색 결과 반환
		if(category.equals("t")) { // 관광지 검색
			searchList = dao.getTourSearch(keyword);
			
		}else if(category.equals("a")) { // 숙소 검색
			searchList = new ArrayList<HotelVO>();
			for(HotelVO vo : hotellist) {
				String title = vo.getTitle();
				if(title.contains(keyword)) {
					searchList.add(vo);
				}
			} //for
			
		}else { // category.equals("r") -> 맛집 검색
			searchList = dao.getRestaurantSearch(keyword);
		}
		return searchList;
	}

	@Override
	public void modifyPlan(PlanVO vo) {
		dao.modifyPlan(vo);
	}





}
