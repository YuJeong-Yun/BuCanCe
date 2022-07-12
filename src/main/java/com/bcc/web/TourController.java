package com.bcc.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.service.TourService;

@Controller
public class TourController {
	

	private static final Logger log = LoggerFactory.getLogger(TourController.class);
	
	@Inject
	private TourService service;
	
	// http://localhost:8088/tourMap
	// �λ� ���� ���
	@RequestMapping(value = "/tourMap", method = RequestMethod.GET)
	public String tourMapGET() {
		
		return "/tour/tourMap";
	}

	
	// ����, ������ ��� ������
	@RequestMapping(value = "/tourInfo", method = RequestMethod.GET)
	public String tourInfoGET(@RequestParam("addr") String addr, Model model) {
		
		if(service.restaurantLists(addr) == null) {
			model.addAttribute("addr",addr);
		} else {
			model.addAttribute("resVO",service.restaurantLists(addr));
			model.addAttribute("addr",addr);
		}
		
		return "/tour/tourInfo";
	}

	
	@RequestMapping(value = "/getRest", method = RequestMethod.GET)
	public void apiTest() {
		try {
			service.getRestaurantInfo(service.restaurantLists("�λ�����"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ����, ������ �󼼳���
	@RequestMapping(value = "/infoDetail", method = RequestMethod.GET)
	public String infoDetailGET(@RequestParam("title") String title, Model model) {
		model.addAttribute("resVO",service.getInfoDetail(title)); 
		//log.info(service.getInfoDetail(title)+"");
		
		return "/tour/infoDetail";
	}
	
}
