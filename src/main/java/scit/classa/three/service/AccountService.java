package scit.classa.three.service;

import java.security.SecureRandom;

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
		// �Է��� �̸����� DB�� �ִ��� Ȯ��
		
		// ���� ��� ��й�ȣ �ڴ� ����
		String randomPassword = generatePassword(10);
		
		// ��й�ȣ ��ȣȭ
		String encodedRandomPassword = passwordEncoder.encode(randomPassword);
		
		// ��ȣȭ�� ��й�ȣ�� DB�� ����(��й�ȣ update)

		// ���������� DB�� ����� ��� �̸��Ϸ� ���� ��й�ȣ ����
		emailService.sendMail(new EmailDTO(inputEmail, randomPassword));
		
		return randomPassword;
	}
	
	/**
	 * �ڴ� ��й�ȣ ������
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
