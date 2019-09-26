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
								<li><a href="/en/sub/member/findID.do" class="on">아이디 찾기</a></li>
								<li><a href="/en/sub/member/findPW.do">비밀번호 찾기</a></li>
							</ul>
						</div>
						<div class="cont">
							<!-- 아이디 찾기 -->
							<div class="item">
								<div class="form">
								<form action="">
									<div class="name"><input type="text" name="name" id="name" placeholder="본인 이름을 띄어쓰기 없이 입력해 주세요." /></div>
									<p>회원가입시 등록한 휴대폰 번호를 입력해 주세요.</p>
									<div class="tel">
										<ul>
											<li>
											<input type="hidden" name="tel" id="tel">
												<select name="" id="tel1">
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
									<a href="#" class="confirm open_pop_findID" id="findId">확인</a>
								</form>
								</div>
							</div>
							<!-- //아이디 찾기 -->
						</div>
					</div>
				</div>

			</div>
			<!-- //contents-->

			<!-- 아이디찾기 팝업 -->
			<div class="pop_findID">
				<div class="inner">
					<h2>아이디찾기 결과</h2>
					<a href="#" class="close_pop_findID"><img src="/resources/en/img/btn_close03.png" alt="close" id="close"/></a>
					<div class="cont">
						<p id="findData">회원님의 아이디는 <strong id="find_Id"> </strong> 입니다.</p>
						<p id="nodata"class="nodata">일치하는 회원정보가 없습니다.</p>
						<div class="btn">
							<a href="/en/sub/member/findPW.do">비밀번호 찾기</a>
							<a href="/en/sub/member/login.do">로그인 하기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- //아이디찾기 팝업 -->

<script type="text/javascript">

/* 	$(document).ready(function(){

		//아이디찾기 팝업
		$(".open_pop_findID").click(function(){
			$(".pop_findID").fadeIn("fast");
			return false;
		});
		$(".close_pop_findID").click(function(){
			$(".pop_findID").fadeOut("fast");
			return false;
		});

	});*/
	$('#findId').click(function(){
	if($('#name').val() == ''){
		alert('이름을 입력해주세요.');
		$('#name').focus();
		return false;
	}
	if($('#tel1').val() == '' || $('#tel2').val() == '' || $('#tel3').val()== '' ){
		alert('전화번호를 입력해주세요.');
		$('#tel2').focus();
		return false;
	}
	$('#tel').val($('#tel1').val()+'-'+$('#tel2').val()+'-'+$('#tel3').val());
	var params={'name':$('#name').val(),'tel':$('#tel').val()}
		$.ajax({
			url: "/en/sub/member/findIdProc.do",
			type: "post",
			data: JSON.stringify(params),
			contentType: "application/json; charset=utf-8;",
			success: function(data){
		     	if(data == 'N'){
		     		$('#nodata').show();
		     		$('#findData').hide();
		     		$(".pop_findID").fadeIn("fast");
				}else{
					$(".pop_findID").fadeIn("fast");
					$('#nodata').hide();
					$('#findData').show();
					$('#find_Id').html(data.id.replace(/.{3}$/,'***'));
				}
			},
			error:function(error){
				alert(error)
				}
			});
		})
		$('#close').click(function(){
			$('.pop_findID').hide()
		})
</script>


