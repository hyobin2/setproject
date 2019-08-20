package egovframework.mobinus.service.member;

import java.util.Map;

/**
 * @Class Name : MemberService.java
 * @Description : MemberService Class
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

public interface MemberService {


	/**
	 * 글을 조회한다.
	 *
	 * @param id - String
	 * @return 조회한 글
	 * @exception Exception
	 */
	Map<String, Object> select(String id) throws Exception ;


}
