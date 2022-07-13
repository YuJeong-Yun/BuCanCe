package com.bcc.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PayUserController extends PaypleController {
	
	/*
	 * payUser.jsp : 등록 조회 및 해지(카드/계좌) 
	 */
	@RequestMapping(value = "/payUser")
	public String payUserRoute(Model model) {
		return "payUser";
	}
	/*
	 * payUserInfo : 등록 조회
	 */

	@ResponseBody
	@PostMapping(value = "/payUserInfo")
	public JSONObject payUserInfo(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		JSONParser jsonParser = new JSONParser();
		// 파트너 인증
		Map<String, String> payUserInfoParams = new HashMap<>();

		// (필수) 요청 작업 구분
		payUserInfoParams.put("PCD_PAY_WORK", "PUSERINFO");
		JSONObject authObj = new JSONObject();
		authObj = payAuth(payUserInfoParams);

		// 파트너 인증 응답 값
		String cstId = (String) authObj.get("cst_id"); // 파트너사 ID
		String custKey = (String) authObj.get("custKey"); // 파트너사 키
		String authKey = (String) authObj.get("AuthKey"); // 인증 키
		String payUserInfoURL = (String) authObj.get("return_url"); // 현금영수 발행/취소 요청 URL

		// 요청 파라미터
		String payer_id = request.getParameter("PCD_PAYER_ID"); // (필수) 결제자 고유 ID (빌링키)

		try {
			// 링크URL 생성 요청 전송
			JSONObject payUserInfoObj = new JSONObject();

			payUserInfoObj.put("PCD_CST_ID", cstId);
			payUserInfoObj.put("PCD_CUST_KEY", custKey);
			payUserInfoObj.put("PCD_AUTH_KEY", authKey);
			payUserInfoObj.put("PCD_PAYER_ID", payer_id);

			URL url = new URL(payUserInfoURL);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("POST");
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("referer", "http://localhost:8080");
			con.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(payUserInfoObj.toString().getBytes());
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			jsonObject = (JSONObject) jsonParser.parse(response.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	/*
	 * payUserDel : 등록 해지
	 */
	@ResponseBody
	@PostMapping(value = "/payUserDel")
	public JSONObject payUserDel(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		JSONParser jsonParser = new JSONParser();
		// 파트너 인증
		Map<String, String> payUserDelParams = new HashMap<>();

		// (필수) 요청 작업 구분
		payUserDelParams.put("PCD_PAY_WORK", "PUSERDEL");
		JSONObject authObj = new JSONObject();
		authObj = payAuth(payUserDelParams);

		// 파트너 인증 응답 값
		String cstId = (String) authObj.get("cst_id"); // 파트너사 ID
		String custKey = (String) authObj.get("custKey"); // 파트너사 키
		String authKey = (String) authObj.get("AuthKey"); // 인증 키
		String payUserDelURL = (String) authObj.get("return_url"); // 등록해지 요청 URL

		// 요청 파라미터
		String payer_id = request.getParameter("PCD_PAYER_ID"); // (필수) 결제자 고유 ID (빌링키)

		try {
			// 링크URL 생성 요청 전송
			JSONObject payUserDelObj = new JSONObject();

			payUserDelObj.put("PCD_CST_ID", cstId);
			payUserDelObj.put("PCD_CUST_KEY", custKey);
			payUserDelObj.put("PCD_AUTH_KEY", authKey);
			payUserDelObj.put("PCD_PAYER_ID", payer_id);

			URL url = new URL(payUserDelURL);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("POST");
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("referer", "http://localhost:8080");
			con.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(payUserDelObj.toString().getBytes());
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			jsonObject = (JSONObject) jsonParser.parse(response.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

}
