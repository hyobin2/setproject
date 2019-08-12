package egovframework.mobinus.service.member.impl;


import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.myMap.MyCamelMap;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.mobinus.service.member.MemberService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

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

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MemberServiceImpl.class);

	/** memberMapper */
    @Resource(name="memberMapper")
    private MemberMapper memberMapper;

    /** ID Generation */
    @Resource(name="egovIdGnrService")
    private EgovIdGnrService egovIdGnrService;

    /**
	 * 글을 조회한다.
	 *
	 * @param id - String
	 * @return 조회한 글
	 * @exception Exception
	 */
    public Map<String, Object> select(String id) throws Exception {
    	return memberMapper.select(id);
    }

}
