package scit.classa.three.controller;


import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.util.Utils;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import scit.classa.three.service.AccountService;
import scit.classa.three.service.KakaoService;
import scit.classa.three.vo.AccountVO;
import scit.classa.three.vo.NaverLoginVO;


@Controller
public class MemberController {
	
	private final static org.slf4j.Logger LOG =  LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private NaverLoginVO naverLoginVO;
	
	final int LOGIN_LOCAL = 100;
	final int LOGIN_KAKAO = 200;
	final int LOGIN_NAVER = 300;
	final int LOGIN_GOOGLE = 400;
	
	final String HOME_URL = "http://localhost:8888";
	
//	회원 가입창 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String toJoinForm() {
		System.out.println("작동1");
		return "joinForm";
	}
	
//	회원 가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String createAccount(AccountVO account) {
		System.out.println("working2");
		LOG.info("granted AccountVO accout :{}" + account);
		return accountService.createAccount(account);
	}
	
	
	/**
	 * kakao �α���
	 */
	private final String KAKAO_AUTH_URL = "https://kauth.kakao.com";
	private final String KAKAO_CLIENT_ID = "55180a659f0e1abee38d8a70d2860b55";
	
	/**
	 * Google �α���
	 */
	private final String GOOGLE_CLIENT_ID = "419270486004-1tcf5tfk0p2sps8hf7ugatckrqeghtnc.apps.googleusercontent.com";
	
		
	/**
	 * īī�� �α��� url ��û
	 * @param request
	 * @return īī�� �α��� url
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping("/login/kakaoLogin")
	private String getKakaoAuthUrl(HttpServletRequest request) throws Exception{
		String reqUrl = KAKAO_AUTH_URL + "/oauth/authorize"
				+ "?client_id=" + KAKAO_CLIENT_ID
				+ "&redirect_uri=" + HOME_URL + "/login/oauth_kakao"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	/**
	 * īī�� �������� ��ȸ
	 * īī�� �α��ο��� ����� OAuth Redirect URI
	 */
	@GetMapping("/login/oauth_kakao")
	private String oauthKakao(@RequestParam("code") String code) throws Exception{
		String accessToken = kakaoService.getAccessToken(code);

		// īī�� �������� ��������
		HashMap<String, Object> userInfo = kakaoService.getUserInfo(accessToken);
		
		// ���ǿ� īī�� �������� ����
		session.setAttribute("user_name", userInfo.get("name"));
		session.setAttribute("loginBy", LOGIN_KAKAO);
		
		return "redirect:/";
	}

	
	/**
	 * ���̹� �α��� ������ callback ȣ�� �޼���
	 * @param model
	 * @param code
	 * @param state
	 * @param session
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value = "/login/naverCallback", method = {RequestMethod.GET, RequestMethod.POST })
	private String naverCallback(Model model,
								@RequestParam String code,
								@RequestParam String state) throws IOException, ParseException{
		
		OAuth2AccessToken oauthToken;
	    oauthToken = naverLoginVO.getAccessToken(session, code, state);
	    
	    //1. �α��� ����� ������ �о�´�.
	    String apiResult = naverLoginVO.getUserProfile(oauthToken); //String������ json������
	    
	    //2. String������ apiResult�� json���·� �ٲ�
	    JSONParser parser = new JSONParser();
	    Object obj = null;
	    try {
	        obj = parser.parse(apiResult);
	    } catch (org.json.simple.parser.ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    JSONObject jsonObject = (JSONObject) obj;
	    
	    //3. ������ �Ľ�
	    //Top���� �ܰ� _response �Ľ�
	    JSONObject response_obj = (JSONObject) jsonObject.get("response");
	    
	    // response�� nickname�� �Ľ�
	    String user_name = (String)response_obj.get("nickname");
	    String user_id = (String)response_obj.get("email");
	    
	    // ���ǿ� ������ ����
	    session.setAttribute("user_name", user_name);
	    session.setAttribute("user_email", user_id);
	    session.setAttribute("loginBy", LOGIN_NAVER);
		
		return "redirect:/";
	}
	
	/**
	 * Google Login
	 */
	@ResponseBody
	@PostMapping("/login/oauth_google")
	private String googleAuthLogin(String idtoken) throws GeneralSecurityException, IOException{
		HttpTransport transport = Utils.getDefaultTransport();
		JsonFactory factory = Utils.getDefaultJsonFactory();
		
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, factory)
				.setAudience(Collections.singletonList(GOOGLE_CLIENT_ID))
				.build();
		
		JSONObject json = new JSONObject();
		
		GoogleIdToken idToken = verifier.verify(idtoken);
		if (idToken != null) {
			Payload payload = idToken.getPayload();
			
			// Get profile information from payload
			String email = payload.getEmail();
			String name = (String) payload.get("name");
			
			// Use or store profile information
			session.setAttribute("user_name", name);
			session.setAttribute("user_email", email);
			session.setAttribute("loginBy", LOGIN_GOOGLE);
			
			json.put("login_result", "success");
		} else {
			json.put("login_result", "fail");
		}

		return json.toJSONString();
	}
	
	/**
	 * īī�� ���� �α׾ƿ�
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping("/logout/kakao")
	private String kakaoLogout(HttpServletRequest request) throws Exception{
		String reqUrl = KAKAO_AUTH_URL + "/oauth/logout"
				+ "?client_id=" + KAKAO_CLIENT_ID
				+ "&logout_redirect_uri=" + HOME_URL + "/logout";
		
		return reqUrl;
	}
	
	/**
	 * �α׾ƿ�
	 */
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST })
	private String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		request.getSession(true);
		return "redirect:/";
	}
	
	/*
	 * ��й�ȣ �ʱ�ȭ �������� �̵�
	 */
	@GetMapping("/account/resetpasswordPage")
	private String resetPasswordPage() {
		return "/account/reset-password";
	}
	
	/**
	 * ��й�ȣ ã��
	 * @param inputEmail
	 * @return
	 */
	@ResponseBody
	@PostMapping("/reset-password")
	private String resetPassword(String inputEmail) {
		return accountService.resetPassword(inputEmail);
	}
}
