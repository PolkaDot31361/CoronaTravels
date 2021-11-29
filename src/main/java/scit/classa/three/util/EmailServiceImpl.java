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
			
			// 若쎾??
			message.addRecipient(RecipientType.TO, new InternetAddress(email.getReceiveMail()));
			
			// ?����?��?���?
			message.addFrom( new InternetAddress[] {
					new InternetAddress(email.getSenderMail(), email.getSenderName())
				}
			);
			
			// �깳�꺖�꺂�겗�궭�궎�깉�꺂
			message.setSubject(email.getSubject(), "utf-8");
			
			// �깳�꺖�꺂�겗�쑍�뻼
			message.setText(email.getMessage(), "utf-8");
			
			// �깳�꺖�꺂?�����?
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
