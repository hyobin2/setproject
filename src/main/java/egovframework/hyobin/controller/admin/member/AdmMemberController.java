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
package egovframework.hyobin.controller.admin.member;

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

import egovframework.com.cmm.util.StringUtil;
import egovframework.com.cmm.util.UserDetailsHelper;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.hyobin.service.inquiry.InquiryService;
import egovframework.hyobin.service.member.MemberService;
import egovframework.hyobin.service.scrty.ScrtyService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
@RequestMapping(value = AdmMemberController.PREFIX)
public class AdmMemberController {

	public static final String PREFIX = "/adm/member";


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

	/** QnaService */
	@Resource(name = "inquiryService")
	private InquiryService inquiryService;



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
			return "redirect:/adm/member/list.do";
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
						return "redirect:/adm/member/list.do";

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
	 * 관리자 로그아웃
	 *
	 * @param MyMap - 등록할 정보가 담긴 MyMap
	 * @return "forward:/admin/member/login.do"
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

	@RequestMapping(value = "/list.do")
	public String list(MyMap paramMap, ModelMap model) throws Exception {
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(paramMap.getInt("pageIndex", 1));
		paginationInfo.setRecordCountPerPage(propertiesService.getInt("pageUnit"));
		paginationInfo.setPageSize(propertiesService.getInt("pageSize"));
		paramMap.put("firstIndex", paginationInfo.getFirstRecordIndex());

		paramMap.put("lastIndex", paginationInfo.getLastRecordIndex());
		paramMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		List<Map<String, Object>> list = memberService.list(paramMap.getMap());
		for(int i=0;i<list.size();i++) {
			list.get(i).replace("email", scrtyService.decrypt((String)list.get(i).get("email")));
			list.get(i).replace("phone", scrtyService.decrypt((String)list.get(i).get("phone")));
			}
		int count = memberService.count(paramMap.getMap());
		paginationInfo.setTotalRecordCount(count);

		model.addAttribute("paramMap", paramMap.getMap());
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("paginationInfo", paginationInfo);
		return PREFIX + "/list";
	}
	@RequestMapping(value = "/write.do") // 글쓰기 url
	public String write(MyMap paramMap, Model model) throws Exception {

		Map<String, Object> info = memberService.select(paramMap.getMap());
		String email = scrtyService.decrypt((String)info.get("email"));
		String phone =scrtyService.decrypt((String)info.get("phone"));
		info.remove("email");
		info.remove("phone");
		info.put("email", email);
		info.put("phone", phone);
		model.addAttribute("info", info);
		model.addAttribute("paramMap", paramMap.getMap());

		return PREFIX + "/write";
	}


	@RequestMapping(value = "/proc.do")
	public String proc(MyMap paramMap, HttpServletRequest request, Model model, SessionStatus status) throws Exception {


		model.addAttribute("paramMap", paramMap.getMap());
		status.setComplete();
		return "redirect:" + PREFIX + "/list.do";
	}


	@RequestMapping(value = "/delete.do")
	public String delete(MyMap paramMap, Model model, SessionStatus status) throws Exception {

		memberService.delete(paramMap.getMap());

		model.addAttribute("paramMap", paramMap.getMap());
		return "redirect:" + PREFIX + "/list.do";
	}


}
