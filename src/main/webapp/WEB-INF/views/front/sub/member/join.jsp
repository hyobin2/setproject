<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
function fn_check(){
	if(!$('input[id="agree_terms"]').prop("checked")){
		alert('이용약관에 동의해주세요.')
		return false;

	}
	if(!$('input[id="agree_privacy"]').prop("checked")){
		alert('개인정보의 수집,이용에 관한 사항에 동의해주세요.');
		return false;
	}
	location.href="/front/sub/member/join02.do"
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
						<h2>회원가입</h2>
						<div class="process">
							<ul>
								<li><span class="process01 on">Step 01 약관동의</span></li>
								<li><span class="process02">Step 02 정보입력</span></li>
								<li><span class="process03">Step 03 가입완료</span></li>
							</ul>
						</div>
						<div class="terms">
							<div class="inner">
								<div class="privacy">
									<h3>이용약관</h3>
									<div class="terms_area">
										제 1조 (목적)<br /><br />

										이 약관은 크리에에티브온디자인 회사(전자거래사업자)가 운영하는 웹사이트(이하 ‘몰’이라한다)에서 제공하는 인터넷 관련 서비스(이하 ‘서비스’라 한다)를 이용함에 있어 사이버몰과 이용자의 권리·의무 및책임사항을 규정함을 목적으로 합니다. <br />
										※ 「PC통신등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는한 이 약관을 준용합니다」제2조(정의)<br /><br />

										이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요 이용약관을 적어주세요
									</div>
									<div class="agree_terms">
										<input type="checkbox" name="" id="agree_terms"/>
										<label for="agree_terms"><span></span>이용약관에 동의합니다. <em>(필수)</em></label>
									</div>
								</div>
								<div class="privacy">
									<h3>개인정보처리방침</h3>
									<div class="terms_area">
										온디자인몰은 회원서비스 제공을 위해 귀하의 개인정보를 아래와 같이 수집합니다.<br /><br />

										1.수집 및 이용목적<br /><br />

										- 회원제 가입 서비스 제공, 이용자 식별 및 본인여부 확인<br />
										- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br />
										- 계약 이행을 위한 연락민원등 고객 고충처리<br />
										- 마케팅 활용<br /><br />

										2. 수집하는 개인정보의 항목<br /><br />

										- 이름, 아이디, 비밀번호, 휴대폰번호, 이메일주소, 주소, 성별, 생년월일<br /><br />

										3. 보유기간<br /><br />

										- 회원 탈퇴 후 : 5일 까지<br />
										- 계약 또는 청약철회 등에 관한 기록 : 5년<br />
										- 대금 결재 및 재화 등의 공급에 관한 기록 : 5년<br />
										- 소비자 불만 또는 분쟁 처리에 관한 기록 : 3년
									</div>
									<div class="agree_terms">
										<input type="checkbox" name="" id="agree_privacy"/>
										<label for="agree_privacy"><span></span>개인정보의 수집, 이용에 관한 사항에　동의합니다. <em>(필수)</em></label>
									</div>
								</div>
							</div>
						</div>
						<div class="btn">
							<a href="#" class="btn_next" onclick="fn_check()">다음으로</a><!-- 활성화시 class="on" 추가 -->
						</div>
					</div>
				</div>

			</div>
			<!-- //contents-->
