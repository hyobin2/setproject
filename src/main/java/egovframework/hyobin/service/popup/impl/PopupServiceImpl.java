package egovframework.hyobin.service.popup.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.hyobin.service.popup.PopupService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : PopupServiceImpl.java
 * @Description : PopupServiceImpl Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2015.01.11 최초생성
 *
 * @author 이현민
 * @since 2015. 01.11
 * @version 1.0
 * @see
 *
 */

@Service("popupService")
public class PopupServiceImpl extends EgovAbstractServiceImpl implements PopupService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PopupServiceImpl.class);

	/** PopupMapper */
	@Resource(name = "popupMapper")
	private PopupMapper popupMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 글을 등록한다.
	 *
	 * @param map - 등록할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int insert(Map<String, Object> map) throws Exception {
		return popupMapper.insert(map);
	}

	/**
	 * 글을 등록한다.
	 *
	 * @param map - 등록할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int reply(Map<String, Object> map) throws Exception {
		return popupMapper.reply(map);
	}

	/**
	 * 글을 수정한다.
	 *
	 * @param map - 수정할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int update(Map<String, Object> map) throws Exception {
		return popupMapper.update(map);
	}

	/**
	 * 글을 삭제한다.
	 *
	 * @param map - 삭제할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int delete(Map<String, Object> map) throws Exception {
		return popupMapper.delete(map);
	}

	/**
	 * 글을 조회한다.
	 *
	 * @param map - 조회할 정보가 담긴 map
	 * @return 조회한 글
	 * @exception Exception
	 */
	public Map<String, Object> select(Map<String, Object> map) throws Exception {
		return popupMapper.select(map);
	}

	/**
	 * 글 목록을 조회한다.
	 *
	 * @param search - 조회할 정보가 담긴 map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<Map<String, Object>> list(Map<String, Object> map) throws Exception {
		return popupMapper.list(map);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 *
	 * @param map - 조회할 정보가 담긴 map
	 * @return 글 총 갯수
	 * @exception Exception
	 */
	public int count(Map<String, Object> map) throws Exception {
		return popupMapper.count(map);
	}


}
