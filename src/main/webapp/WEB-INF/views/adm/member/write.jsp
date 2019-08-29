<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script type="text/javascript">


	function fn_delete() { // 삭제

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/member/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){ //목록
		$('#baseForm').attr('action', '/adm/member/list.do');
		$('#baseForm').submit();
	}
</script>


    <div class="s_con_area">
       	<h1>회원관리</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>회원관리</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/member/proc.do" enctype="multipart/form-data" >
		<input type="hidden" name="mIdx" id="mIdx" value="${util:zeroConvert(info.mIdx) }" />
		<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
		<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
		<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />
		<input type="hidden" name="phone" id="phone" value="${info.phone }">
      	<div class="table_area">
            <div class="">
                <table class="bbs_write" summary="글쓰기입니다. 각 항목으로는 작성자, 분류, 유형, 첨부, 제목, 내용이 있습니다.">
                    <colgroup>
                        <col width="12%">
                        <col width="*">
                    </colgroup>
            	 <tbody>
                    <tr>
                        <th scope="row">이름</th>
                        <td><input type="text" name="title" id="title" style="width:500px;" value="${info.name }" maxlength="200" readonly="readonly" />&nbsp;&nbsp;</td>
                        <th scope="row">가입일</th>
                        <td><input type="text" name="regdate" id="regdateE" style="width 500px;" value="${fn:substring(info.regDate,0,10)}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="row">ID</th>
                        <td><input type="text" name="id" id="id" style="width 200px;" value="${info.id }" readonly="readonly" /></td>
                        <th scope="row">휴대폰</th>
                        <td><input type="text" name="tel1" id="tel1" value="${fn:split(info.phone, '-')[0] }" readonly="readonly">-
                        	<input type="text" name="tel2" id="tel2" value="${fn:split(info.phone, '-')[1]}" readonly="readonly">-
                        	<input type="text" name="tel3" id="tel3" value="${fn:split(info.phone, '-')[2]}" readonly="readonly"></td>
                    </tr>
                    <tr >
                    	<th scope="row">주소</th>
                    	<td colspan="3">
                    	 	<input type="text" id="sample6_postcode" placeholder="우편번호"style="width:150px;" value="${fn:split(info.address, ',')[0]}" readonly="readonly"><br/>
							<input type="text" id="sample6_address" placeholder="주소" style="width:150px;" value="${fn:split(info.address, ',')[1]}" readonly="readonly">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:200px;" value="${fn:split(info.address, ',')[2]}" readonly="readonly" ><br/>
                    	</td>
                    </tr>
                 </tbody>
            </table>
            	<div class="btn_area">
                	<input type="button" value="목록" class="r_btn_grey" style="width:70px;"  onclick="fn_list(); return false;"/>
                    <input type="button" value="삭제" class="r_btn_green" style="width:70px;" onclick="fn_delete(); return false;" />
                </div>
            </div>
        </div>
        </form>
    </div>
