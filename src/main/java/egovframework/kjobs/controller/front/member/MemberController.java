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
package egovframework.kjobs.controller.front.member;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.util.StringUtil;
import egovframework.com.cmm.util.UserDetailsHelper;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.kjobs.service.inquiry.InquiryService;
import egovframework.kjobs.service.member.MemberService;
import egovframework.kjobs.service.scrty.ScrtyService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import nl.captcha.Captcha;

/**
 * @Class Name : AdmMemberController.java
 * @Description : AdmMemberController Class
 * @Modification Information @ 수정일 수정자 수정내용 @ --------- ---------
 * ------------------------------- @ 2013.04.18 최초생성
 *
 * @author 이현민
 * @since 2013.04.18
 * @version 1.0
 *
 */

@Controller
@RequestMapping(value = MemberController.PREFIX)
public class MemberController {

	public static final String PREFIX = "/front/sub/member";


	/** loginMngService */
	@Resource(name = "memberService")
	private MemberService memberService;

	/** scrtyService */
	@Resource(name = "scrtyService")
	private ScrtyService scrtyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 로그인 화면을 조회한다.
	 *
	 * @param MyMap    - 목록 조회조건 정보가 담긴 MyMap
	 * @param model
	 * @return "/admin/member/login"
	 * @exception Exception
	 */
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Map<String, Object> loginMap = (HashMap<String, Object>) UserDetailsHelper.getAuthenticatedUser();
		if (loginMap != null) {
			return "redirect:/front/index.do";
		}

		return PREFIX + "/login";
	}

	/**
	 * 로그인 처리를 한다.
	 *
	 * @param MyMap - 목록 조회조건 정보가 담긴 MyMap
	 * @return "forward:/adm/now/list.do"
	 * @exception Exception
	 */
	@RequestMapping("/loginProc.do")
	public String loginProc(MyMap paramMap, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		String callBackUrl = PREFIX + "/login.do";
		String resultMsg = "";

		String id = paramMap.getStr("id");
		String pw = paramMap.getStr("pw");

		try {
			if (!"".equals(id) && !"".equals(pw)) {
				Map<String, Object> loginMap = memberService.select(paramMap.getMap());
				if (loginMap != null) {
					String resultPw = StringUtil.isNullToString(loginMap.get("pw"));
					// 패스워드 검증
  					boolean checkPw = scrtyService.checkPassword(pw, resultPw, id);

					if (checkPw) {
						// 로그인 처리
						request.getSession().setAttribute("loginMap", loginMap);
						return "redirect:/front/index.do";

					} else { // 패스워드 불일치
						resultMsg = "아이디 및 패스워드 정보가 일치하지 않습니다.";
					}
				} else { // 없는 아이디
					resultMsg = "아이디 및 패스워드 정보가 일치하지 않습니다.";
				}
			} else {
				resultMsg = "아이디 및 패스워드 정보가 일치하지 않습니다.";
			}
		} catch (Exception e) {
			resultMsg = "로그인중 에러 발생";
		}

		model.addAttribute("callBackUrl", callBackUrl);
		model.addAttribute("resultMsg", resultMsg);
		return "/common/resultMsg";
	}

	/**
	 * 로그아웃
	 *
	 * @param MyMap - 등록할 정보가 담긴 MyMap
	 * @exception Exception
	 */
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, Model model) throws Exception {

		String callBackUrl = PREFIX + "/login.do";
		String resultMsg = "로그아웃 되었습니다.";

		request.getSession().invalidate();

		model.addAttribute("callBackUrl", callBackUrl);
		model.addAttribute("resultMsg", resultMsg);
		return "/common/resultMsg";
	}

	@RequestMapping(value = "/join01.do")
	public String join01(MyMap paramMap, Model model, SessionStatus status) throws Exception {

		return PREFIX + "/join01";
	}

	@RequestMapping(value = "/join02.do")
	public String join02(MyMap paramMap, Model model, SessionStatus status) throws Exception {

		return PREFIX + "/join02";
	}
	@RequestMapping(value = "/join03.do")
	public String join03(MyMap paramMap, Model model, SessionStatus status) throws Exception {

		return PREFIX + "/join03";
	}


	@RequestMapping(value = "/proc.do")
	public String join(MyMap paramMap, Model model, SessionStatus status, RedirectAttributes redirectAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String chkCaptcha = (String) request.getSession().getAttribute(Captcha.NAME);
		if (!chkCaptcha.equals(paramMap.getStr("captcha"))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('보안문자가 올바르지 않습니다.'); history.go(-1);</script>");
			out.flush();
			model.addAttribute("paramMap",paramMap);
			return PREFIX + "/join02";
		}else {
			paramMap.put("tel", scrtyService.encrypt(paramMap.getStr("tel")));
			paramMap.put("email", scrtyService.encrypt(paramMap.getStr("email")));
			paramMap.put("pw", scrtyService.encryptPassword(paramMap.getStr("pw"), paramMap.getStr("id")));
			memberService.join(paramMap.getMap());
			return "redirect:/front/sub/member/join03.do";
		}
	}

	@RequestMapping(value = "/checkMember.do")
	@ResponseBody
	public Object checkMember(@RequestBody Map<String, Object> paramMap, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		Map<String, Object> loginMap = memberService.select(paramMap);
		if(loginMap!=null) {
			return "Y";
		}
		return "N";
	}

}
