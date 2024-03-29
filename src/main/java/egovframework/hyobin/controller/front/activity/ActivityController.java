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
package egovframework.hyobin.controller.front.activity;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.util.FileUploadUtil;
import egovframework.com.cmm.util.FormBasedFileUtil;
import egovframework.com.cmm.util.FormBasedFileVo;
import egovframework.com.cmm.util.GlobalsProperties;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.hyobin.service.board.BoardService;
import egovframework.hyobin.service.file.FileService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : BoardController.java
 * @Description : Board Controller Class
 * @Modification Information @ 수정일 수정자 수정내용 @ --------- ---------
 *               ------------------------------- @ 2013.04.18 최초생성
 *
 * @author 이현민
 * @since 2013.04.18
 * @version 1.0
 */

@Controller
@RequestMapping(value = ActivityController.PREFIX)
public class ActivityController {

	public static final String PREFIX = "/front/sub/cummunity/activity";
	public static final String B_CODE = GlobalsProperties.getProperty("Bbs.activity");
	public static final String FILE_UPLOAD_PATH = GlobalsProperties.getFileProperty("activity.Path");
	/** BoardService */
	@Resource(name = "boardService")
	private BoardService boardService;

	/** FileService */
	@Resource(name = "fileService")
	private FileService fileService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/list.do")
	public String list(MyMap paramMap, ModelMap model) throws Exception {
		paramMap.put("bCode", B_CODE);
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(paramMap.getInt("pageIndex", 1));
		paginationInfo.setRecordCountPerPage(propertiesService.getInt("pageUnit"));
		paginationInfo.setPageSize(propertiesService.getInt("pageSize"));

		paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
		paramMap.put("lastIndex", paginationInfo.getLastRecordIndex());
		paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

		List<Map<String, Object>> list = boardService.list(paramMap.getMap());
		int count = boardService.count(paramMap.getMap());
		paginationInfo.setTotalRecordCount(count);

		model.addAttribute("paramMap", paramMap.getMap());
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("paginationInfo", paginationInfo);
		return PREFIX + "/list";
	}


	   @RequestMapping("/view.do") public String view(MyMap paramMap, Model model)
	   throws Exception {

	   Map<String, Object> info = boardService.select(paramMap.getMap());
	   if (info != null) {
		   boardService.updateHit(paramMap.getMap());
		   info.put("fileList", fileService.list(info));
		   Map<String, Object> prev = boardService.prev(info);
		   Map<String, Object> next = boardService.next(info);
		   model.addAttribute("prev", prev);
		   model.addAttribute("next", next);
		   model.addAttribute("info", info);
		   model.addAttribute("paramMap", paramMap.getMap());
		   }
	   return PREFIX + "/view";
	   }



}
