package scit.classa.three.vo;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import scit.classa.three.util.NaverLoginApi;

public class NaverLoginVO {

	/**
	 * ���� ��û���� �����ϴ� �Ķ����
	 */
	//client_id: ���ø����̼� ��� �� �߱޹��� Ŭ���̾�Ʈ ���̵�
	private final static String CLIENT_ID = "bHyURqD8kdPLdEEUDpF9";
    private final static String CLIENT_SECRET = "vCDDSy4XLs";
    //redirect_uri: ���̹� �α��� ������ ����� ���޹��� �ݹ� URL(URL ���ڵ�). ���ø����̼��� ����� �� Callback URL�� ������ �����Դϴ�.
    private final static String REDIRECT_URI = "http://localhost:8888/login/naverCallback";
    //state: ���ø����̼��� ������ ���� ��ū
    private final static String SESSION_STATE = "oauth_state";
    // ������ ��ȸ API URL
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /**
     * ���̹� Id �� ���� URL ����
     */
    public String getAuthUrl(HttpSession session) {
		// ���� ��ȿ�� ������ ���Ͽ� ������ ����
    	String state = generateRandomString();
    	
    	// ������ ���� ���� session�� ����
    	setSession(session, state);
    	
    	// Scribe���� �����ϴ� ���� URL ���� ����� �̿��Ͽ� �׾Ʒ� ���� URL ����
    	OAuth20Service oauthService = new ServiceBuilder()
    			.apiKey(CLIENT_ID)
    			.apiSecret(CLIENT_SECRET)
    			.callback(REDIRECT_URI)
    			.state(state)
    			.build(NaverLoginApi.instance());
    	
    	return oauthService.getAuthorizationUrl();
	}

    /**
     * ���̹� ���̵�� Callback ó�� �� AccessToken ȹ��
     */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		// Callback���� ���޹��� ���������� �������� ���ǿ� ����Ǿ��ִ� ���� ��ġ�ϴ��� Ȯ��
    	String sessionState = getSession(session);
    	
    	if (StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
			
			// Scribe���� �����ϴ� AccessToken ȹ�� ������� �׾Ʒ� Access Token�� ȹ��
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			
			return accessToken;
		}
    	
    	return null;
	}
    
    
    /**
     * Access Token�� �̿��Ͽ� ���̹� ����� ������ API�� ȣ��
     * @param oauthToken
     * @return
     * @throws IOException
     */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.build(NaverLoginApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}


	/**
     * ���� ��ȿ�� ������ ���Ͽ� ������ ����
     * @return
     */
	private String generateRandomString() {
		// TODO Auto-generated method stub
		return UUID.randomUUID().toString();
	}
	
	
	/**
     * ������ ���� ���� session�� ����
     * @param session
     * @param state
     */
    private void setSession(HttpSession session, String state) {
		// TODO Auto-generated method stub
		session.setAttribute(SESSION_STATE, state);
	}
    
    /**
     * http session���� ������ ��������
     * 
     * @param session
     * @return
     */
    private String getSession(HttpSession session) {
		// TODO Auto-generated method stub
		return (String) session.getAttribute(SESSION_STATE);
	}
}
