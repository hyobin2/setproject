package egovframework.kjobs.service.member.impl;

import java.util.Map;

import egovframework.com.cmm.util.myMap.MyCamelMap;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * @Class Name : MemberMapper.java
 * @Description : MemberMapper Class
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

@Mapper("memberMapper")
public interface MemberMapper{

	/**
	 * 글을 조회한다.
	 *
	 * @param id - String
	 * @return 조회한 글
	 * @exception Exception
	 */
	Map<String, Object> select(String id) throws Exception;



}
