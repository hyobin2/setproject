<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">

function goLogin(){

	if ($('#id').val()  == '') {
		alert("아이디를 입력해 주세요.");
		$('#id').focus();
		return false;
	}

	if ($('#pw').val()  == '') {
		alert("비밀번호를 입력해 주세요.");
		$('#pw').focus();
		return false;
	}

	$('#baseForm').attr('action', '/adm/member/loginProc.do');
	$('#baseForm').submit();
}
</script>
<link rel="stylesheet" href="/resources/admin/css/main.css" />
<form id="baseForm" name="baseForm" method="post" action="/adm/member/loginProc.do" >
	<div id="main_wrap">
    	<div id="main_con">

        	<div class="m_header">
            	<h1><img src="/resources/admin/img/main/logo.png" alt="mobinus"></h1><div class="line_bg"></div>
            </div>
            <div class="m_con">
            	<div class="copy"><strong>mobinus 관리자 로그인</strong></div>
            </div>
            <div class="b_content">
            	<div class="b_con">
                	<div class="login_box">
                    	<h4>로그인</h4>
                        <label for="id" class="hidden"></label>
						<input type="text" style="width:230px" id="id" name="id"  placeholder="아이디" value="" />
                        <label for="pw" class="hidden"></label>
						<input type="password" style="width:230px" id="pw" name="pw"   placeholder="비밀번호" value=""/>
                        <input type="image" src="/resources/admin/img/main/login_btn.png" alt="로그인" onclick="goLogin(); return false;" border="0"/>
                    </div>
                </div>
                 <div class="m_footer">
                 	<div class="copy_area">COPYRIGHTⓒ mobinus Corp. ALL RIGHTS RESERVED.
                    </div>
                 </div>
            </div>

        </div>

    </div>
</form>