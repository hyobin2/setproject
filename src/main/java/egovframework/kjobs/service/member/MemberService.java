package egovframework.kjobs.service.member;

import java.util.List;
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
	Map<String, Object> select(Map<String, Object> map) throws Exception ;

	/**
	 * 회원을 탈퇴시킨다.
	 *
	 * @param map
	 * @exception Exception
	 */
	void delete(Map<String, Object> map) throws Exception;



	/**
	 * 회원정보를 수정한다.
	 *
	 * @param map
	 *
	 * @exception Exception
	 */
	void update(Map<String, Object> map) throws Exception;

	int count(Map<String, Object> map) throws Exception;
	/**
	 * 회원정보를 리스트를 뽑아온다.
	 *
	 * @param map
	 * @return 회원리스트
	 * @exception Exception
	 */

	List<Map<String, Object>> list(Map<String, Object> map) throws Exception;

	/**
	 * 회원가입을 한다.
	 *
	 * @param map
	 * @exception Exception
	 */
	void join(Map<String, Object> map);


}
