<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script type="text/javascript">


	function fn_write() {//완료


		if ($('#title').val()  == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return false;
		}

		if (CKEDITOR.instances.content.getData() == "") {
			alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
			$('#content').focus();
			return false;
		}

		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}

		$('#baseForm').attr('action', '/adm/activity/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() { // 삭제

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/activity/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){ //목록
		$('#baseForm').attr('action', '/adm/activity/list.do');
		$('#baseForm').submit();
	}
	console.log('${info}')
</script>


    <div class="s_con_area">
       	<h1>케이잡스 활동</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>케이잡스 활동</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/activity/proc.do" enctype="multipart/form-data" >
		<input type="hidden" name="bIdx" id="bIdx" value="${util:zeroConvert(info.bIdx) }" />
		<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
		<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
		<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />
      	<div class="table_area">
            <div class="">
                <table class="bbs_write" summary="글쓰기입니다. 각 항목으로는 작성자, 분류, 유형, 첨부, 제목, 내용이 있습니다.">
                    <colgroup>
                        <col width="12%">
                        <col width="*">
                    </colgroup>
            	 <tbody>
                    <tr>
                        <th scope="row">제목</th>
                        <td><input type="text" name="title" id="title" style="width:500px" value="${info.title }" maxlength="200" />&nbsp;&nbsp;</td>
                        <c:set var="date" value="${info}" />
                        <c:choose>
                        	<c:when test="${date.modDate != null }">
							<td>작성일:${fn:substring(info.modDate,0,10) } </td>
							</c:when>
							<c:otherwise>
							<td>작성일:${fn:substring(info.regDate,0,10) } </td>

							</c:otherwise>
						</c:choose>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="3">
                        	<textarea name="content" id="content" class="form-control">${info.content }</textarea>
                            <script type="text/javascript">
								CKEDITOR.replace('content', {
									customConfig: '/resources/ckeditor/config.js',
									filebrowserUploadUrl: '/editor/ck/imageUpload.do'
								});
							</script>
						</td>
                    </tr>

					<c:forEach var="i" begin="0" end="0" varStatus="status">
					    <tr>
	                        <th scope="row"><label for="">썸네일${status.index+1 }</label></th>
	                        <td>
	                        	<c:set var="fileFlag" value="Y" />
	                        	<c:forEach var="result" items="${info.fileList}" >
	                        		<c:if test="${status.index+1 == result.fOrder }" >
	                        			<input type="file" id="file${status.index+1 }" name="file${status.index+1 }" />
		                       			<a href="/file/download.do?fIdx=${result.fIdx}">
		                       				${result.orgFilename}
		                       			</a>
		                       			<c:if test="${util:zeroConvert(info.bIdx) > 0}" >
		                       				<input type="checkbox" id="fOrder${status.index+1 }" name="fOrder" value="${status.index+1 }" /> 삭제
		                       			</c:if>
		                       			<c:set var="fileFlag" value="N" />
	                        		</c:if>
	                        	</c:forEach>
	                        	<c:if test="${fileFlag eq 'Y' }">
	                        		<input type="file" id="file${status.index+1 }" name="file${status.index+1 }" />
	                        	</c:if>
							</td>
	                    </tr>
					</c:forEach>
                 </tbody>
            </table>
            	<div class="btn_area">
                	<input type="button" value="목록" class="r_btn_grey" style="width:70px;"  onclick="fn_list(); return false;"/>
                    <input type="button" value="완료" class="r_btn_green" style="width:70px;" onclick="fn_write(); return false;" />
                    <input type="button" value="삭제" class="r_btn_green" style="width:70px;" onclick="fn_delete(); return false;" />
                </div>
            </div>
        </div>
        </form>
    </div>


