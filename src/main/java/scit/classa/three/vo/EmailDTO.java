package scit.classa.three.vo;

import lombok.Getter;

/**
 * e-mail
 * 
 * @author ipark
 *
 */

@Getter
public class EmailDTO {
	
	private final String senderName = "corona.travels";						
	private final String senderMail = "corona.travels.info@gmail.com";	
	private final String subject = "Reset Password Notification";		
	
	private String receiveMail; 
	private String message;		
	
	public EmailDTO(){}
	
	public EmailDTO(String receiveMail, String randomPassword) {
		this.receiveMail = receiveMail;
		message = "Hello!\r\n"
				+ "You are receiving this email because we received a password reset request for your account.\r\n"
				+ "\r\n"
				+ "Reset Password : "
				+ randomPassword
				+ "\r\n\r\n"
				+ "If you did not request a password reset, no further action is required.\r\n"
				+ "\r\n"
				+ "Regards,\r\n"
				+ "corona.travels";
	}
}
