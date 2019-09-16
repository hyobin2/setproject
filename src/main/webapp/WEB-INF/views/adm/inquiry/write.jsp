<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script type="text/javascript">


	function fn_write() {

		if(!$('input:radio[name=replyYn]').is(':checked')){
			alert("답변여부를 선택하세요.");
			$('#replyYn01').focus();
			return false;
		}
		if ($('#title').val()  == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return false;
		}
		if ($('#company').val()  == '') {
			alert("기업명을 입력하세요.");
			$('#company').focus();
			return false;
		}

		if ($('#name').val()  == '') {
			alert("성명을 입력하세요.");
			$('#name').focus();
			return false;
		}

		if ($('#email1').val() == '' || $('#email2').val() == '') {
			alert("이메일을 입력해주세요.");
			$('#email1').focus();
			return false;
		}

		var email = $('#email1').val()+"@"+$('#email2').val();

		if (!isEmail(email)) {
			alert("이메일 형식을을 확인해주세요.");
			$('#email').focus();
			return false;
		}

		$('#email').val(email);

		if (CKEDITOR.instances.content.getData() == "") {
			alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
			$('#content').focus();
			return false;
		}

		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}

		$('#baseForm').attr('action', '/adm/inquiry/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() {

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/inquiry/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){
		$('#baseForm').attr('action', '/adm/inquiry/list.do');
		$('#baseForm').submit();
	}

</script>


    <div class="s_con_area">
       	<h1>고객문의(Q&#38;A)</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>고객문의(Q&#38;A)</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/inquiry/proc.do" enctype="multipart/form-data" >
		<input type="hidden" name="iIdx" id="iIdx" value="${util:zeroConvert(info.iIdx) }" />
		<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
		<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
		<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />
		<input type="hidden" name="tel" id="tel" value="${paramMap.tel }"/>
		<input type="hidden" name="email" id="email" value="${paramMap.email }"/>
      	<div class="table_area">
            <div class="">
                <table class="bbs_write" summary="글쓰기입니다. 각 항목으로는 작성자, 분류, 유형, 첨부, 제목, 내용이 있습니다.">
                    <colgroup>
                        <col width="12%">
                        <col width="*">
                        <col width="12%">
                        <col width="*">
                    </colgroup>
            	 	<tbody>
	                    <tr>
	                        <th scope="row">답변여부</th>
	                        <td colspan="3">
	                        	<input type="radio" name="replyYn" id="replyYn01" ${info.replyYn == 'Y'? 'checked="checked"':'' } value="Y" /> 답변&nbsp;&nbsp;
                        		<input type="radio" name="replyYn" id="replyYn02" ${info.replyYn == 'N'? 'checked="checked"':'' } value="N" /> 미답변 &nbsp;&nbsp;
	                        </td>
	                   	</tr>
	                   	<tr>
                        	<th scope="row">제목</th>
	                        <td colspan="3">
	                        	<input type="text" name="title" id="title" style="width:500px" value="${info.title }" maxlength="200" readonly="readonly" />&nbsp;&nbsp;
	                        </td>
	                   	</tr>
	                   	<tr>
	                        <th scope="row">성명</th>
	                        <td>
	                        	<input type="text" name="company" id="company" style="width:250px" value="${info.company }" maxlength="20" readonly="readonly"/>
	                        </td>
	                   	</tr>
	                   	<tr>
	                    	<th scope="row">이메일</th>
	                        <td colspan="3">
	                        	<input type="text" name="email1" id="email1" value="${fn:split(info.email, '@')[0] }" readonly="readonly"> @
	                        	<input type="text" name="email2" id="email2" value="${fn:split(info.email, '@')[1]}" readonly="readonly">
	                        	<select name="selectEmail" id="selectEmail" style="width: 100px" disabled="disabled">
	                        		<option value="1" selected="selected" >직접입력</option>
	                        		<option value="naver.com">naver.com</option>
	                        		<option value="hanmail.net">hanmail.net</option>
	                        		<option value="gmail.com">gmail.com</option>
	                        		<option value="nate.com">nate.com</option>
	                        		<option value="paran.com">woori.com</option>
	                        	</select>
	                        </td>
	                    </tr>

	                    <tr>
	                        <th scope="row">문의내용</th>
	                        <td colspan="3">
	                        	<textarea name="content" id="content" class="form-control" readonly="readonly">${info.content }</textarea>
	                            <script type="text/javascript">
									CKEDITOR.replace('content', {
										customConfig: '/resources/ckeditor/config.js',
										filebrowserUploadUrl: '/editor/ck/imageUpload.do'
									});
								</script>
							</td>
	                    </tr>
	                    <tr>
	                    	<th scope="row">답변</th>
	                    	<td colspan="3">
	                    		<textarea name="answer" id="answer" class="form-control">${info.answer }</textarea>
	                    		  <script type="text/javascript">
									CKEDITOR.replace('answer', {
										customConfig: '/resources/ckeditor/config.js',
										filebrowserUploadUrl: '/editor/ck/imageUpload.do'
									});
								</script>
	                    	</td>
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
