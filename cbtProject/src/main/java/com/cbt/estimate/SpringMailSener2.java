package com.cbt.estimate;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
public class SpringMailSener2 {
   
   @Autowired private JavaMailSenderImpl mailSender;
   
   @Test
   public void mailTest() throws MessagingException, UnsupportedEncodingException {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

      messageHelper.setSubject("[공지] 파일첨부테스트2");
      messageHelper.setText("회원 가입을 축하합니다.");
      messageHelper.setFrom("dtg3431@gmail.com");
      messageHelper.setTo(new InternetAddress("dtg3444@naver.com", "재홍", "UTF-8"));

      DataSource dataSource = new FileDataSource("C:\\Users\\User\\git\\cbtProject\\cbtProject\\src\\main\\webapp\\Folder\\결제방법.pdf");
       messageHelper.addAttachment(MimeUtility.encodeText("결제방법.pdf", "UTF-8", "B"), dataSource);
       
       //messageHelper.addInline("inlinetest", new FileDataSource("C:\\이재홍.jpg"));
       System.out.println("mail send ok");
      try {
         mailSender.send(message); //messageHelper.getMimeMessage()
      } catch (MailException e) {
         e.printStackTrace();
      }
   }
}