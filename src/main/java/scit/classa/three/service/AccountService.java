package scit.classa.three.service;

import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import scit.classa.three.dao.AccountDAO;
import scit.classa.three.util.EmailServiceImpl;
import scit.classa.three.vo.AccountVO;
import scit.classa.three.vo.EmailDTO;

@Service
public class AccountService {
	
	@Autowired
	private AccountDAO dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private EmailServiceImpl emailService;
	
	@Autowired
	HttpSession session;
	
	//회원 가입
		public String createAccount(AccountVO account) {
			String path = "";
			
			if(dao.createAccount(account) > 0) {
				path = "redirect:/";
			}else {
				path = "redirect:toJoinForm";
			}
			return path;
			
		}	
	
	/**
	 * @param inputEmail
	 * @return
	 */
	public String resetPassword(String inputEmail) {
		
		String randomPassword = generatePassword(10);
		
		String encodedRandomPassword = passwordEncoder.encode(randomPassword);
		
		emailService.sendMail(new EmailDTO(inputEmail, randomPassword));
		
		return randomPassword;
	}
	
	/**
	 * @param length
	 * @return
	 */
	private String generatePassword(int length) {
		final SecureRandom RANDOM = new SecureRandom();
	    final String ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	    
        StringBuilder returnValue = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            returnValue.append(ALPHABET.charAt(RANDOM.nextInt(ALPHABET.length())));
        }
        
        return new String(returnValue);
    }
	
	
//	ID 중복 검사
	public boolean idCheck(AccountVO account) {
		boolean flag = false;
		if(dao.idCheck(account) == null) {
			flag = true;
		}
		return flag;
	}

	public String login(AccountVO account) {
		String path = "";
		
		AccountVO result = dao.idCheck(account);
		
		if(result == null) {
			path = "redirect:/";
		}else {
			if(account.getUser_pwd().equals(result.getUser_pwd())) {
				path = "redirect:/";
				session.setAttribute("user_id", result.getUser_id());
				session.setAttribute("user_name", result.getUser_nickname());
				session.setAttribute("user_email", result.getUser_email());
			}else {
				path = "redirect:/";
			}
		}
		return path;
	}
}
