package com.bcc.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/order/*")
public class payInfoController extends PaypleController {

	/*
	 * payInfo.jsp : 결제결과 조회 페이지
	 */
	@RequestMapping(value = "/payInfo")
	public String payInfoRoute() {
		return "payInfo";
	}

	/*
	 * payInfo : 결제결과 조회
	 */
	@ResponseBody
	@PostMapping(value = "/payInfo")
	public JSONObject payInfo(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		JSONParser jsonParser = new JSONParser();

		// 결제결과 조회 전 파트너 인증
		Map<String, String> infoParams = new HashMap<>();
		infoParams.put("PCD_PAYCHK_FLAG", "Y");

		JSONObject authObj = new JSONObject();
		authObj = payAuth(infoParams);

		// 파트너 인증 응답값
		String cstId = (String) authObj.get("cst_id"); // 파트너사 ID
		String custKey = (String) authObj.get("custKey"); // 파트너사 키
		String authKey = (String) authObj.get("AuthKey"); // 인증 키
		String payInfoURL = (String) authObj.get("return_url"); // 결제결과 조회 URL

		// 결제결과 조회 요청 파라미터
		String pay_type = request.getParameter("PCD_PAY_TYPE"); // (필수) 결제수단 (transfer|card)
		String pay_oid = request.getParameter("PCD_PAY_OID"); // (필수) 주문번호
		String pay_date = request.getParameter("PCD_PAY_DATE"); // (필수) 원거래 결제일자

		try {
			// 결제결과 조회 요청 전송
			JSONObject payInfoObj = new JSONObject();

			payInfoObj.put("PCD_CST_ID", cstId);
			payInfoObj.put("PCD_CUST_KEY", custKey);
			payInfoObj.put("PCD_AUTH_KEY", authKey);
			payInfoObj.put("PCD_PAYCHK_FLAG", "Y");
			payInfoObj.put("PCD_PAY_TYPE", pay_type);
			payInfoObj.put("PCD_PAY_OID", pay_oid);
			payInfoObj.put("PCD_PAY_DATE", pay_date);

			URL url = new URL(payInfoURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("POST");
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("referer", "http://localhost:8088");
			con.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(payInfoObj.toString());
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
