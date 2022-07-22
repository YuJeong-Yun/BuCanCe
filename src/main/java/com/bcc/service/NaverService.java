package com.bcc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverService {
	   private final static String CLIENT_ID = "mh2HJRSmhFxLpWvyHva1";
	   private final static String CLIENT_SECRET = "V3fN3Vgf7p";
	   private final static String REDIRECT_URI = "http://localhost:8088/callback";
	   private final static String SESSION_STATE = "oauth_state";
	   
	   /* 네아로 인증 URL 생성 Method */
	   public String getAuthorizationUrl(HttpSession session) {

	      /* 세션 유효성 검증을 위하여 난수를 생성 */
	      String state = generateRandomString();
	      /* 생성한 난수 값을 session에 저장 */
	      setSession(session, state);

	      /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
	      OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
	            .callback(REDIRECT_URI).state(state) // 앞서 생성한 난수값을 인증 URL생성시 사용함
	            .build(NaverLoginApi.instance());

	      return oauthService.getAuthorizationUrl();
	   }

	   /* 네아로 Callback 처리 및 AccessToken 획득 Method */
	   public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {

	      /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
	      String sessionState = getSession(session);
	      if (StringUtils.equals(sessionState, state)) {

	         OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
	               .callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());

	         /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
	         OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
	         return accessToken;
	      }
	      return null;
	   }

	   /* 세션 유효성 검증을 위한 난수 생성기 */
	   private String generateRandomString() {
	      return UUID.randomUUID().toString();
	   }

	   /* http session에 데이터 저장 */
	   private void setSession(HttpSession session, String state) {
	      session.setAttribute(SESSION_STATE, state);
	   }

	   /* http session에서 데이터 가져오기 */
	   private String getSession(HttpSession session) {
	      return (String) session.getAttribute(SESSION_STATE);
	   }

	   /* 프로필 조회 API URL */
	   private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	   /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	   public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {

	      OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
	            .callback(REDIRECT_URI).build(NaverLoginApi.instance());

	      OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
	      oauthService.signRequest(oauthToken, request);
	      Response response = request.send();
	      return response.getBody();
	   }
	   
	   public void naverProfile() {
	        String token = "YOUR_ACCESS_TOKEN";// 네이버 로그인 접근 토큰;
	           String header = "Bearer " + token; // Bearer 다음에 공백 추가
	           try {
	               String apiURL = "https://openapi.naver.com/v1/nid/me";
	               URL url = new URL(apiURL);
	               HttpURLConnection con = (HttpURLConnection)url.openConnection();
	               con.setRequestMethod("GET");
	               con.setRequestProperty("Authorization", header);
	               int responseCode = con.getResponseCode();
	               BufferedReader br;
	               if(responseCode==200) { // 정상 호출
	                   br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	               } else {  // 에러 발생
	                   br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	               }
	               String inputLine;
	               StringBuffer response = new StringBuffer();
	               while ((inputLine = br.readLine()) != null) {
	                   response.append(inputLine);
	               }
	               br.close();
	               System.out.println(response.toString());
	           } catch (Exception e) {
	               System.out.println(e);
	           }
	       }
}
