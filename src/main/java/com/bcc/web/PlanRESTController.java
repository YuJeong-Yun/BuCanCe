package com.bcc.web;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.domain.MemberVO;
import com.bcc.service.GroupService;

@RestController
public class PlanRESTController {

	private static final Logger log = LoggerFactory.getLogger(PlanRESTController.class);

	// 서비스 객체 주입
	@Inject
	private GroupService service;

	
	@RequestMapping(value = "/memberID", method = RequestMethod.POST)
	@ResponseBody
	public JSONArray memberID(String id) {
		log.info("memberID() 데이터 받기 : " + id);

		List<MemberVO> memberList = service.getMemberList(id);

		JSONArray memberArr = new JSONArray();
		for (MemberVO vo : memberList) {
			JSONObject member = new JSONObject();

			member.put("id", vo.getId());
			member.put("name", vo.getName());

			memberArr.add(member);
		}

		return memberArr;
	}

}
