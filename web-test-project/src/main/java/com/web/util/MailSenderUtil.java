package com.web.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

/**
 * @author ankur
 * 
 */
public class MailSenderUtil {

	@Autowired
	private MailSender	mailSender;

	/**
	 * This method is used to set all the attributes for SimpleMailMessage to
	 * invoke the MailSender's send method.
	 * 
	 * @param from
	 * @param to
	 * @param subject
	 * @param message
	 */
	public void sendMail(String from, String to, String subject, String message) {

		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom(from);
		mailMessage.setTo(to);
		mailMessage.setSubject(subject);
		mailMessage.setText(message);

		mailSender.send(mailMessage);
	}

	/**
	 * @return the mailSender
	 */
	public MailSender getMailSender() {
		return mailSender;
	}

	/**
	 * @param mailSender
	 *            the mailSender to set
	 */
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

}
