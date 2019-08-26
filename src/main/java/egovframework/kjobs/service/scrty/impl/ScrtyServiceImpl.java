package egovframework.kjobs.service.scrty.impl;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.FileScrty;
import egovframework.com.cmm.util.GlobalsProperties;
import egovframework.com.cmm.util.StringUtil;
import egovframework.kjobs.service.scrty.ScrtyService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cryptography.EgovARIACryptoService;

/**
 * @Class Name : ScrtyServiceImpl.java
 * @Description : ScrtyServiceImpl Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2015.01.11           최초생성
 *
 * @author 이현민
 * @since 2015. 01.11
 * @version 1.0
 * @see
 *
 */

@Service("scrtyService")
public class ScrtyServiceImpl extends EgovAbstractServiceImpl implements ScrtyService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ScrtyServiceImpl.class);


	/** ARIACryptoService */
    @Resource(name="ARIACryptoService")
    private EgovARIACryptoService cryptoService;


    /**
	 * 문자열 암호화 ( 복호화 가능 )
	 * @param String str
	 * @return String형
	 * @exception Exception
	 */
    public String encrypt(String str) throws Exception {
    	if(StringUtil.isEmpty(str)) {
    		return str;
    	}else {
    	String passwd = GlobalsProperties.getProperty("crypto.hashed.password");
    	byte[] text = cryptoService.encrypt(FileScrty.encode(str).getBytes("UTF-8"), passwd);
    	String base64enc = FileScrty.encodeBinary(text);
    	return base64enc;
    	}
    }

    /**
	 * 문자열 복호화 ( 복호화 가능 )
	 * @param String str
	 * @return String형
	 * @exception Exception
	 */
    public String decrypt(String str) throws Exception {
    	if(StringUtil.isEmpty(str)) {
    		return str;
    	}else {
    		String passwd = GlobalsProperties.getProperty("crypto.hashed.password");
        	byte[] base64dec = FileScrty.decodeBinary(str);
        	byte[] dectext = cryptoService.decrypt(base64dec, passwd);
        	String decString = new String(dectext, "UTF-8");
        	decString = FileScrty.decode(decString);
        	return decString;
    	}
    }


    /**
	 * 패스워드 암호화 ( 복호화 불가능 )
	 * @param String data, String salt
	 * @return String형
	 * @exception Exception
	 */
    public String encryptPassword(String data, String salt) throws Exception {
    	String result = FileScrty.encryptPassword(data, salt.getBytes());
        return result;
    }

    /**
	 * 패스워드 검증
	 * @param String data, String salt
	 * @return String형
	 * @exception Exception
	 */
    public boolean checkPassword(String data, String encoded, String salt) throws Exception {
   		boolean result = FileScrty.checkPassword(data, encoded, salt.getBytes());
   		return result;
    }


}
