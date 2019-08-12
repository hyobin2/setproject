package egovframework.mobinus.service.board.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * @Class Name : BoardMapper.java
 * @Description : BoardMapper Class
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

@Mapper("boardMapper")
public interface BoardMapper {

	/**
	 * 글을 등록한다.
	 *
	 * @param map - 등록할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	int insert(Map<String, Object> map) throws Exception;

	/**
	 * 글을 등록한다.
	 *
	 * @param map - 등록할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	int reply(Map<String, Object> map) throws Exception;

	/**
	 * 글을 수정한다.
	 *
	 * @param map - 수정할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	int update(Map<String, Object> map) throws Exception;

	/**
	 * 글을 삭제한다.
	 *
	 * @param map - 삭제할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
	int delete(Map<String, Object> map) throws Exception;

	/**
	 * 글을 조회한다.
	 *
	 * @param map - 조회할 정보가 담긴 map
	 * @return 조회한 글
	 * @exception Exception
	 */
	Map<String, Object> select(Map<String, Object> map) throws Exception;

	/**
	 * 글 목록을 조회한다.
	 *
	 * @param map - 조회할 정보가 담긴 map
	 * @return 글 목록
	 * @exception Exception
	 */
	List<Map<String, Object>> list(Map<String, Object> map) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 *
	 * @param map - 조회할 정보가 담긴 map
	 * @return 글 총 갯수
	 * @exception Exception
	 */
	int count(Map<String, Object> map) throws Exception;

	/**
	 * 게시물 조회수 증가
	 *
	 * @param map - 조회할 정보가 담긴 map
	 * @return 게시물 조회수 증가
	 * @exception Exception
	 */
	int updateHit(Map<String, Object> map) throws Exception;

}
