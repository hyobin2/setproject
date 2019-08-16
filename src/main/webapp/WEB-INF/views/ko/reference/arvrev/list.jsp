<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">

function fn_link_page(pageNo){
	$('#pageIndex').val(pageNo);
	$('#baseForm').attr('action', '/ko/reference/arvrev/list.do');
	$('#baseForm').submit();
}

function fn_search_page(){
	$('#pageIndex').val(1);
	$('#baseForm').attr('action', '/ko/reference/arvrev/list.do');
	$('#baseForm').submit();
}
function fn_view(bIdx){
	var params = {'bIdx': bIdx}
	$.ajax({
        url: "/ko/reference/arvrev/view.do",
        type: "post",
        data: JSON.stringify(params),
        contentType: "application/json; charset=utf-8;",
        dataType: "json",
        success: function(result){
        	$("#viewTitle").text(result.title);
        	$("#viewContent").text(result.content);
        	if(result.fileList.length > 0){
        		$("#viewImg").attr("src", "/file/viewImg.do?fIdx="+result.fileList[0].fIdx+"&thumbYn=Y&w=560&h=356");
        	}
        },
        error: function(){
            alert("err");
        }
    });
}
</script>
        <div id="contents" class="reference_page">
            <div class="section_top">
                <div class="top_wave">
                    <svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 21 150 24" preserveAspectRatio="none">
                        <defs><path id="top_wave" d="M-160 44c30 0 58-11 88-11s 58 11 88 11 58-11 88-11 58 11 88 11 v44h-352z" /></defs>
                        <g class="parallax"><use xlink:href="#top_wave" x="10" y="0" fill="#fff"/></g>
                    </svg>
                </div>
                <div class="wrapper">
                    <ul class="breadcrumb clear">
                        <li>HOME</li>
                        <li>레퍼런스</li>
                        <li>전시영상</li>
                    </ul>
                    <div class="sub_tit">
                        <h2>레퍼런스</h2>
                        <p>아이디어와 기술로 트렌드를 리드하는 (주)모바인어스</p>
                    </div>
                </div>
            </div>
            <div class="section reference_con">
                <div class="wrapper">
                    <h3 class="fo_exo sub_con_tit">
						전시영상
                    </h3>
                    <div class="refer_list_area">
                        <form name="baseForm" id="baseForm" method="get" action="/ko/reference/arvrev/list.do" >
						<input type="hidden" name="bIdx" id="bIdx" value=""/>
						<input type="hidden" name="pageIndex" id="pageIndex" value="${paramMap.pageIndex }"/>
                            <fieldset>
                                <div class="search_box">
                                    <select id="searchCondition" name="searchCondition">
										<option value="0" ${paramMap.searchCondition == 0 ? 'selected="selected"':'' } >전체</option>
										<option value="1" ${paramMap.searchCondition == 1 ? 'selected="selected"':'' }>제목</option>
										<option value="2" ${paramMap.searchCondition == 2 ? 'selected="selected"':'' }>내용</option>
									</select>
                                    <input type="text" id="searchKeyword" name="searchKeyword" value="${paramMap.searchKeyword }" placeholder="검색어를 입력해주세요." />
                                    <button type="button" onclick="fn_search_page(); return false;">확인</button>
                                </div>
                                <ul class="refer_list clear">
                                    <c:forEach var="result" items="${list}" varStatus="status">
                                    <li onclick="fn_view('${result.bIdx}')">
                                        <div class="img_box">
                                            <c:if test="${result.fileList[0].fOrder == '1'}">
                                        		<img src="/file/viewImg.do?fIdx=${result.fileList[0].fIdx}&thumbYn=Y&w=280&h=178" alt="${result.fileList[0].orgFilename}">
			                                </c:if>
                                        </div>
                                        <p>${result.title }</p>
                                    </li>
                                    </c:forEach>
                                </ul>
                                <div class="paging">
                                    <div class="paging">
										<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page"  />
									</div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="refer_popup">
                <div class="pop_inner">
                    <div class="pop_top">
                        <h4 id="viewTitle"></h4>
                        <button class="pop_close"><i class="xi-close"></i></button>
                    </div>
                    <div class="pop_con">
                        <div class="img_box" >
                            <img id="viewImg" src="/file/viewImg.do?fIdx=${result.fileList[0].fIdx}&thumbYn=Y&w=280&h=178" alt="">
                        </div>
                        <p id="viewContent"></p>
                    </div>
                </div>
            </div>
            <div class="pop_mask"></div>
        </div>