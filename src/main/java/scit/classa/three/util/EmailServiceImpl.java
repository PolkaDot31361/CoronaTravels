package scit.classa.three.util;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import scit.classa.three.vo.EmailDTO;

@Service
public class EmailServiceImpl implements EmailService{
	
	@Inject
	JavaMailSender mailSender;	// root-context.xml

	@Override
	public void sendMail(EmailDTO email) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			// ï¥´ì¾??
			message.addRecipient(RecipientType.TO, new InternetAddress(email.getReceiveMail()));
			
			// ?—¥ï¿½ï¿½?ˆ£?›…ï¿?
			message.addFrom( new InternetAddress[] {
					new InternetAddress(email.getSenderMail(), email.getSenderName())
				}
			);
			
			// ï¿½ê¹³ï¿½êº–ï¿½êº‚ï¿½ê²—ï¿½ê¶­ï¿½ê¶ï¿½ê¹‰ï¿½êº‚
			message.setSubject(email.getSubject(), "utf-8");
			
			// ï¿½ê¹³ï¿½êº–ï¿½êº‚ï¿½ê²—ï¿½ì‘ï¿½ë»¼
			message.setText(email.getMessage(), "utf-8");
			
			// ï¿½ê¹³ï¿½êº–ï¿½êº‚?‚•ï¿½ï¿½ï¿?
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
