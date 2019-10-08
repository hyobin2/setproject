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
										제1조(목적)<br/><br/>
										본 회원약관은 케이잡스(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.<br/><br/>
										제2조 (약관의 효력)<br/>
										1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.<br/>
										2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.<br/>
										3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.<br/><br/>
										제3조 (약관 이외의 준칙)<br/>
										이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.<br/><br/>
										제4조 (이용계약의 체결)<br/>
										회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.<br/><br/>
										제5조 (용어의 정의)<br/>
										이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br/>
										1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자<br/>
										2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합<br/>
										3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합<br/><br/>
										제6조 (이용신청)<br/>
										1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.<br/>
										제7조 (회원가입의 승낙)<br/>
										'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.<br/><br/>
										제8조(회원가입 신청거절 및 강제 탈퇴)<br/>
										2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수 있다.<br/><br/>
										제9조 (서비스 제공의 중지)<br/>
										'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다<br/>
										1.설비의 보수 등을 위하여 부득이한 경우 <br/>
										2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우 <br/>
										3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.<br/><br/>
										제10조 ('갑'의 의무)<br/>
										1. '갑'은  계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.<br/>
										2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.   <br/><br/>
										제11조 (개인정보보호)<br/>
										1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다. <br/>
										2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나  제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다. <br/>
										 ①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우  <br/>
										 ②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우<br/>
										 ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우<br/>
										 ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우<br/>
										3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.<br/><br/>
										제12조 (회원의 의무)<br/>
										1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.<br/>
										2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.<br/>
										3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.<br/>
										4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.<br/>
										5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다. <br/>
										  ①다른 회원의 아이디(ID)를 부정 사용하는 행위 <br/>
										  ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 <br/>
										  ③선량한 풍속, 기타 사회질서를 해하는 행위<br/>
										  ④타인의 명예를 훼손하거나 모욕하는 행위  <br/>
										  ⑤타인의 지적재산권 등의 권리를 침해하는 행위 <br/>
										  ⑥해킹행위 또는 컴퓨터바이러스의 유포행위  <br/>
										  ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위  <br/>
										  ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위<br/>
										  ⑨기타 관계법령에 위배되는 행위  <br/>
										  ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위<br/><br/>
										제13조 (게시물 또는 내용물의 삭제) <br/>
										'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.<br/><br/>
										제14조 (게시물에 대한 권리•의무)<br/>
										게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.<br/><br/>
										제15조 (양도금지)<br/>
										회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br/><br/>
										제16조 (계약해지 및 이용제한) <br/>
										1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.<br/>
										2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.<br/><br/>
										제17조 (면책•배상)<br/>
										1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,  회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있습니다.<br/>
										2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. <br/>
										3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.<br/>
										4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게  발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.<br/><br/>
										제18조 (분쟁의 해결) <br/>
										1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br/>
										2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.<br/><br/>
										부  칙<br/>
										제 1 조 (시행일) 이 약관은 2019년 09월 28일부터 시행한다.
									</div>
									<div class="agree_terms">
										<input type="checkbox" name="" id="agree_terms"/>
										<label for="agree_terms"><span></span>이용약관에 동의합니다. <em>(필수)</em></label>
									</div>
								</div>
								<div class="privacy">
									<h3>개인정보처리방침</h3>
									<div class="terms_area">
										케이잡스는 고객의 개인정보를 존중하며 소중하게 다루고 있습니다. 당사는 개인정보보호법 제30조에 따라 정보주체인 고객의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립 ․ 공개합니다.<br/><br/>
										제1조(개인정보의 처리목적)  케이잡스는 당사의 사업과 관련된 서비스의 제공, 컨설팅, 교 육 및 상담 등의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 위 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 정보주체에게 별도의 동의를 받는 등 필요한 조치를 취할 예정입니다.  <br/><br/>
										제2조(개인정보의 처리 및 보유기간)  케이잡스는 법령에 따른 개인정보 보유 ․ 이용기간 또는 당사의 사업과 관련된 서비스의 제공, 컨설팅, 교육 및 상담 등의 목적이 종결되는 시점까지 정보주체의 개인정보를 처리, 보유합니다.  <br/><br/>
										제3조(정보처리에 대한 동의거부 권리 및 불이익)  케이잡스에서 수집, 처리하는 개인정보에 대해 고객은 동의를 거부할 권리가 있으며, 다만 동의를 거부하는 경우에 관련 서비스 및 상담이 제한될 수 있습니다. <br/><br/>
										제4조(정보주체의 권리 ․ 의무 및 그 행사 방법)  정보주체는케이잡스에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.  <br/>
										1. 개인정보 열람요구<br/>
										2. 오류 등이 있을 경우 정정 요구<br/>
										3. 삭제요구<br/>
										4. 처리정지 요구<br/>
										모든 권리 행사는 케이잡스에 대해 서면, 전화, 이메일, FAX 등을 통하여 하실 수 있으며 당사는 이에 대해 곧바로 조치하겠습니다.  <br/><br/>
										제5조(처리하는 개인정보 항목)  케이잡스는 정보주체의 이름, 연락처, 이메일 등 서비스 이용이나 상담에 필요한 기초 개인정보 항목을 처리하고 있습니다.  <br/><br/>
										제6조(개인정보의 파기)  케이잡스는 사업과 관련된 서비스의 제공, 컨설팅, 교육 및 상담 등의 목적이 종결되는 즉시 지체 없이 파기합니다. 또한, 고객이 삭제 요청을 하는 경우 즉시 삭제 조치합니다.<br/>
										- 전자적 파일 형태 : 기록을 재생할 수 없도록 영구삭제 등<br/>
										- 종이 문서 : 분쇄기로 분쇄하거나 소각하여 파기  <br/><br/>
										제7조(개인정보 보호책임자) 케이잡스는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br/>
										- 개인정보보호 관리책임자<br/>
										성명 : 최시우<br/>
										소속 :경영전략기획부<br/>
										직책 :팀장<br/>
										전화 :02-6959-7658<br/>
										메일 : chois2928@hyobin.co.kr <br/>
										- 개인정보보호 담당자<br/>
										성명 : 문권홍<br/>
										소속 : 경영전략기획부<br/>
										직책 :주임<br/>
										전화 : 02-6959-8983<br/>
										메일 : mun010306@hyobin.co.kr <br/><br/>
										제8조(개인정보 처리방침 변경) 이 개인정보 처리방침은 2016. 6. 16부터 적용됩니다.  <br/><br/>
										제9조(개인정보의 안전성 확보조치) 케이잡스는 개인정보의 안전성 확보를 위해 내부관리계획 수립 ․ 시행, 직원 교육 등을 정기적으로 실시하고 있습니다. <br/><br/>
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
