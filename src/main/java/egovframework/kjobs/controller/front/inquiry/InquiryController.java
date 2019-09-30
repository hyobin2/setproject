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
package egovframework.kjobs.controller.front.inquiry;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.util.FileUploadUtil;
import egovframework.com.cmm.util.StringUtil;
import egovframework.com.cmm.util.UserDetailsHelper;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.kjobs.service.inquiry.InquiryService;
import egovframework.kjobs.service.scrty.ScrtyService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import nl.captcha.Captcha;

/**
 * @Class Name : QnaController.java
 * @Description : QnaController Class
 * @Modification Information @ 수정일 수정자 수정내용 @ --------- ---------
 * ------------------------------- @ 2013.04.18 최초생성
 *
 * @author 이현민
 * @since 2013.04.18
 * @version 1.0
 */

@Controller
@RequestMapping(value = InquiryController.PREFIX)
public class InquiryController {

	public static final String PREFIX = "/front/sub/customer/inquiry";

	/** QnaService */
	@Resource(name = "inquiryService")
	private InquiryService inquiryService;

	/** EduApplyService */
	@Resource(name = "scrtyService")
	private ScrtyService scrtyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping("/proc.do")
	public String proc(MyMap paramMap, HttpServletRequest request, HttpServletResponse response, Model model, SessionStatus status) throws Exception {
		String chkCaptcha = (String) request.getSession().getAttribute(Captcha.NAME);
		if (!chkCaptcha.equals(paramMap.getStr("captcha"))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('보안문자가 올바르지 않습니다.'); history.go(-1);</script>");
			out.flush();
		} else {
			paramMap.put("code", "Q");

			paramMap.put("tel", scrtyService.encrypt(paramMap.getStr("tel")));
			paramMap.put("email", scrtyService.encrypt(paramMap.getStr("email")));

			if (paramMap.getInt("iIdx") > 0) {
				// update
				inquiryService.update(paramMap.getMap());
			} else {
				// insert
				inquiryService.insert(paramMap.getMap());
			}

			model.addAttribute("paramMap", paramMap.getMap());

			status.setComplete();
		}
		return "redirect:" + PREFIX + "/list.do?type=" + paramMap.getStr("type");
	}
	@RequestMapping(value="/list.do")
    public String list(MyMap paramMap, ModelMap model)
            throws Exception {
    	/** pageing setting */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(paramMap.getInt("pageIndex", 1));
		paginationInfo.setRecordCountPerPage(propertiesService.getInt("pageUnit"));
		paginationInfo.setPageSize(propertiesService.getInt("pageSize"));
		paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
		paramMap.put("lastIndex", paginationInfo.getLastRecordIndex());
		paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		paramMap.put("code", "Q");
		List<Map<String, Object>> list = inquiryService.list(paramMap.getMap());
		int count = inquiryService.count(paramMap.getMap());
		paginationInfo.setTotalRecordCount(count);

		if( list != null && list.size() > 0 ){
			for( int i = 0; i < list.size(); i++ ){
				Map<String, Object> tmpListMap = list.get(i);
				tmpListMap.put("tel", scrtyService.decrypt(StringUtil.isNullToString(tmpListMap.get("tel"))));
				tmpListMap.put("email", scrtyService.decrypt(StringUtil.isNullToString(tmpListMap.get("email"))));
			}
		}

		model.addAttribute("paramMap", paramMap.getMap());
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("paginationInfo", paginationInfo);

        return PREFIX + "/list";
    }



    @RequestMapping("/view.do")
    public String view(MyMap paramMap, Model model, HttpServletResponse response)
            throws Exception {

    	Map<String, Object> info = inquiryService.select(paramMap.getMap());

    	Map<String, Object> loginMap = (HashMap<String, Object>) UserDetailsHelper.getAuthenticatedUser();
    	if(!loginMap.get("id").equals(info.get("regId"))){
    		response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('자신의글만 열람 할 수 있습니다.'); history.go(-1);</script>");
			out.flush();
			model.addAttribute("paramMap", paramMap);
    	}

    	if(info != null) {
        	info.put("tel", scrtyService.decrypt((String) info.get("tel")));
    		info.put("email", scrtyService.decrypt((String) info.get("email")));
            model.addAttribute("info", info);
            model.addAttribute("paramMap", paramMap.getMap());
    	}


        return PREFIX + "/view";
    }

    @RequestMapping("/write.do")
    public String write(MyMap paramMap, Model model)
            throws Exception {
    	paramMap.put("code", "Q");
    	Map<String, Object> info = inquiryService.select(paramMap.getMap());

    	if(info != null) {
    		info.put("tel", scrtyService.decrypt((String) info.get("tel")));
			info.put("email", scrtyService.decrypt((String) info.get("email")));
    		model.addAttribute("info", info);
    	}
    	model.addAttribute("paramMap", paramMap.getMap());

        return PREFIX + "/write";
    }

}
