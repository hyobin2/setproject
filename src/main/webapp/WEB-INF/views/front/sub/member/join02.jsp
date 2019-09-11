<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
function check_join(){
if ($('#id').val()  == '') {
			alert("아이디를 입력하세요.");
			$('#id').focus();
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
		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!regex.test($('#pw').val())){
			alert('비밀번호를 확인해주세요.');
			$('#pw').focus();
			return false;
		}
		if($('#name').val()==''){
			alert('이름을 입력해주세요.');
			$('#name').focus();
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


		if ($('#sample6_postcode').val()==''|| $('#detailAddress').val() == ''){
			alert('주소를 확인해주세요.')
			return false;
		}
		var address=$('#sample6_postcode').val()+','+$('#detailAddress').val()
		$('#address').val(address);

		if ($('#captcha').val()  == '') {
			alert("보안문자를 입력하세요.");
			$('#captcha').focus();
			return false;
		}

		if($('#idcheck').val()==''){
			alert('아이디 중복확인을 해주세요.');
			return false;

		}

		if( !confirm("회원가입을 하시겠습니까?") ){
			return false;
		}

		$('#baseForm').attr('action', '/front/sub/member/proc.do');
		$('#baseForm').submit();

	}

	function checkId(){
		var params = {'id':$('#id').val()}
		$.ajax({
	        url: "/front/sub/member/checkMember.do",
	        type: "post",
	        data: JSON.stringify(params),
	        contentType: "application/json; charset=utf-8;",
	        dataType: "html",
	        success: function(data){
	        	if(data =='N'){
	        		alert("사용가능한 아이디 입니다.");
	        		$('#idcheck').val('e');
				}else{
					alert("사용할수 없는 아이디 입니다.");
					$('#id').val('');
				}
			},
			error:function(error){
				//alert(error)
			}
	    });
	}

</script>
			<div id="contents">

				<div class="login_wrap" style="max-width:none;">
					<div class="path">
						<ul>
							<li>Home</li>
							<li>회원가입</li>
						</ul>
					</div>
					<div class="join_form">
					<form id="baseForm" name="baseForm" method="post" action="/front/sub/member/join.do" >
						<h2>회원가입</h2>
						<div class="process">
							<ul>
								<li><span class="process01 on">Step 01 약관동의</span></li>
								<li><span class="process02 on">Step 02 정보입력</span></li>
								<li><span class="process03">Step 03 가입완료</span></li>
							</ul>
						</div>
						<div class="join_forms">
							<div class="inner">
								<ul>
									<li>
										<label for="">아이디</label>
										<div class="input2"><input type="text" name="id" id="id"/></div>
										<a href="#" class="btn" onclick="checkId()">중복확인</a>
										<input type="hidden" id="idcheck" name="idcheck">
									</li>
									<li>
										<label for="">비밀번호</label>
										<div class="input"><input type="password" name="pw" id="pw" placeholder="8-15자리의 영문/숫자/특수문자를 함께 입력해주세요"/></div>
									</li>
									<li>
										<label for="">비밀번호 확인</label>
										<div class="input"><input type="password" name="pwcheck" id="pwcheck" placeholder="입력하신 비밀번호를 다시한번 입력 해주세요."/></div>
									</li>
									<li>
										<label for="">이름</label>
										<div class="input"><input type="text" name="name" id="name" placeholder=""/></div>
									</li>
									<li>
										<label for="">이메일</label>
										<div class="email">
										<input type="hidden" name="email" id="email">
											<ul>
												<li>
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
									</li>
									<li>
									<input type="hidden" name="tel" id="tel">
										<label for="">휴대폰 번호</label>
										<div class="tel">
											<ul>
												<li>
													<select name="tel1" id="tel1">
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
									</li>
									<li>
									<input type="hidden" name="address" id="address"/>
										<label for="">주소</label>
										<div class="zipcode">
											<ul>
												<li style="max-width:300px">
													<div class="input2"><input type="text" name="sample6_postcode" id="sample6_postcode" readonly="readonly"/></div>
													<a  class="btn" onclick="sample6_execDaumPostcode()">주소찾기</a>
												</li>
												<li>
													<div class="input"><input type="text" name="sample6_address" id="sample6_address" readonly="readonly"/></div>
												</li>
												<li>
													<div class="input"><input type="text" name="detailAddress" id="detailAddress" placeholder="나머지 주소를 입력해 주세요."/></div>
												</li>
											</ul>
										</div>
									</li>
									<li>
										<label for="">마케팅 정보 수신동의 <span>(선택)</span></label>
										<div class="marketing">
											<dl>
												<dt>
													<input type="checkbox" name="" id="total"/>
													<label for="total"><span></span>전체동의</label>
												</dt>
												<dd>
													<input type="checkbox" name="" id="marketing01"/>
													<label for="marketing01"><span></span>E-mail을 이용한 정보 수신에 동의합니다. </label>
												</dd>
											</dl>
										</div>
									</li>
									<li>
										<label for="">보안문자 입력</label>
										<div class="capcha">
											<ul>
												<li><div class="img"><img id="captchaImg" src="/captcha" /></div></li>
												<!-- <li><a href="#">소리듣기</a></li> -->
												<li><a onclick="captchaRefresh(); return false;">새로고침</a></li>
											</ul>
											<div class="input"><input type="text" name="captcha" id="captcha" placeholder="보안문자를 정확히 입력해 주세요."/></div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="btn">
							<a href="#" class="btn_next" onclick="check_join()">가입하기</a><!-- 활성화시 class="on" 추가 -->
						</div>
					</form>
					</div>
				</div>

			</div>
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

                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
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