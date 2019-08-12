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
package egovframework.mobinus.controller.ko.inquiry;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.util.FileUploadUtil;
import egovframework.com.cmm.util.FormBasedFileUtil;
import egovframework.com.cmm.util.FormBasedFileVo;
import egovframework.com.cmm.util.GlobalsProperties;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.mobinus.service.file.FileService;
import egovframework.mobinus.service.inquiry.InquiryService;
import egovframework.mobinus.service.scrty.ScrtyService;
import egovframework.rte.fdl.property.EgovPropertyService;



/**
 * @Class Name : InquiryController.java
 * @Description : InquiryController Class
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
@RequestMapping(value = KoInquiryController.PREFIX)
public class KoInquiryController {

	public static final String PREFIX = "/ko/inquiry";
	public static final String FILE_UPLOAD_PATH = GlobalsProperties.getFileProperty("Inquiry.Path");

	/** InquiryService */
	@Resource(name = "inquiryService")
	private InquiryService inquiryService;

	/** FileService */
	@Resource(name = "fileService")
	private FileService fileService;

	/** EduApplyService */
	@Resource(name = "scrtyService")
	private ScrtyService scrtyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;


    @RequestMapping("/write.do")
    public String write(MyMap paramMap, Model model)
            throws Exception {

    	model.addAttribute("paramMap", paramMap.getMap());

        return PREFIX + "/write";
    }


    @RequestMapping("/proc.do")
    public String proc(MyMap paramMap, HttpServletRequest request, HttpServletResponse response, Model model, SessionStatus status)
            throws Exception {


		/*if (!captchaService.isCorrect(captcha)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('보안문자가 올바르지 않습니다.'); history.go(-1);</script>");
			out.flush();
		}else {*/

	    	FileUploadUtil fileutil = new FileUploadUtil();

	    	List<FormBasedFileVo> fileList = fileutil.uploadFiles(request, FILE_UPLOAD_PATH, propertiesService.getLong("maxUploadSize"));

	    	if(fileList.size() > 0){
	    		for(int i=0; i<fileList.size(); i++){
	    			FormBasedFileVo basedfilevo = fileList.get(i);
	    			MyMap fileMap = new MyMap();
	    			if(!"".equals(paramMap.getStr("fileclass"))){
	    				fileMap.put("fileclass", paramMap.getStr("fileclass"));
	    			}else {
	    				paramMap.put("fileclass", fileService.nextFileClass());
	    				fileMap.put("fileclass", fileService.nextFileClass());
	    			}
	    			fileMap.put("type", basedfilevo.getContentType());
	    			fileMap.put("orgFilename", basedfilevo.getFileName());
	    			fileMap.put("filename", basedfilevo.getPhysicalName());
	    			fileMap.put("filepath", FILE_UPLOAD_PATH + FormBasedFileUtil.SEPERATOR+basedfilevo.getServerSubPath());
	    			fileMap.put("size", basedfilevo.getSize());
	    			fileMap.put("fOrder", basedfilevo.getfOrder());
	    			fileService.insert(fileMap.getMap());
	    		}
	    	}

	    	paramMap.put("tel", scrtyService.encrypt(paramMap.getStr("tel")));
			paramMap.put("email", scrtyService.encrypt(paramMap.getStr("email")));

	    	inquiryService.insert(paramMap.getMap());

	    	model.addAttribute("paramMap", paramMap.getMap());

	    	String resultMsg = "등록되었습니다.";
	    	String callBackUrl = PREFIX+"/write.do";
	    	model.addAttribute("callBackUrl", callBackUrl);
			model.addAttribute("resultMsg", resultMsg);

	        status.setComplete();
	    //}
		return "/common/resultMsg";
    }

}
