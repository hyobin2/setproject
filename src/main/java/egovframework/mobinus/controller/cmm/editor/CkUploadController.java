package egovframework.mobinus.controller.cmm.editor;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.com.cmm.util.FileUploadUtil;
import egovframework.com.cmm.util.FormBasedFileUtil;
import egovframework.com.cmm.util.FormBasedFileVo;
import egovframework.com.cmm.util.GlobalsProperties;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class CkUploadController {
	private static Logger logger = LoggerFactory.getLogger(CkUploadController.class);

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	public static final String FILE_UPLOAD_PATH = GlobalsProperties.getFileProperty("CkEditor.Path");


	@RequestMapping("/editor/ck/imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, Model model, SessionStatus status)
			throws Exception {

		FileUploadUtil fileutil = new FileUploadUtil();

		List<FormBasedFileVo> fileList = fileutil.uploadFiles(request, FILE_UPLOAD_PATH, propertiesService.getLong("maxUploadSize"));
		if (fileList.size() <= 0) {

		} else {
			for (int i = 0; i < fileList.size(); i++) {
				FormBasedFileVo basedfilevo = fileList.get(i);
				MyMap fileMap = new MyMap();
				fileMap.put("type", basedfilevo.getContentType());
				fileMap.put("orgFilename", basedfilevo.getFileName());
    			fileMap.put("filename", basedfilevo.getPhysicalName());
    			fileMap.put("filepath", FILE_UPLOAD_PATH + FormBasedFileUtil.SEPERATOR+basedfilevo.getServerSubPath());
    			fileMap.put("size", basedfilevo.getSize());
    			fileMap.put("fOrder", basedfilevo.getfOrder());

				String fncNum = request.getParameter("CKEditorFuncNum");

				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter printWriter = null;
				printWriter = response.getWriter();

				printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + fncNum
						+ ",'" + /* request.getContextPath() */ fileMap.getStr("filepath") +FormBasedFileUtil.SEPERATOR+ fileMap.getStr("filename")
						+ "','이미지를 업로드 하였습니다.'" + ")</script>");
				printWriter.flush();
			}
		}
	}
}
