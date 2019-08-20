package egovframework.com.cmm.util.sendmail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import egovframework.com.cmm.util.GlobalsProperties;

class MyAuthentication extends Authenticator {
    PasswordAuthentication pa;
    public MyAuthentication(){
        pa = new PasswordAuthentication(GlobalsProperties.getProperty("mail.auth.id"), GlobalsProperties.getProperty("mail.auth.pw"));  //ex) ID:cafe24@cafe24.com PASSWD:1234
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}