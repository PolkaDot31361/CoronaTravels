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

		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuffer sb = new StringBuffer();
		sb.append("grant_type=authorization_code");
        sb.append("&client_id=" + CLIENT_ID);  //������ �߱޹��� key
        sb.append("&redirect_uri=" + HOME_URL + "/login/oauth_kakao");     // ������ ������ ���� ���
        sb.append("&code=" + code);
        bw.write(sb.toString());
        bw.flush();
        
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line = "";
        String result = "";

        while ((line = br.readLine()) != null) {
            result += line;
        }
        
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        accessToken = element.getAsJsonObject().get("access_token").getAsString();
        refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

        br.close();
        bw.close();
        conn.disconnect();
		return accessToken;
	}
	
	public HashMap<String, Object> getUserInfo(String accessToken){
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		final String reqURL = KAKAO_API_URL + "/v2/user/me";
		
	    try {
	       URL url = new URL(reqURL);
	       HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	       conn.setRequestMethod("GET");
	       conn.setRequestProperty("Authorization", "Bearer " + accessToken); //������ header �ۼ�, access_token����

	       BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	       String line = "";
	       String result = "";

	       while ((line = br.readLine()) != null) {
	           result += line;
	       }
	       
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
