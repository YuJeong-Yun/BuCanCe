package com.bcc.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.service.TourService;

@Controller
@RequestMapping("/tour/*")
public class TourController {
	
	@Inject
	private TourService service;
	
	
	// 부산 지도 출력
	@RequestMapping(value = "/tourMap", method = RequestMethod.GET)
	public void tourMapGET() {

	}

	
	// 맛집, 관광지 출력 페이지
	@RequestMapping(value = "/tourInfo", method = RequestMethod.GET)
	public void tourInfoGET(@RequestParam("addr") String addr, Model model) {
		model.addAttribute("resVO",service.restaurantLists(addr));
	}

	
	@RequestMapping(value = "/getRest", method = RequestMethod.GET)
	public void apiTest() {
		try {
			service.getRestaurantInfo(service.restaurantLists("부산진구"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 맛집, 관광지 상세내역
	@RequestMapping(value = "/infoDetail", method = RequestMethod.GET)
	public void infoDetailGET(@RequestParam("title") String title, Model model) {
		model.addAttribute("resVO",service.getInfoDetail(title)); 
	}
	
}
