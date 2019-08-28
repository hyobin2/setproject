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
console.log('${info}');
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
                        <td><input type="text" name="title" id="title" style="width:500px;" value="${info.name }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">가입일</th>
                        <td><input type="text" name="regdate" id="regdateE" style="width 500px;" value="${info.regDate}"></td>
					</tr>
					<tr>
						<th scope="row">ID</th>
                        <td><input type="text" name="id" id="id" style="width 200px;" value="${info.id }"/></td>
                        <th scope="row">휴대폰</th>
                        <td><input type="text" name="tel1" id="tel1" value="${fn:split(info.phone, '-')[0] }">-
                        	<input type="text" name="tel2" id="tel2" value="${fn:split(info.phone, '-')[1]}">-
                        	<input type="text" name="tel3" id="tel3" value="${fn:split(info.phone, '-')[2]}"></td>
                    </tr>
                    <tr >
                    	<th scope="row">주소</th>
                    	<td colspan="3">
                    	 	<input type="text" id="sample6_postcode" placeholder="우편번호"style="width:150px;" value="${fn:split(info.address, ',')[0]}">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"style="width:50px;" value=""><br/>
							<input type="text" id="sample6_address" placeholder="주소" style="width:150px;" value="${fn:split(info.address, ',')[1]}">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:200px;" value="${fn:split(info.address, ',')[2]}"><br/>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }
</script>
