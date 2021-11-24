package scit.classa.three.service;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import scit.classa.three.util.EmailServiceImpl;
import scit.classa.three.vo.EmailDTO;

@Service
public class AccountService {
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private EmailServiceImpl emailService;
	
	/**
	 * 비밀번호 초기화
	 * @param inputEmail
	 * @return
	 */
	public String resetPassword(String inputEmail) {
		// 입력한 이메일이 DB에 있는지 확인
		
		// 있을 경우 비밀번호 핸덤 생성
		String randomPassword = generatePassword(10);
		
		// 비밀번호 암호화
		String encodedRandomPassword = passwordEncoder.encode(randomPassword);
		
		// 암호화된 비밀번호를 DB에 저장(비밀번호 update)

		// 정상적으로 DB에 저장된 경우 이메일로 랜덤 비밀번호 전송
		emailService.sendMail(new EmailDTO(inputEmail, randomPassword));
		
		return randomPassword;
	}
	
	/**
	 * 핸덤 비밀번호 생성기
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
}
