package com.project.tgdd_be.service.imp;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tgdd_be.service.EmailSenderService;

import lombok.AllArgsConstructor;

@Service
@Transactional
@AllArgsConstructor
public class EmailSenderServiceImp implements EmailSenderService {
	
	private final static Logger LOGGER = LoggerFactory.getLogger(EmailSenderServiceImp.class);

	private final JavaMailSender mailSender;
	
	@Override
	@Async
	public void send(String to, String email) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
			helper.setText(email, true);
			helper.setTo(to);
			helper.setFrom("tgddspringgroup2@gmail.com");
			helper.setSubject("CONFIRMING LETTER FOR YOUR ORDER");
			mailSender.send(mimeMessage);
		}catch(MessagingException e) {
			LOGGER.error("failed to send email", e);
			throw new IllegalStateException("failed to send email");
		}
	}

}
