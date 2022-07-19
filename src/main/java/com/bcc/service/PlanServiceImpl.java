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
import com.bcc.domain.HotelVO;
import com.bcc.domain.PlanVO;
import com.bcc.persistence.PlanDAO;

@Service
public class PlanServiceImpl implements PlanService {

	@Inject
	private PlanDAO dao;

	@Override
	public void createPlan(PlanVO vo) {
		dao.createPlan(vo);
	}

	@Override
	public List<PlanVO> getPlanList(String id) {
		return dao.getPlanList(id);
	}

	@Override
	public List<BoardVO> getTourList() {
		return dao.getTourList(0);
	}

	@Override
	public List<BoardVO> getRestaurantList() {
		return dao.getTourList(1);
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
			vo.setThumbnail(titleImg.get(i).attr("data-original"));
			vo.setTitle(titleImg.get(i).attr("alt"));
			vo.setT_category(-1);
			hotelList.add(vo);
		}
		return hotelList;
	}

	@Override
	public List<BoardVO> getSearchList(String category, String keyword) {
		List<BoardVO> searchList;
		// vo에 카테고리, 키워드 저장
		BoardVO vo = new BoardVO();
		vo.setTitle(keyword);
		// 선택 카테고리별로 검색 결과 반환
		if (category.equals("t")) { // 관광지 검색
			vo.sett_category(0);
			
			searchList = dao.getTourSearch(vo);

//		} else if (category.equals("a")) { // 숙소 검색
//			searchList = new ArrayList<HotelVO>();
//			for (HotelVO vo : hotellist) {
//				String title = vo.getTitle();
//				if (title.contains(keyword)) {
//					searchList.add(vo);
//				}
//			} // for

		} else { // category.equals("r") -> 맛집 검색
			vo.sett_category(1);
			
			searchList = dao.getTourSearch(vo);
		}
		return searchList;
	}

	@Override
	public void modifyTourPlan(PlanVO vo) {
		dao.modifyTourPlan(vo);
	}

	@Override
	public List<List<Object>> getTourPlanList(int num) {
		PlanVO vo = dao.getPlanInfo(num);

		if (vo.getTour_plan() == null || vo.getTour_plan().equals("")) {
			return null;
		}

		// 날짜끼리는 +, 날짜-관광지는 :, 관광지 끼리는 @ 로 구분
		// 날짜별로 나눠서 allPlanArr에 담음
		String[] allPlanArr = (String[]) vo.getTour_plan().split("\\+");
		// 호텔 - 날짜별로 이미지*타이틀*lat*lng 정보 담을 배열
		String[] allPlanAccArr = (String[]) vo.getTour_plan_acc().split("\\+");

		// [날짜, [플랜,플랜, ..]], [날짜, [플랜, 플랜, ..]] 형태로 datePlanContainer에 저장
		List<List<Object>> datePlanContainer = new ArrayList<>();

		// 날짜별로 관광지 담을 배열 생성해서 datePlan에 저장
//		for (String allPlan : allPlanArr) {
		for (int i = 0; i < allPlanArr.length; i++) {
			List<Object> datePlanList = new ArrayList<>(); // 날짜 , [플랜, 플랜, ...] 담을 리스트

			// 날짜랑 플랜 구분해서 datePlanArr에 담음
			String[] datePlanArr = allPlanArr[i].split(":");
			datePlanList.add(datePlanArr[0]); // 날짜 담기

			List<Object> planList = new ArrayList<Object>(); // 플랜만 담을 리스트
			// 해당 날짜에 관광지 정보 없을 경우
			if (datePlanArr.length == 1) {
				datePlanList.add(planList);
				datePlanContainer.add(datePlanList);

				continue;
			}

			// 플랜@플랜@ ... 연결된 문자열 구분
			String[] planArr = datePlanArr[1].split("@");
			String[] planAccArr = allPlanAccArr[i].split("@");
			// 플랜 나눠서 planList에 저장
//			for (String plan : planArr) {
			for (int j = 0; j < planArr.length; j++) {
				int tourNum = Integer.parseInt(planArr[j].substring(1));
				BoardVO tour = new BoardVO();
				
				switch (planArr[j].charAt(0)) {
				// 관광지일 경우
				case 't':
					// 관광지 정보 삭제됐으면 정보 전달 x
					if (dao.getTourInfo(tourNum) != null) {
						planList.add(dao.getTourInfo(tourNum));
					}
					break;
				// 맛집일 경우
				case 'r':
					if (dao.getTourInfo(tourNum) != null) {
						planList.add(dao.getTourInfo(tourNum));
					}
					break;
				// 숙소일 경우
				default:
//					for (HotelVO hotel : hotellist) {
//						if (hotel.getNum() == tourNum) {
//							planList.add(hotel);
//						}
//					}
					String[] planAccInfo = planAccArr[j].split("\\*");

					HotelVO hotel = new HotelVO();
					hotel.setThumbnail(planAccInfo[0]);
					hotel.setTitle(planAccInfo[1]);
					hotel.setLat(Double.parseDouble(planAccInfo[2]));
					hotel.setLng(Double.parseDouble(planAccInfo[3]));
					hotel.setT_category(-1);
					hotel.setNum(tourNum);

					planList.add(hotel);
					break;
				} // switch
			} // for

			// 날짜, [관광지, 관광지, ...] 형태로 datePlanList에 저장
			datePlanList.add(planList);
			// [날짜, [관광지, 관광지, ...]] 형태인 datePlanList를 datePlanContainer에 저장
			datePlanContainer.add(datePlanList);
		} // for

		return datePlanContainer;
	}

	@Override
	public PlanVO getPlanInfo(int num) {
		return dao.getPlanInfo(num);
	}

}
