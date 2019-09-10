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
								<li><a href="findID.html" class="on">아이디 찾기</a></li>
								<li><a href="findPW.html">비밀번호 찾기</a></li>
							</ul>
						</div>
						<div class="cont">
							<!-- 아이디 찾기 -->
							<div class="item">
								<div class="form">
								<form action="">
									<div class="name"><input type="text" name="" id="" placeholder="본인 이름을 띄어쓰기 없이 입력해 주세요." /></div>
									<p>회원가입시 등록한 휴대폰 번호를 입력해 주세요.</p>
									<div class="tel">
										<ul>
											<li>
												<select name="" id="">
													<option value="">010</option>
												</select>
											</li>
											<li>
												<div class="input"><input type="text" name="" id=""/></div>
											</li>
											<li>
												<div class="input"><input type="text" name="" id=""/></div>
											</li>
										</ul>
									</div>
									<a href="#" class="confirm open_pop_findID">확인</a>
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
					<a href="#" class="close_pop_findID"><img src="/resources/front/img/btn_close03.png" alt="close"/></a>
					<div class="cont">
						<!-- <p>회원님의 아이디는 <strong>admin** </strong> 입니다.</p> -->
						<p class="nodata">일치하는 회원정보가 없습니다.</p>
						<div class="btn">
							<a href="findPW.html">비밀번호 찾기</a>
							<a href="login.html">로그인 하기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- //아이디찾기 팝업 -->

			<script type="text/javascript">
				$(document).ready(function(){

					//아이디찾기 팝업
					$(".open_pop_findID").click(function(){
						$(".pop_findID").fadeIn("fast");
						return false;
					});
					$(".close_pop_findID").click(function(){
						$(".pop_findID").fadeOut("fast");
						return false;
					});

				});
			</script>


<?php include "../../inc/footer.html" ?>