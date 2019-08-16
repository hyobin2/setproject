package egovframework.com.cmm.util.sendmail;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import egovframework.com.cmm.util.GlobalsProperties;
import egovframework.com.cmm.util.StringUtil;

public class MailSender {
    private static String defaultMailFrom = GlobalsProperties.getProperty("mail.default.from"); //보내는 사람 메일 주소
    private static String defaultMailTo = GlobalsProperties.getProperty("mail.default.from"); //받는 사람 메일 주소

    public static Boolean sendMail(String mailFrom, String mailTo, String title, StringBuffer contents) throws Exception {
        if(StringUtil.isEmpty(mailFrom)) {
        	mailFrom = defaultMailFrom;
        }
        if(StringUtil.isEmpty(mailTo)) {
        	mailTo = defaultMailTo;
        }
    	Boolean result = true;

    	/*  TLS */
    	Properties props = new Properties();
    	props.put("mail.smtp.host", GlobalsProperties.getProperty("mail.smtp.host"));
    	props.put("mail.smtp.socketFactory.port", GlobalsProperties.getProperty("mail.smtp.port"));
    	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    	props.put("mail.smtp.auth", GlobalsProperties.getProperty("mail.smtp.auth"));
    	props.put("mail.smtp.port", GlobalsProperties.getProperty("mail.smtp.port"));


    	/* SSL */
    	/*
    	Properties props = new Properties();
    	props.put("mail.smtp.host", GlobalsProperties.getProperty("mail.smtp.host"));
    	props.put("mail.smtp.port", GlobalsProperties.getProperty("mail.smtp.port"));
    	props.put("mail.smtp.auth", GlobalsProperties.getProperty("mail.smtp.auth"));
    	props.put("mail.smtp.starttls.enable", "true");
    	*/


    	Authenticator auth = new MyAuthentication();
    	Session sess = Session.getInstance(props, auth);

    	try {
    	        Message msg = new MimeMessage(sess);

    	        msg.setFrom(new InternetAddress(mailFrom));
    	        InternetAddress[] address = {new InternetAddress(mailTo)};
    	        msg.setRecipients(Message.RecipientType.TO, address);
    	        msg.setSubject(title);
    	        msg.setSentDate(new Date());
    	        //msg.setText(contents.toString());

    	        msg.setHeader("content-type", "text/html; charset=EUC-KR");
    	        msg.setContent( contents.toString(), "text/html;\n\tcharset=\"ks_c_5601-1987\"" );

    	        Transport.send(msg);

    	} catch (MessagingException me) {
    		result = false;
    	        me.printStackTrace();
    	}

        return result;
    }
}