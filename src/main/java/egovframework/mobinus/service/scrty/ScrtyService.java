package egovframework.mobinus.service.scrty;



/**
 * @Class Name : ScrtyService.java
 * @Description : ScrtyService Class
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

public interface ScrtyService {


    /**
	 * 문자열 암호화 ( 복호화 가능 )
	 * @param String str
	 * @return String형
	 * @exception Exception
	 */
    String encrypt(String str) throws Exception ;

    /**
	 * 문자열 복호화 ( 복호화 가능 )
	 * @param String str
	 * @return String형
	 * @exception Exception
	 */
    String decrypt(String str) throws Exception ;


    /**
	 * 패스워드 암호화 ( 복호화 불가능 )
	 * @param String data, String salt
	 * @return String형
	 * @exception Exception
	 */
    String encryptPassword(String data, String salt) throws Exception ;

    /**
	 * 패스워드 검증
	 * @param String data, String salt
	 * @return String형
	 * @exception Exception
	 */
    boolean checkPassword(String data, String encoded, String salt) throws Exception ;


}
