<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>

<script>
function fn_write(){
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
if ($('#tel1').val() == ''|| $('#tel2').val() == ''||$('#tel3').val() == ''){
	alert('휴대폰번호를 입력해주세요.');
	$('#tel2').focus();
	return false;
}
$('#tel').val($('#tel1').val()+'-'+$('#tel2').val()+'-'+$('#tel3').val())
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
$('#email').val(email);
var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
if (!emailRule.test($('#email').val())) {
	alert("이메일 형식을을 확인해주세요.");
	$('#email1').focus();
	return false;
}

if ($('#content').val() == '') {
	alert("작성된 내용이 없습니다. 내용을 입력하십시오.");
	$('#content').focus();
	return false;
}

if(!$('input:checkbox[id="agree"]').prop('checked')){
	alert('개인정보보호정책에 동의하여주세요.')
	return false;
}

if( !confirm("등록 하시겠습니까?") ){
	return false;
}

	$('#baseForm').attr('action', '/front/sub/customer/inquiry/proc.do');
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
							<li>고객문의</li>
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
						<a href="#">고객문의</a>
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

			<!-- contents-->
				<div id="contents">
					<form name="baseForm" id="baseForm" method="post" action="/front/sub/customer/inquiry/view.do"  >
						<div class="sub_tab_area three">
							<ul>
								<li><a href="/front/sub/customer/inquiry/list.do" class="on" >고객문의</a></li>
								<li><a href="/front/sub/customer/service/list.do" > 서비스 신청 및 접수</a></li>
								<li><a href="/front/sub/customer/location/location.do">오시는 길</a></li>
							</ul>
						</div>

						<div class="board_wrap">

							<div class="board_write">
								<div class="title">
									<h3>고객문의</h3>
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
												<div class="input"><input type="password" name="pw" id="pw" placeholder="6~16자의 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합" maxlength="16"/></div>
											</td>
											<th scope="row"><label for=""><span class="star">*</span>비밀번호 확인</label></th>
											<td>
												<div class="input"><input type="password" name="pwcheck" id="pwcheck" placeholder="입력하신 비밀번호를 한번 더 입력해 주세요 " maxlength="16"/></div>
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
																<option value="011">011</option>
																<option value="012">012</option>
																<option value="016">016</option>
																<option value="017">017</option>
																<option value="019">019</option>
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
															<div class="input"><input type="text" name="email1" id="email1"/></div>
														</li>
														<li>
															<div class="input"><input type="text" name="email2" id="email2"/></div>
														</li>
														<li>
															<input type="hidden" name="email" id="email">
															<select name="emailbox" id="emailbox">
																<option value="1">직접입력</option>
																<option value="naver.com">naver.com</option>
																<option value="hanmail.net">hanmail.net</option>
																<option value="gmail.com">gmail.com</option>
																<option value="nate.com">nate.com</option>
																<option value="paran.com">paran.com</option>
															</select>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for=""><span class="star">*</span>구분</label></th>
											<td colspan="3">
												<select name="division" id="division" style="max-width:300px;">
													<option value="기타">기타</option>
													<option value="상담 및 교육">상담 및 교육</option>
													<option value="민원신청">민원신청</option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for=""><span class="star">*</span>내용</label></th>
											<td colspan="3">
												<div class="textarea">
													<textarea name="content" id="content"></textarea>
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
																<li><a onclick="captchaRefresh(); return false;">새로고침</a></li>
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
									<a href="#" onclick="fn_write();" class="btn_style03">문의하기</a>
								</div>
							</div>

						</div>
					</form>
				</div>
			<!-- //contents-->