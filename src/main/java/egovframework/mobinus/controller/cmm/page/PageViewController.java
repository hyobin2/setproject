package egovframework.mobinus.controller.cmm.page;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;
import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @Class Name : PageViewController.java
 * @Description : PageViewController Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2015.01.11           최초생성
 *
 * @author 이현민
 * @since 2015. 01.11
 * @version 1.0
 * @see
 *
 */

@Controller
public class PageViewController {

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

    @RequestMapping("/")
   	public String index() {
   		return "forword:/ko/index.do";
   	}

   	@RequestMapping("/{path1}.do")
   	public String view(@PathVariable("path1") String path1) {
   		return "/"+path1;
   	}

   	@RequestMapping("/{path1}/{path2}.do")
   	public String view(@PathVariable("path1") String path1, @PathVariable("path2") String path2) {
   		return "/" + path1 + "/" + path2;
   	}

   	@RequestMapping("/{path1}/{path2}/{path3}.do")
   	public String view(@PathVariable("path1") String path1, @PathVariable("path2") String path2 , @PathVariable("path3") String path3) {
   		return "/" + path1 + "/" + path2 + "/" + path3;
   	}
	@RequestMapping("/{path1}/{path2}/{path3}/{path4}.do")
   	public String view(@PathVariable("path1") String path1, @PathVariable("path2") String path2 , @PathVariable("path3") String path3, @PathVariable("path4") String path4) {
   		return "/" + path1 + "/" + path2 + "/" + path3 + "/" + path4;
   	}

}
