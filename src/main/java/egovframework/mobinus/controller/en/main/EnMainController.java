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
package egovframework.mobinus.controller.en.main;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.util.GlobalsProperties;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.mobinus.service.code.CodeService;
import egovframework.mobinus.service.file.FileService;
import egovframework.mobinus.service.scrty.ScrtyService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : ProductController.java
 * @Description : ProductController Class
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
@RequestMapping(value = EnMainController.PREFIX)
public class EnMainController {

	public static final String PREFIX = "/en";

	/** FileService */
	@Resource(name = "fileService")
	private FileService fileService;

	/** FileService */
	@Resource(name = "codeService")
	private CodeService codeService;

	/** EduApplyService */
	@Resource(name = "scrtyService")
	private ScrtyService scrtyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;


	@RequestMapping(value="/index.do")
    public String list(MyMap paramMap, ModelMap model)
            throws Exception {
		paramMap.put("menuId", "index");

		model.addAttribute("paramMap", paramMap.getMap());


        return PREFIX + "/index";
    }

}
