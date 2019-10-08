package egovframework.com.cmm.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.util.GlobalsProperties;
import egovframework.com.cmm.util.myMap.MyMap;
import egovframework.hyobin.service.file.FileService;


/**
 * @Class Name  : FileUploadUtil.java
 * @Description : Spring 기반 File Upload 유틸리티
 * @Modification Information
 *
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.08.26       한성곤                  최초 생성
 *
 * @author 공통컴포넌트 개발팀 한성곤
 * @since 2009.08.26
 * @version 1.0
 * @see
 */
public class FileUploadUtil extends FormBasedFileUtil {
    /**
     * 파일을 Upload 처리한다.
     *
     * @param request
     * @param where
     * @param maxFileSize
     * @return
     * @throws Exception
     */
	/** BoardService */


    public static List<FormBasedFileVo> uploadFiles(HttpServletRequest request, String where, long maxFileSize) throws Exception {
	List<FormBasedFileVo> list = new ArrayList<FormBasedFileVo>();

	MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
	Iterator<String> fileIter = mptRequest.getFileNames();
	String fOrder[] = mptRequest.getParameterValues("fOrder");
	String fileclass = mptRequest.getParameter("fileclass");

	if((fOrder != null && fOrder.length > 0) ){
		for(int i=0; i<fOrder.length; i++){
			MyMap fileMap = new MyMap();
			fileMap.put("fOrder", fOrder[i]);
			fileMap.put("fileclass", fileclass);

			ApplicationContext act = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
			FileService fileService = (FileService) act.getBean("fileService");
			fileService.delete(fileMap.getMap());

		}
	}

	while (fileIter.hasNext()) {
		String mfileName = (String)fileIter.next();

		MultipartFile mFile = mptRequest.getFile(mfileName);

	    FormBasedFileVo vo = new FormBasedFileVo();

	    String tmp = mFile.getOriginalFilename();
	    String ext = "";
	    if(tmp.lastIndexOf(".") > -1){
	    	ext = tmp.substring(tmp.lastIndexOf("."));
	    }

        if (tmp.lastIndexOf("\\") >= 0) {
    	tmp = tmp.substring(tmp.lastIndexOf("\\") + 1);  // \\
        }

        vo.setfOrder(mfileName.replaceAll(GlobalsProperties.getFileProperty("Upload.FileName"), ""));
        vo.setFileName(tmp);
        vo.setContentType(mFile.getContentType());
        vo.setServerSubPath(getTodayString());
        vo.setPhysicalName(getPhysicalFileName()+ext);
        vo.setSize(mFile.getSize());
        vo.setServerFullPath(request.getSession().getServletContext().getRealPath("")+where+SEPERATOR+vo.getServerSubPath()+SEPERATOR);

        //System.out.println(vo.getServerFullPath());
        if (tmp.lastIndexOf(".") >= 0) {
   	 	vo.setPhysicalName(vo.getPhysicalName());	// 2012.11 KISA 보안조치
        }

        if (mFile.getSize() > 0) {
        	InputStream is = null;

        	try {
        		is = mFile.getInputStream();
        		saveFile(is, new File(WebUtil.filePathBlackList(vo.getServerFullPath()+vo.getPhysicalName())));

        	} finally {
        		if (is != null) {
        			is.close();
        		}
        	}
        	list.add(vo);
        }
	}

	return list;
    }


    public static boolean moveFile(String orgFilePath, String newFilePath) {
        File orgFile = new File(orgFilePath);
        File newFile = new File(newFilePath);
        boolean moveCheck = false;
        if(orgFile.exists()) {
            moveCheck =orgFile.renameTo(newFile);
        }
        return moveCheck;
    }

    /**
     * <p>
     * 저정한 파일을 삭제한다.
     * </p>
     * @param file
     *        <code>File</code>
     * @throws IOException
     */
    public static void delete(File file) throws IOException {
        if (file.isDirectory()) {
            // it's a folder, list children first
            File[] children = file.listFiles();
            for (int i = 0; i < children.length; i++) {
                delete(children[i]);
            }
        }
        if (!file.delete()) {
            throw new IOException("Unable to delete " + file.getPath());
        }
    }
}
