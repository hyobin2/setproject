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
package egovframework.kjobs.controller.admin.activity;

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
import egovframework.kjobs.service.board.BoardService;
import egovframework.kjobs.service.file.FileService;
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
@RequestMapping(value = AdmActivityController.PREFIX)
public class AdmActivityController {

	public static final String PREFIX = "/adm/activity";
	public static final String B_CODE = GlobalsProperties.getProperty("Bbs.activity"); // DB에 테이블을 하나로써서 B_CODE로 구별하기 위해 필요// Bbs.sponson=B01 (설정을 따로함)
	public static final String FILE_UPLOAD_PATH = GlobalsProperties.getFileProperty("activity.Path"); // DB에 테이블을 하나로써서upload경로를 따로지정//sponson.Path=/upload/editor/images(설정을따로함)
	/** BoardService */
	@Resource(name = "boardService") // BoardServiceImpl를 생성자 //Autowired와 비슷함 (autowired는 스프링에서만 사용  Resource는 자바에서 사용)
	private BoardService boardService;

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
		paramMap.put("bCode", B_CODE);// 테이블을 하나만 쓰기때문에 select 할떄 가져올 리스트를 구분하기 위함

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo(); // 페이징 처리를 하기위한 생성자 생성
		paginationInfo.setCurrentPageNo(paramMap.getInt("pageIndex", 1)); // 현재 페이지의 정보를 넘김 만약 null일경우 0을 반환
		paginationInfo.setRecordCountPerPage(propertiesService.getInt("pageUnit"));// 출력할 게시물 수를넘김
		paginationInfo.setPageSize(propertiesService.getInt("pageSize")); // 페이즈의 사이즈를 넘김

		paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex()); // 시작 페이지를 구하는 메소드 //(현재 페이지 -1)*/총 페이지 사이즈 +1

		paramMap.put("lastIndex", paginationInfo.getLastRecordIndex()); // 해당 페이지 최대 글 수를 구하는 메소드//현재페이지 * 총 게시물수
		paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());// 한페이지의 출력할 게시물 수를 paramMap에 담음

		List<Map<String, Object>> list = boardService.list(paramMap.getMap()); // boardService 인터페이스를 호출
		int count = boardService.count(paramMap.getMap()); // 글의 총 갯수를 구하기위한 메소드
		paginationInfo.setTotalRecordCount(count); // 위의 메소도를 이용해 글의 총 개수를 구한뒤 값을 넣어줌


		model.addAttribute("paramMap", paramMap.getMap()); // 위의 정보드를 가지고감
		model.addAttribute("list", list); // 위에서 구한 글의 정보들을 model에 담아넘김
		model.addAttribute("count", count); // 글의 총개수를 mdel에 담아넘김
		model.addAttribute("paginationInfo", paginationInfo);// 페이징 처리를위해 담아온 정보들을 model에 담아넘김
		return PREFIX + "/list"; // adm/sponson/list.jsp 호출을 위한코드
	}

	/*
	   @RequestMapping("/view.do") public String view(MyMap paramMap, Model model)
	   throws Exception {

	   Map<String, Object> info = boardService.select(paramMap.getMap()); if (info
	   != null) { info.put("fileList", fileService.list(info));
	   model.addAttribute("info", info); }
	   return PREFIX + "/view"; }
	 */
	@RequestMapping("/write.do") // 글쓰기 url
	public String write(MyMap paramMap, Model model) throws Exception {

		Map<String, Object> info = boardService.select(paramMap.getMap());

		if (info != null) {// 해당 글이 등록되어있는지 확인
			info.put("fileList", fileService.list(info)); // 해당글이 등록되어있으면 fileList 들을 가져와 map에 put
			model.addAttribute("info", info); // model에 info로 저장
		}
		model.addAttribute("paramMap", paramMap.getMap()); // 목록으로 돌아가기를 눌럿을때 해당 페이지로 돌아와야하기때문에 paramMap으로 저장

		return PREFIX + "/write";
	}

	@RequestMapping("/proc.do")
	public String proc(MyMap paramMap, HttpServletRequest request, Model model, SessionStatus status) throws Exception {

		paramMap.put("bCode", B_CODE); //b_cdoe로 게시판 카테고리 구분
		FileUploadUtil fileutil = new FileUploadUtil();

		List<FormBasedFileVo> fileList = fileutil.uploadFiles(request, FILE_UPLOAD_PATH,propertiesService.getLong("maxUploadSize"));
		if (fileList.size() > 0) {
			for (int i = 0; i < fileList.size(); i++) { // 파일 개수 ?? 한개만올라가는데 ??
				FormBasedFileVo basedfilevo = fileList.get(i);
				MyMap fileMap = new MyMap();
				if (!"".equals(paramMap.getStr("fileclass"))) {//이거뭔지물어보자@
					fileMap.put("fileclass", paramMap.getStr("fileclass"));
				} else {
					paramMap.put("fileclass", fileService.nextFileClass());
					fileMap.put("fileclass", fileService.nextFileClass());
				}
				fileMap.put("type", basedfilevo.getContentType());//파일 종류 ex/ png,img,txt
				fileMap.put("orgFilename", basedfilevo.getFileName());//파일 원본 이름
				fileMap.put("filename", basedfilevo.getPhysicalName()); //업로드 된 파일이름
				fileMap.put("filepath",FILE_UPLOAD_PATH + FormBasedFileUtil.SEPERATOR + basedfilevo.getServerSubPath()); //파일 저장위치 저장
				fileMap.put("size", basedfilevo.getSize()); //파일 사이즈 저장
				fileMap.put("fOrder", basedfilevo.getfOrder()); // 삭제할 파일 체크
				fileService.insert(fileMap.getMap());//file insert 실행
			}
		}

		if (paramMap.getInt("bIdx") > 0) { //bIdx로 해당글이 존재 여부 확인
			// update
			boardService.update(paramMap.getMap());// 게시판 update 실행
		} else {
			// insert
			boardService.insert(paramMap.getMap());// 게시판 insert 실행
		}

		model.addAttribute("paramMap", paramMap.getMap());//map에 있는값들을 model에 저장
		status.setComplete(); // 해당 컨드롤러에서의 SessionAttributes만 사라짐 //SessionStatus객체 사용후에는 꼭사용해야함 수동으로 제거하지않으면 값이계속 남아있음
		return "redirect:" + PREFIX + "/list.do"; // 완료후 url list.do 호출 후 list.do 페이지로 이동
	}


	@RequestMapping("/delete.do")
	public String delete(MyMap paramMap, Model model, SessionStatus status) throws Exception {

		boardService.delete(paramMap.getMap());

		model.addAttribute("paramMap", paramMap.getMap());
		return "redirect:" + PREFIX + "/list.do";
	}

}
