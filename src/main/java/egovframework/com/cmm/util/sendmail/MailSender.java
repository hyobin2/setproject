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

    public static Boolean sendMail(String mailFrom, String mailTo, String title, String contents) throws Exception {
        if(StringUtil.isEmpty(mailFrom)) {
        	mailFrom = defaultMailFrom;
        }
    	Boolean result = true;

    	Properties props = new Properties();
    	props.put("mail.smtp.host", GlobalsProperties.getProperty("mail.smtp.host"));
    	props.put("mail.smtp.auth", GlobalsProperties.getProperty("mail.smtp.auth"));

    	Authenticator auth = new MyAuthentication();
    	Session sess = Session.getInstance(props, auth);

    	try {
    	        Message msg = new MimeMessage(sess);
    	        msg.setFrom(new InternetAddress(mailFrom));
    	        InternetAddress[] address = {new InternetAddress(mailTo)};
    	        msg.setRecipients(Message.RecipientType.TO, address);
    	        msg.setSubject(title);
    	        msg.setSentDate(new Date());
    	        msg.setText(contents);

    	        Transport.send(msg);

    	} catch (MessagingException me) {
    		result = false;
    	        me.printStackTrace();
    	}

        return result;
    }
}