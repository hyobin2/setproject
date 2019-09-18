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
			model.addAttribute("paramMap", paramMap);
			return PREFIX + "/write";
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
			return "redirect:" + PREFIX + "/list.do?type=" + paramMap.getStr("type");
		}
	}

}
