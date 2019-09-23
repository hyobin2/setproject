<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script type="text/javascript">

	$(function () {
		var pCode = "${!empty info.pCode ? info.pCode:'POP01' }";
		$("#pCode").change(function() {
			if($(this).val() == "POP02"){
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
		if($('#pIdx').val() > 0 ){
			<c:forEach var="result" items="${info.fileList}" >
				if($('#file${result.fOrder}').val()  != '' && $('#fOrder${result.fOrder}').is(":checked") != true){
					alert("기존파일${result.fOrder} 삭제 체크를 하셔야 합니다.");
					return false;
				}
			</c:forEach>
		}else{
			if ($('#file1').val()  == '') {
				alert("썸네일을 첨부하세요.");
				$('#file1').focus();
				return false;
			}
		}


		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}

		$('#baseForm').attr('action', '/adm/banner/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() {

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/banner/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){
		$('#baseForm').attr('action', '/adm/banner/list.do');
		$('#baseForm').submit();
	}
</script>


    <div class="s_con_area">
       	<h1>배너관리</h1>
       	<div class="location">
       		<span>Home  &gt; 홈페이지관리 &gt; <strong>배너관리</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/banner/proc.do" enctype="multipart/form-data" >
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

                  		<c:forEach var="i" begin="0" end="0" varStatus="status">
					    <tr>
	                        <th scope="row"><label for="">파일</label></th>
	                        <td>
	                        	<c:set var="fileFlag" value="Y" />
	                        	<c:forEach var="result" items="${info.fileList}" >
	                        		<c:if test="${status.index+1 == result.fOrder }" >
	                        			<input type="file" id="file${status.index+1 }" name="file${status.index+1 }" />
		                       			<a href="/file/download.do?fIdx=${result.fIdx}">
		                       				${result.orgFilename}
		                       			</a>
		                       			<c:if test="${util:zeroConvert(info.pIdx) > 0}" >
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
					<tr class="pop01">
                        <th scope="row">이미지 미리보기</th>
                        <td>
                        	<c:choose>
                        		<c:when test="${!empty info.fileList[0]}">
                        			<img id="foo" src="/file/viewImg.do?fIdx=${info.fileList[0].fIdx }" />
                        		</c:when>
                        		<c:otherwise>
                        			<img id="foo" src="#" style="display: none;"/>
                        		</c:otherwise>
                        	</c:choose>
                        	<br/>이미지 미리보기 영역입니다.
						<td>
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
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
	    	var reader = new FileReader();
    		reader.onload = function(e) {
	            $('#foo').attr('src', e.target.result);
    		}
    		reader.readAsDataURL(input.files[0]);
		}
	}
	$("#file1").change(function() {
	    readURL(this);
		$('#foo').show();
	});
</script>
