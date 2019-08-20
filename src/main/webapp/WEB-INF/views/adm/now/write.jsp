<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script type="text/javascript">


	function fn_write() {

		if ($('#title').val()  == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return false;
		}
		if ($('#url').val()  == '') {
			alert("URL을 입력하세요.");
			$('#url').focus();
			return false;
		}
		if($('#bIdx').val() > 0 ){
			<c:forEach var="result" items="${info.fileList}" >
				if($('#file${result.fOrder}').val()  != '' && $('#fOrder${result.fOrder}').is(":checked") != true){
					alert("기존파일${result.fOrder} 삭제 체크를 하셔야 합니다.");
					return false;
				}
			</c:forEach>
		}
		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/now/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() {

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/now/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){
		$('#baseForm').attr('action', '/adm/now/list.do');
		$('#baseForm').submit();
	}

</script>


    <div class="s_con_area">
       	<h1>Now</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>Now</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/now/proc.do" enctype="multipart/form-data" >
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
                    </tr>
                    <tr>
                        <th scope="row">URL</th>
                        <td><input type="text" name="url" id="url" style="width:500px" value="${info.url }" maxlength="200" />&nbsp;&nbsp;</td>
                    </tr>
                    <%-- <tr>
                        <th scope="row">내용</th>
                        <td>
                        	<textarea name="content" id="content" class="form-control">${info.content }</textarea>
                            <script type="text/javascript">
								CKEDITOR.replace('content', {
									customConfig: '/resources/ckeditor/config.js',
									filebrowserUploadUrl: '/editor/ck/imageUpload.do'
								});
							</script>
						</td>
                    </tr> --%>

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


