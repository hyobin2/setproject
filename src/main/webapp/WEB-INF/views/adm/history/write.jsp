<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="curYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
<script type="text/javascript">


	function fn_write() {

		if ($('#year').val()  == '') {
			alert("년도를 선택하세요.");
			$('#year').focus();
			return false;
		}
		if ($('#month').val()  == '') {
			alert("월을 선택하세요.");
			$('#month').focus();
			return false;
		}
		if ($('#hOrder').val()  == '') {
			alert("정렬순서를 입력하세요.");
			$('#hOrder').focus();
			return false;
		}
		if ($('#content').val()  == '') {
			alert("내용을 입력하세요.");
			$('#content').focus();
			return false;
		}

		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/history/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() {

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/history/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){
		$('#baseForm').attr('action', '/adm/history/list.do');
		$('#baseForm').submit();
	}

</script>


    <div class="s_con_area">
       	<h1>연혁</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>연혁</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/history/proc.do" enctype="multipart/form-data" >
		<input type="hidden" name="hIdx" id="hIdx" value="${util:zeroConvert(info.hIdx) }" />
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
                        <th scope="row">년/월</th>
                        <td>
                        	<select name="year" id="year">
                        		<c:forEach begin="2017" end="${curYear }" step="1" >
                        			<option value="${curYear }" ${curYear == info.year ? 'selected="selected"':''} >${curYear }</option>
                        			<c:set var="curYear" value="${curYear-1 }" />
                        		</c:forEach>

                        	</select>년
                        	<select name="month" id="month">
                        		<c:forEach begin="1" end="${12 }" varStatus="status">
                        			<option value="${status.index }" ${status.index == info.month ? 'selected="selected"':''}>${status.index }</option>
                        		</c:forEach>
                        	</select>월
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">정렬순서</th>
                        <td>
                        	<input type="number" name="hOrder" id="hOrder" value="${info.hOrder }" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td>
                        	<input type="text" name="content" id="content" style="width:500px" value="${info.content }" maxlength="200" />
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


