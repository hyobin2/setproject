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
		if($('#url').val()==''){
			alert("홈페이지 주소을 입력하세요")
			$('#url').focus();
			return false;
		}
		if ($('#company').val()  == '') {
			alert("회사명을 입력하세요.");
			$('#company').focus();
			return false;
		}
		if($('#sales').val()==''){
			alert("매출액을 입력하세요")
			$('#sales').focus();
			return false;
		}
		if ($('#division').val()  == '') {
			alert("업종을 선택해주세요.");
			$('#division').focus();
			return false;
		}
		if($('#business').val()==''){
			alert("주요 사업내용을 입력해주세요")
			$('#business').focus();
			return false;
		}
		if ($('#however').val()  == '') {
			alert("설립일을 입력하세요.");
			$('#however').focus();
			return false;
		}
		if($('#area').val()==''){
			alert("지역을 선택해주세요")
			$('#area').focus();
			return false;
		}
		if ($('#address').val()  == '') {
			alert("주소를 입력해주세요.");
			$('#address').focus();
			return false;
		}
		if($('#duty').val()==''){
			alert("채용직무를 선택해주세요")
			$('#duty').focus();
			return false;
		}
		if ($('#personnel').val()  == '') {
			alert("모집인원을 입력하세요.");
			$('#personnel').focus();
			return false;
		}
		if($('#task').val()==''){
			alert("담당업무를 선택해주세요")
			$('#task').focus();
			return false;
		}
		if ($('#apply').val()  == '') {
			alert("지원방법을 입력해주세요.");
			$('#apply').focus();
			return false;
		}
		if($('#education').val()==''){
			alert("학력을 입력해주세요")
			$('#education').focus();
			return false;
		}
		if ($('#career').val()  == '') {
			alert("경력을 입력해주세요");
			$('#career').focus();
			return false;
		}
		if($('#employ').val()==''){
			alert("고용형태를 입력해주세요")
			$('#employ').focus();
			return false;
		}
		if ($('#work').val()  == '') {
			alert("근무형태를 입력해주세요");
			$('#work').focus();
			return false;
		}
		if ($('#salary').val()  == '') {
			alert("연봉을 선택해주세요");
			$('#salary').focus();
			return false;
		}

		if($('#sample6_postcode').val()==''||$('#sample6_address').val()==''||$('#sample6_detailAddress').val()==''){
			alert("근무지를 입력해주세요")
			$('#workplace').focus();
			return false;
		}
		var address=$('#sample6_postcode').val()+','+$('#sample6_address').val()+','+$('#sample6_detailAddress').val()
		$('#workplace').val(address);
		if($('#preferential').val()==''){
			alert("우대사항을 입력해주세요")
			$('#preferential').focus();
			return false;
		}
		if($('#sDate').val()==''){
			alert("등록일을 입력해주세요")
			$('#sDate').focus();
			return false;
		}
		if($('#eDate').val()==''){
			alert("마감일을 입력해주세요")
			$('#eDate').focus();
			return false;
		}
		if($('#sDate').val()>$('#eDate').val()){
			alert("등록일과 마감일을 확인해주세요")
			$('#sDate').focus();
			return false;
		}
		if($('#regName').val()==''){
			alert("작성자를 입력해주세요")
			$('#regName').focus();
			return false;
		}
		if (CKEDITOR.instances.content.getData() == "") {
			alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
			$('#content').focus();
			return false;
		}

		if($('#hIdx').val() > 0 ){
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

		$('#baseForm').attr('action', '/adm/hire/proc.do');
		$('#baseForm').submit();

	}

	function fn_delete() { // 삭제

		if( !confirm("삭제 하시겠습니까?") ){
			return false;
		}
		$('#baseForm').attr('action', '/adm/hire/delete.do');
		$('#baseForm').submit();
	}

	function fn_list(){ //목록
		$('#baseForm').attr('action', '/adm/hire/list.do');
		$('#baseForm').submit();
	}

</script>


    <div class="s_con_area">
       	<h1>케이잡스 활동</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>케이잡스 활동</strong></span>
       	</div>
      	<form name="baseForm" id="baseForm" method="post" action="/adm/hire/proc.do" enctype="multipart/form-data" >
		<input type="hidden" name="hIdx" id="hIdx" value="${util:zeroConvert(info.hIdx) }" />
		<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
		<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
		<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />
		<input type="hidden" name="workplace" id="workplace">
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
                        <td><input type="text" name="title" id="title" style="width:300px" value="${info.title }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">홈페이지주소</th>
                        <td colspan="3"><input type="text" name="url" id="url" style="width:300px" value="${info.url}" maxlength="200"></td>
                    </tr>
                    <tr>
                        <th scope="row">회사명</th>
                        <td><input type="text" name="company" id="company" style="width:300px" value="${info.company }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">매출액</th>
                        <td colspan="3"><input type="number" name="sales" id="sales" style="width:300px" value="${info.sales }" maxlength="200"></td>
                    </tr>
                    <tr>
                        <th scope="row">구분</th>
                        <td>
                        	<select name="division" id="division" style="width:150px;">
                        		<option value="서비스" ${info.division == '서비스'? 'selected="selected"':'' }>서비스업</option>
                        		<option value="교육" ${info.division == '교육'? 'selected="selected"':'' }>교육업</option>
                        		<option value="금융" ${info.division == '금융'? 'selected="selected"':'' }>금융/은행업</option>
                        		<option value="기관" ${info.division == '기관'? 'selected="selected"':'' }>기관/협회</option>
                        		<option value="건설" ${info.division == '건설'? 'selected="selected"':'' }>건설업</option>
                        		<option value="판매" ${info.division == '판매'? 'selected="selected"':'' }>판매/유통업</option>
                        		<option value="문화" ${info.division == '문화'? 'selected="selected"':'' }>문화/예술/디자인업</option>
                        		<option value="의료" ${info.division == '의료'? 'selected="selected"':'' }>의료/제약업</option>
                        		<option value="IT" ${info.division == 'IT'? 'selected="selected"':'' }>IT/정보통신업</option>
                        		<option value="미디어" ${info.division == '미디어'? 'selected="selected"':'' }>미디어/광고업</option>
                        		<option value="제조" ${info.division == '제조'? 'selected="selected"':'' }>제조/생산/화학업</option>
                        	</select>
                        </td>
                        <th scope="row">주요사업내용</th>
                        <td><input type="text" name="business" id="business" style="width:100px" value="${info.business }" maxlength="200"></td>
                        <th scope="row">설립일</th>
                        <td><input type="text" name="however" id="however" class="datepicker" style="width:100px" value="${info.however }" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <th scope="row">지역</th>
                        <td>
                        	<select name="area" id="area">
                        		<option value="서울" ${info.area == '서울'? 'selected="selected"':'' }>서울</option>
                        		<option value="경기" ${info.area == '경기'? 'selected="selected"':'' }>경기</option>
                        		<option value="인천" ${info.area == '인천'? 'selected="selected"':'' }>인천</option>
                        		<option value="대전" ${info.area == '대전'? 'selected="selected"':'' }>대전</option>
                        		<option value="세종" ${info.area == '세종'? 'selected="selected"':'' }>세종</option>
                        		<option value="충남" ${info.area == '충남'? 'selected="selected"':'' }>충남</option>
                        		<option value="충북" ${info.area == '충북'? 'selected="selected"':'' }>충북</option>
                        		<option value="광주" ${info.area == '광주'? 'selected="selected"':'' }>광주</option>
                        		<option value="전남" ${info.area == '전남'? 'selected="selected"':'' }>전남</option>
                        		<option value="전북" ${info.area == '전북'? 'selected="selected"':'' }>전북</option>
                        		<option value="대구" ${info.area == '대구'? 'selected="selected"':'' }>대구</option>
                        		<option value="경북" ${info.area == '경북'? 'selected="selected"':'' }>경북</option>
                        		<option value="부신" ${info.area == '부산'? 'selected="selected"':'' }>부산</option>
                        		<option value="경남" ${info.area == '경남'? 'selected="selected"':'' }>경남</option>
                        		<option value="강원" ${info.area == '강원'? 'selected="selected"':'' }>강원</option>
                        		<option value="제주" ${info.area == '제주'? 'selected="selected"':'' }>제주</option>
                        	</select>
                        </td>
                        <th scope="row">주소</th>
                        <td colspan="3"><input type="text" name="address" id="address" style="width:300px" value="${info.address }" maxlength="200" placeholder="ex)서울특별시 강남구 대치동 "></td>
                    </tr>
                    <c:forEach var="i" begin="0" end="0" varStatus="status">
					    <tr>
	                        <th scope="row"><label for="">로고등록</label></th>
	                        <td colspan="5">
	                        	<c:set var="fileFlag" value="Y" />
	                        	<c:forEach var="result" items="${info.fileList}" >
	                        		<c:if test="${status.index+1 == result.fOrder }" >
	                        			<input type="file" id="file${status.index+1 }" name="file${status.index+1 }" />
		                       			<a href="/file/download.do?fIdx=${result.fIdx}">
		                       				${result.orgFilename}
		                       			</a>
		                       			<c:if test="${util:zeroConvert(info.hIdx) > 0}" >
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
					<tr>
					<td colspan="5"></td>
					</tr>
					 <tr><!-- ################################################################################################################### -->
                        <th scope="row">채용직무</th>
                        <td><input type="text" name="duty" id="duty" style="width:300px" value="${info.duty }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">모집인원</th>
                        <td colspan="3"><input type="number" name="personnel" id="personnel" style="width:100px" value="${info.personnel }" maxlength="200">명</td>
                    </tr>
                     <tr>
                        <th scope="row">담당업무</th>
                        <td><input type="text" name="task" id="task" style="width:300px" value="${info.task }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">지원방법</th>
                        <td colspan="3"><input type="text" name="apply" id="apply" style="width:300px" value="${info.apply }" maxlength="200"></td>
                    </tr>
                    <tr>
                        <th scope="row">학력</th>
                        <td><input type="text" name="education" id="education" style="width:300px" value="${info.education }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">경력</th>
                        <td colspan="3"><input type="text" name="career" id="career" style="width:300px" value="${info.career }" maxlength="200"></td>
                    </tr>
                    <tr>
                        <th scope="row">고용형태</th>
                        <td><input type="text" name="employ" id="employ" style="width:300px" value="${info.employ }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">근무형태</th>
                        <td colspan="3"><select name="work" id="work">
                        					<option value="정규직" ${info.work == '정규직'? 'selected="selected"':'' }>정규직</option>
                        					<option value="계약직" ${info.work == '계약직'? 'selected="selected"':'' }>계약직</option>
                        					<option value="파견직" ${info.work == '파견직'? 'selected="selected"':'' }>파견직</option>
                        				</select></td>
                    </tr>
                    <tr>
                        <th scope="row">자격면허</th>
                        <td><input type="text" name="certificate" id="certificate" style="width:300px" value="${info.certificate }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">연봉</th>
                        <td colspan="3"><select name="salary" id="salary" style="width: 200px">
                							<option value="2000" ${info.salary == '2000'? 'selected="selected"':'' }>2000이하</option>
                							<option value="2499" ${info.salary == '2499'? 'selected="selected"':'' }>2000~2500미만</option>
                							<option value="2999" ${info.salary == '2999'? 'selected="selected"':'' } >2500~3000미만</option>
                							<option value="3499" ${info.salary == '2349'? 'selected="selected"':'' }>3000~3500미만</option>
                							<option value="4999" ${info.salary == '4999'? 'selected="selected"':'' }>3500~5000미만</option>
                							<option value="5000" ${info.salary == '5000'? 'selected="selected"':'' }>5000이상</option>
				                        </select></td>
                    </tr>
                      <tr>
                        <th scope="row">근무지</th>
                        <td colspan="5">
                        	<input type="text" id="sample6_postcode" placeholder="우편번호" style="width: 100px" readonly="readonly" value="${fn:split(info.workplace, ',')[0]}">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>
							<input type="text" id="sample6_address" placeholder="주소" style="width: 1000px" readonly="readonly" value="${fn:split(info.workplace, ',')[1]}"><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 1000px" value="${fn:split(info.workplace, ',')[2]}">
                        </td>
                         <tr>
                        <th scope="row">우대사항</th>
                        <td colspan="5"><input type="text" name="preferential" id="preferential" style="width:1000px" value="${info.preferential }" maxlength="200" />&nbsp;&nbsp;</td>
                    </tr>
                     <tr>
                        <th scope="row">등록/마감일</th>
                        <td><input type="text" name="sDate" id="sDate" class="datepicker" style="width:100px" value="${info.sDate }" readonly="readonly" />~
                        	<input type="text" name="eDate" id="eDate" class="datepicker" style="width:100px" value="${info.eDate }" readonly="readonly" /></td>
                        <th scope="row">작성자</th>
                        <td colspan="3"><input type="text" name="regName" id="regName" style="width:300px" value="${info.regName }" maxlength="200"></td>
                    </tr>
                     <tr>
                        <th scope="row">워크넷주소입력</th>
                        <td><input type="text" name="wurl" id="wurl" style="width:300px" value="${info.wurl }" maxlength="200" />&nbsp;&nbsp;</td>
                        <th scope="row">사람인주소입력</th>
                        <td colspan="3"><input type="text" name="surl" id="surl" style="width:300px" value="${info.surl }" maxlength="200"></td>
                    </tr>

                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="5">
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

