package scit.classa.three.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {

	final String KAKAO_AUTH_URL = "https://kauth.kakao.com";
	final String KAKAO_API_URL = "https://kapi.kakao.com";
	private final String CLIENT_ID = "55180a659f0e1abee38d8a70d2860b55";
	final String HOME_URL = "http://localhost:8888";
	
	public String getAccessToken(String code) throws IOException{
		String accessToken = "";
		String refreshToken = "";
		String reqURL = KAKAO_AUTH_URL + "/oauth/token";
		
		URL url = new URL(reqURL);
		
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();

		/**
		 * POST 요청 : setDoOutput 을 fasle -> true
		 */
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		/**
		 * POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
		 */
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuffer sb = new StringBuffer();
		sb.append("grant_type=authorization_code");
        sb.append("&client_id=" + CLIENT_ID);  //본인이 발급받은 key
        sb.append("&redirect_uri=" + HOME_URL + "/login/oauth_kakao");     // 본인이 설정해 놓은 경로
        sb.append("&code=" + code);
        bw.write(sb.toString());
        bw.flush();
        
        /**
         * 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
         */
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line = "";
        String result = "";

        while ((line = br.readLine()) != null) {
            result += line;
        }
        
        /**
         * Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
         */
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        accessToken = element.getAsJsonObject().get("access_token").getAsString();
        refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

        br.close();
        bw.close();
        conn.disconnect();
		return accessToken;
	}
	
	/**
	 * kakao 사용자 정보 가져오기
	 * 
	 * @param accessToken
	 * @return
	 * @throws IOException
	 */
	public HashMap<String, Object> getUserInfo(String accessToken){
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		final String reqURL = KAKAO_API_URL + "/v2/user/me";
		
		//access_token을 이용하여 사용자 정보 조회
	    try {
	       URL url = new URL(reqURL);
	       HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	       conn.setRequestMethod("GET");
	       conn.setRequestProperty("Authorization", "Bearer " + accessToken); //전송할 header 작성, access_token전송

	       //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	       BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	       String line = "";
	       String result = "";

	       while ((line = br.readLine()) != null) {
	           result += line;
	       }
	       
	       //Gson 라이브러리로 JSON파싱
	       JsonParser parser = new JsonParser();
	       JsonElement element = parser.parse(result);

	       JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();

           // Response: properties
           String nickname = properties.getAsJsonObject().get("nickname").getAsString();

	       userInfo.put("name", nickname);
	       
	       br.close();
	       conn.disconnect();
	       } catch (IOException e) {
	            e.printStackTrace();
	       }
		
		return userInfo;
	}
}
