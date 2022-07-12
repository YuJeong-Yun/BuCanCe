package com.bcc.web;

import java.io.IOException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bcc.service.MapService;

@Controller
@RequestMapping("/map/*")
public class MapController {
	

	private static final Logger log = LoggerFactory.getLogger(MapController.class);

	
	@Inject
	private MapService service;
	
	@RequestMapping(value = "/tourLists", method = RequestMethod.GET)
	public void tourLists() {
		try {
			service.tourLists();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/restaurantLists", method = RequestMethod.GET)
	public void restaurantLists() {
		try {
			service.restaurantLists();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
