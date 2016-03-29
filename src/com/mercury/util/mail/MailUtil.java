package com.mercury.util.mail;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

import com.mercury.beans.User;
import com.mercury.daos.UserDao;

/**
 *  the utiltiy class for mail related function
 * @author Ethan
 *
 */
@Service
public class MailUtil {
	private static final String fromMail = "javamercury2@gmail.com";
	private static final String password = "mercury123";
	
	@Autowired
	private UserDao ud;
	
	/**
	 *  send a verification email to user's email address asking for account activation
	 * @param username
	 * @param email
	 */
	public void sendMail(String username, String email) {
		
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";  
        Properties prop = System.getProperties();
        prop.setProperty("mail.smtp.host", "smtp.gmail.com");   
        prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);   
        prop.setProperty("mail.smtp.socketFactory.fallback", "false");   
        prop.setProperty("mail.smtp.port", "465");   
        prop.setProperty("mail.smtp.socketFactory.port", "465");   
        prop.put("mail.smtp.auth", "true");
        
        
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() { 
            	return new PasswordAuthentication(fromMail, password);
            } 
        });
        
        try {		
        	//create a default MimeMessage object
            Message msg = new MimeMessage(session);
            //set From: header field of the header
            msg.setFrom(new InternetAddress(fromMail));
            //set To: header field of the header
            //msg.setRecipient(Message.RecipientType.TO, new InternetAddress("good.qu@gmail.com"));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            //msg.addRecipient(Message.RecipientType.CC, "good.qu@gmail.com");
            //set Subject: header field
            msg.setSubject("Please verify your email address on Yahoo Finance Trading System"); 
            msg.setSentDate(new Date());
            //msg.setText("Hello!"); 
            
            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();
          
            //now set the actual message
            //messageBodyPart.setText("Dear " + username +",\n\nWelcome to Yahoo Finance!");
            String link = "http://localhost:8080/YFTS/activateAccount.html?username=" + username + "&" + "checkcode" + "=" + md5(username);  
            
            messageBodyPart.setContent("<panel>"+
            		"<h2>Dear " + username +",</h2>"
            		+ "<h3>Welcome to Yahoo Finance!</h3><br>" 
            		+ "<h4>Please " + "<a href='" + link +"'>click here</a>" + " to verify your email address.</h4><br>"
            		+ "<h4>Thanks,</h4>" 
            		+ "<h4>Team YFTS</h4></panel>"
            		,"text/html;charset=utf-8");  
           
            // Create a multipart message
            Multipart multipart = new MimeMultipart();
            //set text message part
            multipart.addBodyPart(messageBodyPart);
            
            //send the complete message parts
            msg.setContent(multipart);
            //send message
            Transport.send(msg);;
            System.out.println("Message sent successfully!");
        } catch (Exception e) { 
        	System.out.println(e); 
        }
		
	}
	
	/**
	 * send an email to the user who forgot password and reset the password
	 * @param email
	 */
	public void sendForgotPasswordMail(String email) {
		
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";  
        Properties prop = System.getProperties();
        prop.setProperty("mail.smtp.host", "smtp.gmail.com");   
        prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);   
        prop.setProperty("mail.smtp.socketFactory.fallback", "false");   
        prop.setProperty("mail.smtp.port", "465");   
        prop.setProperty("mail.smtp.socketFactory.port", "465");   
        prop.put("mail.smtp.auth", "true");   
        
        
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() { 
            	return new PasswordAuthentication(fromMail, password);
            } 
        });
        
        try {		
        	//create a default MimeMessage object
            Message msg = new MimeMessage(session);
            //set From: header field of the header
            msg.setFrom(new InternetAddress(fromMail));
            //set To: header field of the header
            //msg.setRecipient(Message.RecipientType.TO, new InternetAddress("good.qu@gmail.com"));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            //msg.addRecipient(Message.RecipientType.CC, "good.qu@gmail.com");
            //set Subject: header field
            msg.setSubject("Please verify your email address on Yahoo Finance Trading System"); 
            msg.setSentDate(new Date());
            //msg.setText("Hello!"); 
            
            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();
          
            //now set the actual message
            //messageBodyPart.setText("Dear " + username +",\n\nWelcome to Yahoo Finance!");
            User user = ud.findByEmail(email);
            String username = user.getUsername();
            String link = "http://localhost:8080/YFTS/changepassword.html?username=" + username + "&" +"email="+ email;
            
          
            messageBodyPart.setContent("<panel>"+
            		"<h2>Dear " + username + ",</h2>"
            		+ "<h3>Change your password!</h3><br>" 
            		+ "<h4>Please " + "<a href='" + link +"'>click here</a>" + " to change you YFTS password.</h4><br>"
            		+ "<h4>Thanks,</h4>" 
            		+ "<h4>Team YFTS</h4></panel>"
            		,"text/html;charset=utf-8");  
           
            // Create a multipart message
            Multipart multipart = new MimeMultipart();
            //set text message part
            multipart.addBodyPart(messageBodyPart);
            
            //send the complete message parts
            msg.setContent(multipart);
            //send message
            Transport.send(msg);
            System.out.println("Message sent successfully!");
        } catch (Exception e) { 
        	System.out.println(e); 
        }
	}
	
	/*
	 * MD5 encryption for the activity link of the email
	 */
	public String md5(String string) {  
        MessageDigest md = null;  
        try {  
            md = MessageDigest.getInstance("md5");  
            md.update(string.getBytes());  
            byte[] md5Bytes = md.digest();  
            return bytes2Hex(md5Bytes);  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
          
        return null;  
    }
	
	private static String bytes2Hex(byte[] byteArray)  
    {  
        StringBuffer strBuf = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++)  
        {  
            if(byteArray[i] >= 0 && byteArray[i] < 16)  
            {  
                strBuf.append("0");  
            }  
            strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));  
        }  
        return strBuf.toString();  
    }    

}