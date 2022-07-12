package com.bcc.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.MemberVO;
import com.bcc.persistence.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


// @Service : 해당 객체가 서비스동작을 수행하는 객체다. 라는 의미 
@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	// DAO 객체 필요
	
	@Inject
	private MemberDAO dao;

	@Override
	public void memberInsert(MemberVO vo) {
		log.info(" 컨트롤러 호출 ");
		log.info(" memberInsert(vo) 호출 ");
		
		dao.insertMember(vo);
		
		log.info(" DAO 처리 완료 -> 컨트롤러 이동");
		
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		log.info("loginCheck(vo) 호출 ");
		// DAO객체 메서드 호출
		MemberVO loginResultVO = dao.loginMember(vo);		
		
		log.info(loginResultVO+"");
		
		return loginResultVO;
	}

	@Override
	public MemberVO getMember(String id) {

		log.info("getMember(id) 호출");
		
		MemberVO vo = dao.getMember(id);
		
		return vo;
	}

	@Override
	public Integer updateMember(MemberVO vo) {
		log.info("updateMember(vo)");
		
		 int resultCnt = dao.updateMember(vo);		
		
		return resultCnt;
	}

	@Override
	public void deleteMember(MemberVO vo) {
		log.info(" deleteMember(vo) 호출 ");
		
		dao.deleteMember(vo);
	}

	@Override
	public List<MemberVO> getMemberList(String id) {
		log.info("getMemberList(String id) 호출");
		
		return dao.getMemberList(id);
	}

	@Override
	public int idCheck(String id) {
	       
		int cnt = dao.idCheck(id);	 
		
		return cnt;
	}

	@Override
	public int getLicense(String license) {
		
		int liCnt = dao.getLicense(license);
		
		return liCnt;
	}

	@Override
	public int liUp(String id) {
		
		log.info("liUp(id) 호출");
		
		int liUp = dao.licenseUp(id);
		
		return liUp;
	}

	@Override
	public int liDown(String id) {
		
		log.info("liDown(id) 호출");
		
		int liDown = dao.licenseDown(id);
		
		return liDown;
	}

	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=c30d4acffaf14e6c0a33f269940ff070"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8088/kakao_login"); // 본인이 설정한 주소 
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;

	}
	
	@Override    
	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	
		
}
