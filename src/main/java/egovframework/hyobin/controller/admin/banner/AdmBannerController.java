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
package egovframework.hyobin.controller.admin.banner;

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
import egovframework.hyobin.service.code.CodeService;
import egovframework.hyobin.service.file.FileService;
import egovframework.hyobin.service.popup.PopupService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : BannerController.java
 * @Description : Banner Controller Class
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
@RequestMapping(value = AdmBannerController.PREFIX)
public class AdmBannerController {

	public static final String PREFIX = "/adm/banner";
	public static final String FILE_UPLOAD_PATH = GlobalsProperties.getFileProperty("banner.Path");

	/** BannerService */
	@Resource(name = "popupService")
	private PopupService bannerService;

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
		paramMap.put("pCode", "POP02");
		paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
		paramMap.put("lastIndex", paginationInfo.getLastRecordIndex());
		paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		List<Map<String, Object>> list = bannerService.list(paramMap.getMap());
		int count = bannerService.count(paramMap.getMap());
		paginationInfo.setTotalRecordCount(count);

		if( list != null && list.size() > 0 ){
			for( int i = 0; i < list.size(); i++ ){
				Map<String, Object> tmpListMap = list.get(i);
				List<Map<String, Object>> fileList = fileService.list(tmpListMap);
				tmpListMap.put("fileList", fileList);
			}
		}

		model.addAttribute("paramMap", paramMap.getMap());
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("paginationInfo", paginationInfo);

        return PREFIX + "/list";
    }



    @RequestMapping("/view.do")
    public String view(MyMap paramMap, Model model)
            throws Exception {

    	Map<String, Object> info = bannerService.select(paramMap.getMap());
    	model.addAttribute("info", info);

        return PREFIX + "/view";
    }



    @RequestMapping("/write.do")
    public String write(MyMap paramMap, Model model)
            throws Exception {

    	Map<String, Object> info = bannerService.select(paramMap.getMap());

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
				fileMap.put("filepath",FILE_UPLOAD_PATH + FormBasedFileUtil.SEPERATOR + basedfilevo.getServerSubPath());
				fileMap.put("size", basedfilevo.getSize());
				fileMap.put("fOrder", basedfilevo.getfOrder());
				fileService.insert(fileMap.getMap());
			}
		}
		paramMap.put("pCode", "POP02");
    	if (paramMap.getInt("pIdx") > 0) {
    		// update
    		bannerService.update(paramMap.getMap());
    	}else {
    		//insert
    		bannerService.insert(paramMap.getMap());
    	}

    	model.addAttribute("paramMap", paramMap.getMap());
        status.setComplete();
        return "redirect:"+PREFIX+"/list.do";
    }


    @RequestMapping("/delete.do")
    public String delete(MyMap paramMap, Model model, SessionStatus status)
            throws Exception {

    	bannerService.delete(paramMap.getMap());

    	model.addAttribute("paramMap", paramMap.getMap());
        return "redirect:"+PREFIX+"/list.do";
    }

}
