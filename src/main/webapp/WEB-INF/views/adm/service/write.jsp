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
		if ($('#company').val()  == '') {
			alert("기업명을 입력하세요.");
			$('#company').focus();
			return false;
		}
		if ($('#depart').val()  == '') {
			alert("부서(소속)을 입력하세요.");
			$('#depart').focus();
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

		$('#tel').val(tel);


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
		if ($('#sample6_postcode').val()==''||$('#sample6_address').val()== '' || $('#sample6_extraAddress').val() == '' || $('#sample6_detailAddress').val() == ''){
			alert('주소를 입력해주세요.')
			return false;
		}
		var address=$('#sample6_postcode').val()+','+$('#sample6_address').val()+','+$('#sample6_extraAddress').val()+','+$('#sample6_detailAddress').val()
		$('#address').val(address);
		if (CKEDITOR.instances.content.getData() == "") {
			alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
			$('#content').focus();
			return false;
		}

		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}

		$('#baseForm').attr('action', '/adm/service/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() {

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/service/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){
		$('#baseForm').attr('action', '/adm/service/list.do');
		$('#baseForm').submit();
	}


</script>


    <div class="s_con_area">
       	<h1>서비스 접수</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>서비스 접수</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/service/proc.do" enctype="multipart/form-data" >
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
	                        	<input type="text" name="title" id="title" style="width:500px" value="${info.title }" maxlength="200" />&nbsp;&nbsp;
	                        </td>
	                   	</tr>
	                   	<tr>
	                        <th scope="row">이름/기업명</th>
	                        <td colspan="3">
	                        	<input type="text" name="company" id="company" style="width:500px" value="${info.company }" maxlength="20" />
	                        </td>
	                   	</tr>
	                   	<tr>
	                        <th scope="row">연락처(휴대폰)</th>
	                        <td>
	                        	<input type="number" name="tel1" id="tel1" style="width:100px" value="${fn:split(info.tel, '-')[0] }" /> -
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
	                        		<option value="naver.com" ${fn:split(info.email,'@')[1] == 'naver.com'? 'selected="selected"':'' }>naver.com</option>
	                        		<option value="hanmail.net" ${fn:split(info.email,'@')[1] == 'hanmail.net'? 'selected="selected"':'' }>hanmail.net</option>
	                        		<option value="gmail.com" ${fn:split(info.email,'@')[1] == 'gmail.com'? 'selected="selected"':'' }>gmail.com</option>
	                        		<option value="nate.com" ${fn:split(info.email,'@')[1] == 'nate.com'? 'selected="selected"':'' }>nate.com</option>
	                        	</select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">주소</th>
	                        <td><input type="text" id="sample6_postcode" placeholder="우편번호"style="width:150px;" value="${fn:split(info.address, ',')[0]}">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"style="width:50px;" value=""><br/>
							<input type="text" id="sample6_address" placeholder="주소" style="width:150px;" value="${fn:split(info.address, ',')[1]}">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:200px;" value="${fn:split(info.address, ',')[2]}"><br/>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 400px;" value="${fn:split(info.address, ',')[3]}" >
							<input type="hidden" id="address" name="address">
							</td>
	                   	</tr>
	                   	<tr>
	                        <th scope="row">구분</th>
	                        <td>
	                        	<select name='division'>
	                        		<option value="1" ${info.division == '1'? 'selected="selected"':'' }>IDOL프로그램</option>
	                        		<option value="2" ${info.division == '2'? 'selected="selected"':'' } >test1</option>
	                        		<option value="3" ${info.division == '3'? 'selected="selected"':'' } >test2</option>
	                        	</select>
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
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    </script>