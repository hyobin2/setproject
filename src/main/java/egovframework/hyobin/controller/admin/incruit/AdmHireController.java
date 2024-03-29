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
package egovframework.hyobin.controller.admin.incruit;

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
import egovframework.hyobin.service.file.FileService;
import egovframework.hyobin.service.hire.HireService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : HireController.java
 * @Description : Hire Controller Class
 * @Modification Information @ 수정일 수정자 수정내용 @ --------- ---------
 *               ------------------------------- @ 2013.04.18 최초생성
 *
 * @author 이현민
 * @since 2013.04.18
 * @version 1.0
 */

@Controller
@RequestMapping(value = AdmHireController.PREFIX)
public class AdmHireController {

	public static final String PREFIX = "/adm/hire";
	public static final String FILE_UPLOAD_PATH = GlobalsProperties.getFileProperty("hire.Path"); // DB에 테이블을 하나로써서upload경로를 따로지정//sponson.Path=/upload/editor/images(설정을따로함)
	/** HireService */
	@Resource(name = "hireService") // HireServiceImpl를 생성자 //Autowired와 비슷함 (autowired는 스프링에서만 사용  Resource는 자바에서 사용)
	private HireService hireService;

	/** FileService */
	@Resource(name = "fileService") // 인터페이스 FileService 를 부름
	private FileService fileService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService") // 인터페이스 EgovPropertyService 를 부름
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator") // 인터페이스 beanValidator 를 부름
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/list.do") // 게시판 게시물 보기url
	public String list(MyMap paramMap, ModelMap model) throws Exception {

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(paramMap.getInt("pageIndex", 1));
		paginationInfo.setRecordCountPerPage(propertiesService.getInt("pageUnit"));
		paginationInfo.setPageSize(propertiesService.getInt("pageSize"));
		paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());

		paramMap.put("lastIndex", paginationInfo.getLastRecordIndex());
		paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

		List<Map<String, Object>> list = hireService.list(paramMap.getMap());
		int count = hireService.count(paramMap.getMap());
		paginationInfo.setTotalRecordCount(count);


		model.addAttribute("paramMap", paramMap.getMap());
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("paginationInfo", paginationInfo);
		return PREFIX + "/list";
	}


	   @RequestMapping("/view.do") public String view(MyMap paramMap, Model model)
	   throws Exception {

	   Map<String, Object> info = hireService.select(paramMap.getMap()); if (info
	   != null) { info.put("fileList", fileService.list(info));
	   model.addAttribute("info", info); }
	   return PREFIX + "/view"; }

	@RequestMapping("/write.do") // 글쓰기 url
	public String write(MyMap paramMap, Model model) throws Exception {

		Map<String, Object> info = hireService.select(paramMap.getMap());

		if (info != null) {
			info.put("fileList", fileService.list(info));
			model.addAttribute("info", info);
		}
		model.addAttribute("paramMap", paramMap.getMap());

		return PREFIX + "/write";
	}

	@RequestMapping("/proc.do")
	public String proc(MyMap paramMap, HttpServletRequest request, Model model, SessionStatus status) throws Exception {

		FileUploadUtil fileutil = new FileUploadUtil();

		List<FormBasedFileVo> fileList = fileutil.uploadFiles(request, FILE_UPLOAD_PATH,propertiesService.getLong("maxUploadSize"));
		if (fileList.size() > 0) {
			for (int i = 0; i < fileList.size(); i++) {
				FormBasedFileVo basedfilevo = fileList.get(i);
				MyMap fileMap = new MyMap();
				if (!"".equals(paramMap.getStr("fileclass"))) {
					fileMap.put("fileclass", paramMap.getStr("fileclass"));
				} else {
					paramMap.put("fileclass", fileService.nextFileClass());
					fileMap.put("fileclass", fileService.nextFileClass());
				}
				fileMap.put("type", basedfilevo.getContentType());
				fileMap.put("orgFilename", basedfilevo.getFileName());
				fileMap.put("filename", basedfilevo.getPhysicalName());
				fileMap.put("filepath",FILE_UPLOAD_PATH + FormBasedFileUtil.SEPERATOR + basedfilevo.getServerSubPath()); //파일 저장위치 저장
				fileMap.put("size", basedfilevo.getSize());
				fileMap.put("fOrder", basedfilevo.getfOrder());
				fileService.insert(fileMap.getMap());
			}
		}

		if (paramMap.getInt("hIdx") > 0) { //hIdx로 해당글이 존재 여부 확인
			// update
			hireService.update(paramMap.getMap());// 게시판 update 실행
		} else {
			// insert
			hireService.insert(paramMap.getMap());// 게시판 insert 실행
		}

		model.addAttribute("paramMap", paramMap.getMap());//map에 있는값들을 model에 저장
		status.setComplete(); // 해당 컨드롤러에서의 SessionAttributes만 사라짐 //SessionStatus객체 사용후에는 꼭사용해야함 수동으로 제거하지않으면 값이계속 남아있음
		return "redirect:" + PREFIX + "/list.do"; // 완료후 url list.do 호출 후 list.do 페이지로 이동
	}


	@RequestMapping("/delete.do")
	public String delete(MyMap paramMap, Model model, SessionStatus status) throws Exception {

		hireService.delete(paramMap.getMap());

		model.addAttribute("paramMap", paramMap.getMap());
		return "redirect:" + PREFIX + "/list.do";
	}

}
