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
package egovframework.kjobs.controller.admin.popup;

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
import egovframework.kjobs.service.code.CodeService;
import egovframework.kjobs.service.file.FileService;
import egovframework.kjobs.service.popup.PopupService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : PopupController.java
 * @Description : Popup Controller Class
 * @Modification Information
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2013.04.18           최초생성
 *
 * @author 이현민
 * @since 2013.04.18
 * @version 1.0
 */

@Controller
@RequestMapping(value = AdmPopupController.PREFIX)
public class AdmPopupController {

	public static final String PREFIX = "/adm/popup";
	public static final String FILE_UPLOAD_PATH = GlobalsProperties.getFileProperty("popup.Path");

	/** PopupService */
	@Resource(name = "popupService")
	private PopupService popupService;

	/** FileService */
	@Resource(name = "fileService")
	private FileService fileService;

	/** CodeService */
	@Resource(name = "codeService")
	private CodeService codeService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;


	@RequestMapping(value="/list.do")
    public String list(MyMap paramMap, ModelMap model)
            throws Exception {
    	/** pageing setting */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(paramMap.getInt("pageIndex", 1));
		paginationInfo.setRecordCountPerPage(propertiesService.getInt("pageUnit"));
		paginationInfo.setPageSize(propertiesService.getInt("pageSize"));
		paramMap.put("pCode", "POP01");
		
		paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
		paramMap.put("lastIndex", paginationInfo.getLastRecordIndex());
		paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

		List<Map<String, Object>> list = popupService.list(paramMap.getMap());
		int count = popupService.count(paramMap.getMap());
		paginationInfo.setTotalRecordCount(count);

		model.addAttribute("paramMap", paramMap.getMap());
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("paginationInfo", paginationInfo);

        return PREFIX + "/list";
    }



    @RequestMapping("/view.do")
    public String view(MyMap paramMap, Model model)
            throws Exception {

    	Map<String, Object> info = popupService.select(paramMap.getMap());
    	model.addAttribute("info", info);

        return PREFIX + "/view";
    }



    @RequestMapping("/write.do")
    public String write(MyMap paramMap, Model model)
            throws Exception {

    	Map<String, Object> info = popupService.select(paramMap.getMap());

    	MyMap codeMap = new MyMap();
    	codeMap.put("upCode", "POP");
    	model.addAttribute("pCodeList", codeService.list(codeMap.getMap()));

    	if(info != null) {
    		info.put("fileList", fileService.list(info));
    		model.addAttribute("info", info);
    	}
    	model.addAttribute("paramMap", paramMap.getMap());

        return PREFIX + "/write";
    }


    @RequestMapping("/proc.do")
    public String proc(MyMap paramMap, HttpServletRequest request, Model model, SessionStatus status)
            throws Exception {
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
		paramMap.put("pCode", "POP01");
    	if (paramMap.getInt("pIdx") > 0) {
    		// update
    		popupService.update(paramMap.getMap());
    	}else {
    		//insert
    		popupService.insert(paramMap.getMap());
    	}

    	model.addAttribute("paramMap", paramMap.getMap());

        status.setComplete();
        return "redirect:"+PREFIX+"/list.do";
    }


    @RequestMapping("/delete.do")
    public String delete(MyMap paramMap, Model model, SessionStatus status)
            throws Exception {

    	popupService.delete(paramMap.getMap());

    	model.addAttribute("paramMap", paramMap.getMap());
        return "redirect:"+PREFIX+"/list.do";
    }

}
