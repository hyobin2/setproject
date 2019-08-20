package egovframework.mobinus.controller.cmm.file;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComMessageSource;
import egovframework.com.cmm.util.FormBasedFileUtil;
import egovframework.com.cmm.util.StringUtil;
import egovframework.com.cmm.util.WebUtil;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.mobinus.service.file.FileService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : DownloadFileController.java
 * @Description : DownloadFileController Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2015.01.11 최초생성
 *
 * @author 이현민
 * @since 2015. 01.11
 * @version 1.0
 * @see
 *
 */

@Controller
public class DownloadFileController {

	/** DemonFileService */
	@Resource(name = "fileService")
	private FileService fileService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
	@Resource(name = "comMessageSource")
	ComMessageSource comMessageSource;

	@RequestMapping("/file/download.do")
	public void downloadFile(MyMap paramMap, HttpServletRequest request, HttpServletResponse response, Model model,
			SessionStatus status)
			// BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {
		Map<String, Object> fileMap = fileService.select(paramMap.getMap());
		String where = request.getSession().getServletContext().getRealPath("/") + StringUtil.isNullToString(fileMap.get("filepath"))
				+ File.separator;
		String physicalName = StringUtil.isNullToString(fileMap.get("filename"));
		String original = StringUtil.isNullToString(fileMap.get("orgFilename"));
		FormBasedFileUtil.downloadFile(response, where, physicalName, original);
	}

	@RequestMapping("/file/viewImg.do")
	public void viewImgFile(MyMap paramMap, HttpServletRequest request, HttpServletResponse response,
			Model model, SessionStatus status) throws Exception {
		Map<String, Object> fileMap = fileService.select(paramMap.getMap());
		String fileUrl = StringUtil.isNullToString(fileMap.get("filepath"))+StringUtil.isNullToString(File.separator+fileMap.get("filename"));
		String where = request.getSession().getServletContext().getRealPath("/");

		FormBasedFileUtil.viewFile(response, where, fileUrl, null, paramMap);
	}

}
