package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public ImagePaginationRenderer() {

	}

	public void initVariables(){

		firstPageLabel    = "<span><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"page_first\" ><img src=\"/resources/front/img/btn_pagefirst.png\" alt=\"처음 페이지\"></a></span>&#160;";
        previousPageLabel = "<span><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"page_prev\"><img src=\"/resources/front/img/btn_pageprev.png\" alt=\"이전 페이지\"></a></span>&#160;";
        currentPageLabel  = "<strong>{0}</strong>&#160;";
        otherPageLabel    = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>&#160;";
        nextPageLabel     = "<span><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"page_next\" ><img src=\"/resources/front/img/btn_pagenext.png\" alt=\"다음 페이지\"></a></span>&#160;";
        lastPageLabel     = "<span><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"page_last\" ><img src=\"/resources/front/img/btn_pagelast.png\" alt=\"마지막 페이지\"></a></span>&#160;";
	}



	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
