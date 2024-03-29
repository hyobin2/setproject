<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script type="text/javascript">

	$(function () {
		var pCode = "${!empty info.pCode ? info.pCode:'POP01' }";
		$("input:radio[name='pCode']").change(function() {
			if($(this).val() == "POP01"){
				$(".pop01").show();
				$(".pop02").hide();
			}else{
				$(".pop02").show();
				$(".pop01").hide();
			}
		});
		if(pCode != ''){
			$('input:radio[name=pCode]:input[value='+pCode+']').click();
		}
	});

	function fn_write() {

		if ($('#title').val()  == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return false;
		}

		if ($('#sDate').val()  == '') {
			alert("시작일을 입력하세요.");
			$('#sDate').focus();
			return false;
		}
		if ($('#eDate').val()  == '') {
			alert("종료일을 입력하세요.");
			$('#eDate').focus();
			return false;
		}

		if($("#pCode").val() == "POP01"){
			if ($('#pWidth').val()  == '') {
				alert("팝업크기(가로)을 입력하세요.");
				$('#pWidth').focus();
				return false;
			}
			if ($('#pHeight').val()  == '') {
				alert("팝업크기(세로)을 입력하세요.");
				$('#pHeight').focus();
				return false;
			}
			if ($('#pLeft').val()  == '') {
				alert("팝업위치(가로)을 입력하세요.");
				$('#pLeft').focus();
				return false;
			}
			if ($('#pTop').val()  == '') {
				alert("팝업위치(세로)을 입력하세요.");
				$('#pTop').focus();
				return false;
			}

			if (CKEDITOR.instances.content.getData() == "") {
				alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
				$('#content').content.focus();
				return false;
			}

		}


		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}

		$('#baseForm').attr('action', '/adm/popup/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() {

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/popup/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){
		$('#baseForm').attr('action', '/adm/popup/list.do');
		$('#baseForm').submit();
	}

</script>


    <div class="s_con_area">
       	<h1>팝업관리</h1>
       	<div class="location">
       		<span>Home  &gt; 홈페이지관리 &gt; <strong>팝업관리</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/popup/proc.do" enctype="multipart/form-data" >
		<input type="hidden" name="pIdx" id="pIdx" value="${util:zeroConvert(info.pIdx) }" />
		<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
		<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />
		<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
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
                        <td><input type="text" name="title" id="title" style="width:500px" value="${info.title }" maxlength="50" /></td>
                    </tr>
            	 	<tr>
                        <th scope="row">노출일자</th>
                        <td><input type="text" name="sDate" id="sDate" class="datepicker" style="width:250px" value="${info.sDate }" readonly="readonly" />~
                        <input type="text" name=eDate id="eDate" class="datepicker" style="width:250px" value="${info.eDate }" readonly="readonly" /></td>
                    </tr>

                    <tr class="pop01">
                        <th scope="row">팝업크기</th>
                        <td>
                        	<input type="number" name="pWidth" id="pWidth" style="width:150px" value="${info.pWidth }" placeholder="넓이" /> X
                        	<input type="number" name="pHeight" id="pHeight" style="width:150px" value="${info.pHeight }" placeholder="높이"/>
                        </td>
                    </tr>
                    <tr class="pop01">
                        <th scope="row">팝업위치</th>
                        <td>
                        	x : <input type="number" name="pLeft" id="pLeft" style="width:150px" value="${info.pLeft }" placeholder="가로" />
                        	y : <input type="number" name="pTop" id="pTop" style="width:150px" value="${info.pTop }" placeholder="세로"/>
                        </td>
                    </tr>
                    <tr class="pop01">
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
                    </tr>
                    <c:forEach var="i" begin="0" end="0" varStatus="status">
					    <tr>
	                        <th scope="row"><label for="">이미지${status.index+1 }</label></th>
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




                    <tr class="pop02" style="display: none;">
                        <th scope="row">내용</th>
                        <td>
                        	<input type="text" name="spotContent" id="spotContent" style="width:500px" value="${info.spotContent }" maxlength="50" />

						</td>
                    </tr>
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


