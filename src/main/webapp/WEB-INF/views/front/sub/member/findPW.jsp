<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
			<!-- contents-->
			<div id="contents">

				<div class="login_wrap">
					<div class="path">
						<ul>
							<li>Home</li>
							<li>아이디/비밀번호 찾기</li>
						</ul>
					</div>
					<div class="findID_form">
						<h2>아이디/비밀번호 찾기</h2>
						<div class="tab">
							<ul>
								<li><a href="/front/sub/member/findID.do">아이디 찾기</a></li>
								<li><a href="/front/sub/member/findPW.do" class="on">비밀번호 찾기</a></li>
							</ul>
						</div>
						<div class="cont">
							<!-- 비밀번호 찾기 -->
							<div class="item">
								<div class="form">
								<form action="">
									<div class="name"><input type="text" name="findId" id="findId" placeholder="아이디를 입력해 주세요." /></div>
									<p>회원가입시 등록한 휴대폰 번호를 입력해 주세요.</p>
									<div class="tel">
										<ul>
											<li>
												<input type="hidden" name="tel" id="tel">
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
									<a href="#" class="confirm open_pop_findPW" id="findPw">확인</a>
								</form>
								</div>
							</div>
							<!-- //비밀번호 찾기 -->
						</div>
					</div>
				</div>

			</div>
			<!-- //contents-->

			<!-- 비밀번호찾기 팝업 -->
			<!-- <div class="pop_findPW">
				<div class="inner">
					<h2>비밀번호찾기 결과</h2>
					<a href="#" class="close_pop_findPW"><img src="/resources/front/img/btn_close03.png" alt="close"/></a>
					<div class="cont">
						<p>회원님의 비밀번호는 <strong>dqwfwq!! </strong> 입니다.</p>
						<p class="nodata">일치하는 회원정보가 없습니다.</p>
						<div class="btn">
							<a href="/front/sub/member/findID.do">아이디 찾기</a>
							<a href="/front/sub/member/join.do">회원가입</a>
						</div>
					</div>
				</div>
			</div> -->
			<!-- //비밀번호찾기 팝업 -->

<script type="text/javascript">
/* $(document).ready(function(){

	//비밀찾기 팝업
	$(".open_pop_findPW").click(function(){
		$(".pop_findPW").fadeIn("fast");
		return false;
	});
	$(".close_pop_findPW").click(function(){
		$(".pop_findPW").fadeOut("fast");
		return false;
	});

});*/
$('#findPw').click(function(){
	if($('#findId').val() == ''){
		alert('아이디를 입력해주세요.');
		return false;
	}

	if($('#tel1').val() == '' || $('#tel2').val() == '' || $('#tel3').val()== '' ){
		alert('전화번호를 입력해주세요.');
		return false;
	}

	$('#tel').val($('#tel1').val()+"-"+$('#tel2').val()+"-"+$('#tel3').val());

	var params={'findId':$('#findId').val(),'tel':$('#tel').val()}
		$.ajax({
			url: "/front/sub/member/findPwProc.do",
			type: "post",
			data: JSON.stringify(params),
			contentType: "application/json; charset=utf-8;",
			dataType: "html",
			success: function(data){
		     	if(data == 'N'){
		     		alert('회원정보를 찾지 못했습니다.')
				}else{
					alert('해당 휴대폰번호로 비밀번호를 전송하였습니다.');
				}
			},
			error:function(error){
				console.log(error)
				alert(error)
				}
			});
		})
</script>


