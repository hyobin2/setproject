<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script type="text/javascript">


	function fn_write() {

		if ($('#name').val()  == '') {
			alert("성명을 입력하세요.");
			$('#name').focus();
			return false;
		}

		if ($('#tel1').val() == '' || $('#tel2').val() == '' || $('#tel3').val() == '') {
			alert("연락처를 입력하세요.");
			$('#tel1').focus();
			return false;
		}

		var tel = $('#tel1').val()+"-"+$('#tel2').val()+"-"+$('#tel3').val();
		if (!isTel(tel) && !isPhone(tel)) {
			alert("연락처를 확인하세요.");
			$('#tel1').focus();
			return false;
		}


		var email = $('#email1').val()+"@"+$('#email2').val();
		if ($('#email1').val() != '' && $('#email2').val() !='') {
			if (!isEmail(email)) {
				alert("이메일 형식을을 확인해주세요.");
				$('#email').focus();
				return false;
			}
		}

		if ($('#title').val()  == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return false;
		}

		if (CKEDITOR.instances.content.getData() == "") {
			alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
			$('#content').content.focus();
			return false;
		}
		if($('#iIdx').val() > 0 ){
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
		$('#tel').val(tel);
		$('#email').val(email);

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
       	<h1>고객문의</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>고객문의</strong></span>
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
	                        <th scope="row">성명</th>
	                        <td>
	                        	<input type="text" name="name" id="name" style="width:250px" value="${info.name }" maxlength="20" />
	                        </td>
	                        <th scope="row">연락처</th>
	                        <td>
	                        	<select name="tel1" id="tel1" style="width: 100px">
	                        		<option value="010" ${fn:split(info.tel, '-')[0] == '010' ? 'selected="selected"':'' } >010</option>
	                        		<option value="011" ${fn:split(info.tel, '-')[0] == '011' ? 'selected="selected"':'' }>011</option>
	                        		<option value="016" ${fn:split(info.tel, '-')[0] == '016' ? 'selected="selected"':'' }>016</option>
	                        		<option value="017" ${fn:split(info.tel, '-')[0] == '017' ? 'selected="selected"':'' }>017</option>
	                        		<option value="018" ${fn:split(info.tel, '-')[0] == '018' ? 'selected="selected"':'' }>018</option>
	                        		<option value="019" ${fn:split(info.tel, '-')[0] == '019' ? 'selected="selected"':'' }>019</option>
	                        	</select> -
	                        	<input type="number" name="tel2" id="tel2" style="width:100px" value="${fn:split(info.tel, '-')[1] }" /> -
	                        	<input type="number" name="tel3" id="tel3" style="width:100px" value="${fn:split(info.tel, '-')[2] }" />
	                        </td>
	                   	</tr>
	                   	<tr>
	                    	<th scope="row">이메일</th>
	                        <td colspan="3">
	                        	<input type="text" name="email1" id="email1" value="${fn:split(info.email, '@')[0] }" > @
	                        	<input type="text" name="email2" id="email2" value="${fn:split(info.email, '@')[1]}">
	                        	<select name="selectEmail" id="selectEmail" style="width: 100px">
	                        		<option value="1" selected="selected">직접입력</option>
	                        		<option value="naver.com">naver.com</option>
	                        		<option value="hanmail.net">hanmail.net</option>
	                        		<option value="gmail.com">gmail.com</option>
	                        		<option value="nate.com">nate.com</option>
	                        	</select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">소속기관</th>
	                        <td>
	                        	<input type="text" name="company" id="company" style="width:250px" value="${info.company }" maxlength="20" />
	                        </td>
	                        <th scope="row">부서</th>
	                        <td>
	                        	<input type="text" name="depart" id="depart" style="width:250px" value="${info.depart }" maxlength="20" />
	                        </td>
	                   	</tr>
	                   	<tr>
	                        <th scope="row">직급</th>
	                        <td>
	                        	<input type="text" name="grade" id="grade" style="width:250px" value="${info.grade }" maxlength="20" />
	                        </td>
	                        <th scope="row">예산</th>
	                        <td>
	                        	<input type="text" name="budget" id="budget" style="width:250px" value="${info.budget }" maxlength="20" />
	                        </td>
	                   	</tr>

	                   	<tr>
                        	<th scope="row">제목</th>
	                        <td colspan="3">
	                        	<input type="text" name="title" id="title" style="width:500px" value="${info.title }" maxlength="200" />&nbsp;&nbsp;
	                        </td>
	                   	</tr>
	                    <tr>
	                        <th scope="row">문의내용</th>
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
		                        <th scope="row"><label for="">파일첨부${status.index+1 }</label></th>
		                        <td colspan="3">
		                        	<c:set var="fileFlag" value="Y" />
		                        	<c:forEach var="result" items="${info.fileList}" >
		                        		<c:if test="${status.index+1 == result.fOrder }" >
		                        			<input type="file" id="file${status.index+1 }" name="file${status.index+1 }" />
			                       			<a href="/file/download.do?fIdx=${result.fIdx}">
			                       				${result.orgFilename}
			                       			</a>
			                       			<c:if test="${util:zeroConvert(info.iIdx) > 0}" >
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
