<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
	function fn_login(){
		$('#baseForm').attr('action', '/front/sub/member/loginProc.do');
		$('#baseForm').submit();
	}
</script>
			<div id="contents">

				<div class="login_wrap">
					<div class="path">
						<ul>
							<li>Home</li>
							<li>로그인</li>
						</ul>
					</div>
					<div class="login_form">
						<h2>LOGIN</h2>
						<p>
							케이잡스의 다양한 혜택을 누리시려면 <br />
							로그인을 진행해 주십시오.
						</p>
						<div class="form">
						<form id="baseForm" name="baseForm" method="post" action="/front/sub/member/loginProc.do" >
							<ul>
								<li><div class="input"><input type="text" name="id" id="id" placeholder="아이디" /></div></li>
								<li><div class="input"><input type="password" name="pw" id="pw" placeholder="비밀번호" /></div></li>
							</ul>
							<!-- <div class="saveID">
								<input type="checkbox" name="" id="saveID"/>
								<label for="saveID"><span></span>아이디저장</label>
							</div> -->
							<div class="btn">
								<a href="#" onclick="fn_login()">로그인</a>
								<a href="/front/sub/member/join.do">회원가입</a>
							</div>
							<div class="findID">
								<a href="/front/sub/member/findID.do">아이디/비밀번호 찾기</a>
							</div>
						</form>
						</div>
					</div>
				</div>

			</div>
			<!-- //contents-->


