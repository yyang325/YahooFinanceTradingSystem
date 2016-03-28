package com.mercury.util.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mercury.daos.UserDao;

/**
 *  the utiltiy class for mail related function
 * @author Ethan
 *
 */
@Service
public class MailUtil {
	
	@Autowired
	private UserDao ud;
	
	/**
	 *  send a verification email to user's email address asking for account activation
	 * @param username
	 * @param email
	 */
//	public void sendMail(String username, String email) {
//		final String fromMail = "yftsemailsystem@gmail.com";
//		final String password = "yftspassword";
//		
//		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";  
//        Properties prop = System.getProperties();
//        prop.setProperty("mail.smtp.host", "smtp.gmail.com");   
//        prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);   
//        prop.setProperty("mail.smtp.socketFactory.fallback", "false");   
//        prop.setProperty("mail.smtp.port", "465");   
//        prop.setProperty("mail.smtp.socketFactory.port", "465");   
//        prop.put("mail.smtp.auth", "true");
//        
//        Session session = Session.getDefaultInstance(prop, new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() { 
//            	return new PasswordAuthentication(fromMail, password);
//            } 
//        });
//        
//        try {		
//        	//create a default MimeMessage object
//            Message msg = new MimeMessage(session);
//            //set From: header field of the header
//            msg.setFrom(new InternetAddress(fromMail));
//            //set To: header field of the header
//            //msg.setRecipient(Message.RecipientType.TO, new InternetAddress("good.qu@gmail.com"));
//            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
//            //msg.addRecipient(Message.RecipientType.CC, "good.qu@gmail.com");
//            //set Subject: header field
//            msg.setSubject("Please verify your email address on Yahoo Finance Trading System"); 
//            msg.setSentDate(new Date());
//            //msg.setText("Hello!"); 
//            
//            // Create the message part
//            BodyPart messageBodyPart = new MimeBodyPart();
//          
//            //now set the actual message
//            //messageBodyPart.setText("Dear " + username +",\n\nWelcome to Yahoo Finance!");
//            String link = "http://localhost:8080/YFTS/activateAccount.html?username=" + username + "&" + "checkcode" + "=" + md5(username);  
//            
//            messageBodyPart.setContent("<panel>"+
//            		"<h2>Dear " + username +",</h2>"
//            		+ "<h3>Welcome to Yahoo Finance!</h3><br>" 
//            		+ "<h4>Please " + "<a href='" + link +"'>click here</a>" + " to verify your email address.</h4><br>"
//            		+ "<h4>Thanks,</h4>" 
//            		+ "<h4>Team YFTS</h4></panel>"
//            		,"text/html;charset=utf-8");  
//           
//            // Create a multipart message
//            Multipart multipart = new MimeMultipart();
//            //set text message part
//            multipart.addBodyPart(messageBodyPart);
//            
//            //send the complete message parts
//            msg.setContent(multipart);
//            //send message
//            Transport.send(msg);
//            System.out.println("Message sent successfully!");
//        } catch (Exception e) { 
//        	System.out.println(e); 
//        }
//		
//	}
	

}
