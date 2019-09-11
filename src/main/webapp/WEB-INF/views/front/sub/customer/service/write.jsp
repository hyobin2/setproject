<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script>
function fn_write() {

		if ($('#title').val()  == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return false;
		}
		if ($('#company').val()  == '') {
			alert("이름/기업명을 입력하세요.");
			$('#company').focus();
			return false;
		}

		if ($('#pw').val() == ''){
			alert('비밀번호를 입력해주세요.');
			$('#pw').focus();
			return false;
		}
		if ($('#pwcheck').val()!=$('#pw').val()){
			alert('비밀번호가 일치하지않습니다.');
			$('#pw').focus();
			return false;
		}
		var regex = /^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!regex.test($('#pw').val())){
			alert('비밀번호를 확인해주세요.');
			$('#pw').focus();
			return false;
		}

		if ($('#tel1').val() == '' || $('#tel2').val() == '' || $('#tel3').val() == '') {
			alert("연락처를 입력하세요.");
			$('#tel1').focus();
			return false;
		}

		var tel = $('#tel1').val()+"-"+$('#tel2').val()+"-"+$('#tel3').val();
		$('#tel').val(tel);
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		if(!regExp.test($('input[id="tel"]').val())){
			alert('휴대폰번호를 확인해주세요.');
			$('#tel2').focus();
			return false;
		}

		if ($('#email1').val() == '' || $('#email2').val() == '') {
			alert("이메일을 입력해주세요.");
			$('#email1').focus();
			return false;
		}

		var email = $('#email1').val()+"@"+$('#email2').val();
		$('#email').val(email)
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!emailRule.test($('#email').val())) {
			alert("이메일 형식을을 확인해주세요.");
			$('#email1').focus();
			return false;
		}

		$('#email').val(email);

		if ($('#sample6_postcode1').val()==''|| $('#sample6_detailAddress').val() == ''){
			alert('주소를 확인해주세요.')
			return false;
		}
		var address=$('#sample6_postcode').val()+','+$('#sample6_detailAddress').val()
		$('#address').val(address);

		if($('#division').val()=='1'){
			alert('서비스 구분을 선택해주세요')
			return false;
		}
		if ($('#content').val() == "") {
			alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
			$('#content').focus();
			return false;
		}
		if ($('#captcha').val()  == '') {
			alert("보안문자를 입력하세요.");
			$('#captcha').focus();
			return false;
		}
		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}

		$('#baseForm').attr('action', '/front/sub/customer/service/proc.do');
		$('#baseForm').submit();

	}
	</script>
			<!-- sub_top -->
			<div class="sub_top sub_top05">
				<div class="inner">
					<h2>고객지원</h2>
					<p>케이잡스는 고객 만족을 위해 최선을 다합니다.</p>
					<div class="path">
						<ul>
							<li>Home</li>
							<li>고객지원</li>
							<li>서비스 신청 및 접수</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //sub_top -->

			<div class="mobile_path">
				<ul>
					<li><a href="/">HOME</a></li>
					<li>
						<a href="#">고객지원</a>
						<div class="path_list">
							<ul>
								<li><a href="/front/sub/kjobs/greetings.do">K·Jobs</a></li>
								<li><a href="/front/sub/business/business01_01.do">사업분야</a></li>
								<li><a href="/front/sub/cummunity/activity/list.do">커뮤니티</a></li>
								<li><a href="/front/sub/incruit/list.do">채용정보</a></li>
								<li><a href="/front/sub/customer/inquiry/list.do">고객지원</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#">서비스 신청 및 접수</a>
						<div class="path_list">
							<ul>
								<li><a href="/front/sub/customer/inquiry/list.do">고객문의</a></li>
								<li><a href="/front/sub/customer/service/list.do">서비스 신청 및 접수</a></li>
								<li><a href="/front/sub/customer/location/location.do">오시는길</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<form name="baseForm" id="baseForm" method="post" action="/front/sub/cummunity/inquiry/view.do">
			<!-- contents-->
				<div id="contents">

					<div class="sub_tab_area three">
						<ul>
							<li><a href="../inquiry/list.do">고객문의</a></li>
							<li><a href="../service/list.do" class="on">서비스 신청 및 접수</a></li>
							<li><a href="../location/location.do">오시는 길</a></li>
						</ul>
					</div>

					<div class="board_wrap">

						<div class="board_write">
							<div class="title">
								<h3>케이잡스 서비스 신청 및 접수</h3>
								<p>아래 내용으로 접수해 주시면 빠른 시일내에 상담해 드리겠습니다.</p>
							</div>
							<p class="require"><span>*</span>필수입력사항</p>
							<div class="table_write">
								<table>
									<caption class="hide"></caption>
									<colgroup>
										<col style="width:15%" />
										<col style="width:35%" />
										<col style="width:15%" />
										<col style="width:35%" />
									</colgroup>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>제목</label></th>
										<td colspan="3">
											<div class="input"><input type="text" name="title" id="title"/></div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>이름/기업명</label></th>
										<td colspan="3">
											<div class="input" style="max-width:300px;"><input type="text" name="company" id="company"/></div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>비밀번호</label></th>
										<td>
											<div class="input"><input type="password" name="pw" id="pw" placeholder="6~16자의 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합" /></div>
										</td>
										<th scope="row"><label for=""><span class="star">*</span>비밀번호 확인</label></th>
										<td>
											<div class="input"><input type="password" name="pwcheck" id="pwcheck" placeholder="입력하신 비밀번호를 한번 더 입력해 주세요 " /></div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>휴대폰번호</label></th>
										<td colspan="3">
											<div class="tel">
												<ul>
													<li>
													<input type="hidden" name="tel" id="tel">
														<select name="tel1" id="tel1" style="max-width:150px;">
															<option value="010">010</option>
														</select>
													</li>
													<li>
														<div class="input"><input type="text" name="tel2" id="tel2" maxlength="4"/></div>
													</li>
													<li>
														<div class="input"><input type="text" name="tel3" id="tel3" maxlength="4"/></div>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>이메일</label></th>
										<td colspan="3">
											<div class="email">
												<ul>
													<li>
														<input type="hidden" name="email" id="email">
														<div class="input"><input type="text" name="email1" id="email1"/></div>
													</li>
													<li>
														<div class="input"><input type="text" name="email2" id="email2"/></div>
													</li>
													<li>
														<select name="emailbox" id="emailbox">
															<option value="1">직접입력</option>
															<option value="naver.com">naver.com</option>
															<option value="hanmail.net">hanmail.net</option>
															<option value="gmail.com">gmail.com</option>
															<option value="nate.com">nate.com</option>
														</select>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>주소</label></th>
										<td colspan="3">
											<div class="zipcode">
												<ul>
													<li>
														<div class="input" style="width:90px"><input type="text" name="sample6_postcode1" id="sample6_postcode1" readonly="readonly"/></div>
													</li>
													<li>
														<div class="input" style="width:90px"><input type="text" name="sample6_postcode2" id="sample6_postcode2" readonly="readonly"/></div>
													</li>
													<li><a style="width:90px" onclick="sample6_execDaumPostcode()">주소찾기</a></li>
													<li class="long">
														<div class="input"><input type="text" name="sample6_detailAddress" id="sample6_detailAddress"/></div>
														<input type="hidden" name="address" id="address">
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>구분</label></th>
										<td colspan="3">
											<select name="division" id="division" style="max-width:300px;">
												<option value="1">신청하실 서비스를 선택해 주세요.</option>
												<option value="아이돌">IDOL프로그램</option>
		                        				<option value="채용">채용지원서비스</option>
		                        				<option value="기업">기업교육컨설팅</option>
		                        				<option value="집단">집단 상담 프로그램</option>
		                        				<option value="취업">취업 성공 패키치</option>
		                        				<option value="인생">인생 이모작</option>
		                        				<option value="청년">청년내일 채움공제</option>
		                        				<option value="민간">민간전직서비스</option>
		                        				<option value="공공">공공전직서비스</option>
		                        				<option value="회의">회의/포럼세미나</option>
		                        				<option value="박람회">박람회/워크샾/컨벤션</option>
		                        				<option value="학교">학교교육 컨설팅</option>
		                        				<option value="기업">기업교육 컨설팅</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>내용</label></th>
										<td colspan="3">
											<div class="textarea">
												<textarea id="content" name="content"></textarea>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for=""><span class="star">*</span>자동입력방지</label></th>
										<td colspan="3">
											<div class="capcha">
												<div class="img"><img id="captchaImg" src="/captcha" alt="캡챠이미지"/></div>
												<div class="txt">
													<div class="form">
														<ul>
															<!-- <li><a href="#">숫자음성듣기</a></li> -->
															<li><a href="#" onclick="captchaRefresh(); return false;" >새로고침</a></li>
														</ul>
														<div><input type="text" name="captcha" id="captcha"/></div>
													</div>
													<p>자동등록방지 숫자를 순서대로 입력하세요.</p>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="agree">
								<input type="checkbox" name="" id="agree"/>
								<label for="agree">개인정보보호정책에 동의합니다.</label>
								<a href="#" class="open_agree_terms">자세히보기</a>
							</div>
						</div>

						<div class="btn_group">
							<div class="center">
								<a href="#" class="btn_style03" onclick="fn_write();">서비스 신청하기</a>
							</div>
						</div>

					</div>

				</div>
			</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode1').value = data.postcode1;
                document.getElementById('sample6_postcode2').value = data.postcode2;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    $('#emailbox').change(function(){
		$("#emailbox option:selected").each(function () {
			if($(this).val()== '1'){ //직접입력일 경우
				$("#email2").val(''); //값 초기화
				$("#email2").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				$("#email2").val($(this).text()); //선택값 입력
				$("#email2").attr("disabled",true); //비활성화
			}
		});
	});
</script>