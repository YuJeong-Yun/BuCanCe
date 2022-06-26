package com.bcc.web;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/accomodation/*")
public class testController {

	
	
	private static final Logger log =
			LoggerFactory.getLogger(testController.class);
	
	//서비스 주입
	
	// roomSearch 페이지
	// http://localhost:8088/accomodation/roomSearch
	@RequestMapping(value = "/roomSearch",method = RequestMethod.GET)
	public void roomSearchGET(Model model) throws IOException {
		log.info(" roomSearchGET() 호출 ");
		
		String url ="https://finance.naver.com/item/main.naver?code=377300";
		
		Document doc = Jsoup.connect(url).get();
		
		Elements e1 = doc.getElementsByAttributeValue("class", "ResizableImage_image__1_8js SingleImage_horizontal__2SBaY");
//		Element e2 = e1.get(0);
//		Elements e3 = e2.select("span");
		
		log.info(e1.html()+"");
//		log.info(e1.get(0)+"");
//		log.info(e2.select("span")+"");
		
//		log.info(e3.get(0).text()+"");
		
//		model.addAttribute("e3", e3);
		
	}
		
	// about-us 페이지
	// http://localhost:8088/templateView/about-us
	@RequestMapping(value = "/about-us",method = RequestMethod.GET)
	public void aboutusGET() {
		log.info(" about-usGET() 호출 ");
				
	}
	
	// blog 페이지
	// http://localhost:8088/templateView/blog
	@RequestMapping(value = "/blog",method = RequestMethod.GET)
	public void blogGET() {
		log.info(" blogGET() 호출 ");
		
	}
	
	// blog-details 페이지
	// http://localhost:8088/templateView/blog-details
	@RequestMapping(value = "/blog-details",method = RequestMethod.GET)
	public void blogdetailsGET() {
		log.info(" blog-detailsGET() 호출 ");
		
	}
	
	
	// contact 페이지
	// http://localhost:8088/templateView/contact
	@RequestMapping(value = "/contact",method = RequestMethod.GET)
	public void contactGET() {
		log.info(" contactGET() 호출 ");
			
	}
	
	// room-details 페이지
	// http://localhost:8088/templateView/room-details
	@RequestMapping(value = "/room-details",method = RequestMethod.GET)
	public void roomdetailsGET() {
		log.info(" room-detailsGET() 호출 ");
		
	}
	
	// rooms 페이지
	// http://localhost:8088/templateView/rooms
	@RequestMapping(value = "/rooms",method = RequestMethod.GET)
	public void roomsGET() {
		log.info(" roomsGET() 호출 ");
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
