<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">


	function fn_write() {

		if ($('#name').val()  == '') {
			alert("이름을 입력하세요.");
			$('#name').focus();
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


		var email = $('#email1').val()+"@"+$('#email2').val();
		if ($('#email1').val() != '' && $('#email2').val() !='') {
			if (!isEmail(email)) {
				alert("이메일 형식을을 확인해주세요.");
				$('#email').focus();
				return false;
			}
		}

		if ($('#title').val()  == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return false;
		}
		if ($('#content').val()  == '') {
			alert("내용을 입력하세요.");
			$('#content').focus();
			return false;
		}
		if ($('#captcha').val()  == '') {
			alert("보안문자를 입력하세요.");
			$('#captcha').focus();
			return false;
		}
		if (!$("input:checkbox[id='agree']").is(":checked")){
			alert("개인정보 수집이용에 동의해주세요.");
			$('#agree').focus();
			return false;
		}


		if( !confirm("등록 하시겠습니까?") ){
			return false;
		}
		$('#tel').val(tel);
		$('#email').val(email);

		$('#baseForm').attr('action', '/ko/inquiry/proc.do');
		$('#baseForm').submit();

	}

</script>
        <div id="contents" class="inquiry_page">
            <div class="section_top">
                <div class="top_wave">
                    <svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 21 150 24" preserveAspectRatio="none">
                        <defs><path id="top_wave" d="M-160 44c30 0 58-11 88-11s 58 11 88 11 58-11 88-11 58 11 88 11 v44h-352z" /></defs>
                        <g class="parallax"><use xlink:href="#top_wave" x="10" y="0" fill="#fff"/></g>
                    </svg>
                </div>
                <div class="wrapper">
                    <ul class="breadcrumb clear">
                        <li>HOME</li>
                        <li>고객문의</li>
                    </ul>
                    <div class="sub_tit">
                        <h2>고객문의</h2>
                        <p>아이디어와 기술로 트렌드를 리드하는 (주)모바인어스</p>
                    </div>
                </div>
            </div>
            <div class="section inquiry_con">
                <div class="wrapper">
                    <h3 class="sub_con_tit">
                        문의하기
                    </h3>
                    <div class="inquiry_area">
                        <form name="baseForm" id="baseForm" method="post" action="/ko/inquiry/proc.do" enctype="multipart/form-data" >
						<input type="hidden" name="tel" id="tel" value=""/>
						<input type="hidden" name="email" id="email" value=""/>
                            <fieldset>
                                <p class="require"><span>*</span>는 필수입력/선택 항목입니다.</p>
                                <div class="inquir_form">
                                    <ul class="name">
                                        <li class="tit">
                                            <label for="name" class="required">이름</label>
                                        </li>
                                        <li>
                                            <input type="text" name="name" id="name" type="text" value="" required maxlength="20" />
                                        </li>
                                    </ul>
                                    <ul class="call">
                                        <li class="tit">
                                            <label for="tel1" class="required">연락처</label>
                                        </li>
                                        <li class="clear">
                                            <select name="tel1" id="tel1" >
				                        		<option value="010">010</option>
				                        		<option value="011">011</option>
				                        		<option value="016">016</option>
				                        		<option value="017">017</option>
				                        		<option value="018">018</option>
				                        		<option value="019">019</option>
				                        	</select>
                                            <span>-</span>
                                            <input type="number" name="tel2" id="tel2" value="" maxlength="4" />
                                            <span>-</span>
                                            <input type="number" name="tel3" id="tel3" value="" maxlength="4"/>
                                        </li>
                                    </ul>
                                    <ul class="email">
                                        <li class="tit">
                                            <label for="email">이메일</label>
                                        </li>
                                        <li class="clear">
                                        	<input type="text" name="email1" id="email1" value="" maxlength="50" >
                                        	<span>@</span>
				                        	<input type="text" name="email2" id="email2" value="" maxlength="50">
				                        	<select name="selectEmail" id="selectEmail" >
				                        		<option value="1" selected="selected">직접입력</option>
				                        		<option value="naver.com">naver.com</option>
				                        		<option value="hanmail.net">hanmail.net</option>
				                        		<option value="gmail.com">gmail.com</option>
				                        		<option value="nate.com">nate.com</option>
				                        	</select>
                                        </li>
                                    </ul>
                                    <ul class="institution">
                                        <li class="tit">
                                            <label for="company">소속기관</label>
                                        </li>
                                        <li class="clear">
                                            <input id="company" name="company" id="company" type="text" value="" maxlength="50" />
                                            <div>직급<input name="grade" id="grade" type="text" value=""  maxlength="50" /></div>
                                            <div>예산<input name="budget" id="budget" type="text" value="" maxlength="50"/></div>
                                        </li>
                                    </ul>
                                    <ul class="title">
                                        <li class="tit">
                                            <label for="title" class="required">제목</label>
                                        </li>
                                        <li>
                                            <input name="title" id="title" type="text" value=""  required maxlength="200" />
                                        </li>
                                    </ul>
                                    <ul class="file">
                                        <li class="tit">
                                          	<label for="content" class="required">내용</label>
                                        </li>
                                        <li class="clear">
                                            <textarea name="content" id="content"></textarea>
                                        </li>
                                    </ul>
                                    <ul class="file">
                                        <li class="tit">
                                           	 첨부파일
                                        </li>
                                        <li class="clear">
                                            <input type="text" class="upload-name" value="파일을 첨부해주세요" disabled="disabled">
                                            <label for="file1" class="file_label">파일첨부</label>
                                            <input type="file" id="file1" name="file1" class="upload_hidden">
                                        </li>
                                    </ul>

                                    <ul class="security">
                                        <li class="tit">
                                            <label for="iq_security" class="required">보안문자</label>
                                        </li>
                                        <li class="clear">
                                            <p><img id="captchaImg" src="/captcha">
                                            </p>
                                            <input id="captcha" name="captcha" type="text" value="" required />
                                            <button type="button" onclick="captchaRefresh(); return false;" class="">새로고침</button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="privacy">
                                    <h3>개인정보처리 방침</h3>
                                    <div class="con_box">
                                        내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.내용이들어갑니다.

                                    </div>
                                    <p>
                                        <input type="checkbox" id="agree" name="agree" class="ip_chk">
                                        <label for="agree" class="ip_chk_lbl"><span>*</span>개인정보처리방침에 동의합니다.</label>
                                    </p>
                                </div>
                                <button type="button" onclick="fn_write(); return false;" class="submit_btn">문의하기</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="refer_popup">
                <div class="pop_inner">
                    <div class="pop_top">
                        <h4>서울 신양초등학교 가상스포츠 교실 시공완료</h4>
                        <button class="pop_close"><i class="xi-close"></i></button>
                    </div>
                    <div class="pop_con">
                        <div class="img_box">
                            <img src="/resources/ko/images/no_img.jpg" alt="">
                        </div>
                        <p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p>
                    </div>
                </div>
            </div>
            <div class="pop_mask"></div>
        </div>