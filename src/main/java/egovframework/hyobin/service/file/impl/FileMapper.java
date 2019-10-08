/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.hyobin.service.file.impl;

import java.util.List;
import java.util.Map;


import egovframework.rte.psl.dataaccess.mapper.Mapper;



/**
 * @Class Name : FileMapper.java
 * @Description : File DAO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2013.04.18           최초생성
 *
 * @author 이현민
 * @since 2013.04.18
 * @version 1.0
 * @see
 *
 */

@Mapper("fileMapper")
public interface FileMapper{

	/**
	 * 글을 등록한다.
	 * @param map - 등록할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
    int insert(Map<String, Object> map) throws Exception;

    /**
	 * 글을 수정한다.
	 * @param map - 수정할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
    int update(Map<String, Object> map) throws Exception;

    /**
	 * 글을 삭제한다.
	 * @param map - 삭제할 정보가 담긴 map
	 * @return 등록 결과
	 * @exception Exception
	 */
    int delete(Map<String, Object> map) throws Exception;

    /**
	 * 글을 조회한다.
	 * @param map - 조회할 정보가 담긴 map
	 * @return 조회한 글
	 * @exception Exception
	 */
    Map<String, Object> select(Map<String, Object> map) throws Exception;

    /**
	 * 글 목록을 조회한다.
	 * @param map - 조회할 정보가 담긴 map
	 * @return 글 목록
	 * @exception Exception
	 */

    List<Map<String, Object>> list(Map<String, Object> map) throws Exception;
    /**
	 * 파일클래스를 조회한다.
	 * @exception Exception
	 */
    String nextFileClass() throws Exception;

	Object banner();




}
