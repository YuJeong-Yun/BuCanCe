package com.bcc.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcc.domain.MemberVO;
import com.bcc.persistence.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoServiceImpl implements KakaoService {

	@Inject
	private MemberDAO dao;
	
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
	
        URL url = null;
        HttpURLConnection conn = null;
        
        try {
            url = new URL(reqURL);

            conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code"); 
            sb.append("&client_id=c30d4acffaf14e6c0a33f269940ff070");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://yyj1999.cafe24.com/member/kakao_login"); // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
			if(conn != null) {
				conn.disconnect();
			}
		}

        return access_Token;
        
    }
    

    public MemberVO getUserInfo (String access_Token) {

		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		URL url = null;
		HttpURLConnection conn = null;

		try {
			url = new URL(reqURL);
			conn = (HttpURLConnection) url.openConnection();
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
			String name = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("name", name);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect();
			}
		}

		// catch 아래 코드 추가.
		MemberVO result = dao.getKakao(userInfo);
		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		System.out.println("S:" + result);
		if (result == null) {
			// 1-10 랜덤 프로필
			int profile = (int) (Math.random() * (10)) + 1;
			userInfo.put("profile", "/resources/img/profile/profile" + profile + ".png");
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			dao.putKakao(userInfo);
			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
			return dao.getKakao(userInfo);
			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
			// result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
		} else {
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}

	}

}