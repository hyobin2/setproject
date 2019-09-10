<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
			<!-- sub_top -->
			<div class="sub_top sub_top05">
				<div class="inner">
					<h2>고객지원</h2>
					<p>케이잡스는 고객 만족을 위해 최선을 다합니다.</p>
					<div class="path">
						<ul>
							<li>Home</li>
							<li>고객지원</li>
							<li>서비스 신청 및 접수</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //sub_top -->

			<!-- contents-->
			<div id="contents">

				<div class="sub_tab_area three">
					<ul>
						<li><a href="../inquiry/list.do">고객문의</a></li>
						<li><a href="../service/list.do" class="on">서비스 신청 및 접수</a></li>
						<li><a href="../location/location.do">오시는 길</a></li>
					</ul>
				</div>

				<div class="board_wrap">

					<div class="board_write">
						<div class="title">
							<h3>케이잡스 서비스 신청 및 접수</h3>
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
										<div class="input"><input type="text" name="" id=""/></div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>이름/기업명</label></th>
									<td colspan="3">
										<div class="input" style="max-width:300px;"><input type="text" name="" id=""/></div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>비밀번호</label></th>
									<td>
										<div class="input"><input type="password" name="" id="" placeholder="6~16자의 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합" /></div>
									</td>
									<th scope="row"><label for=""><span class="star">*</span>비밀번호 확인</label></th>
									<td>
										<div class="input"><input type="password" name="" id="" placeholder="입력하신 비밀번호를 한번 더 입력해 주세요 " /></div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>휴대폰번호</label></th>
									<td colspan="3">
										<div class="tel">
											<ul>
												<li>
													<select name="" id="" style="max-width:150px;">
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
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>이메일</label></th>
									<td colspan="3">
										<div class="email">
											<ul>
												<li>
													<div class="input"><input type="text" name="" id=""/></div>
												</li>
												<li>
													<div class="input"><input type="text" name="" id=""/></div>
												</li>
												<li>
													<select name="" id="">
														<option value="">직접입력</option>
													</select>
												</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>주소</label></th>
									<td colspan="3">
										<div class="zipcode">
											<ul>
												<li>
													<div class="input" style="width:90px"><input type="text" name="" id=""/></div>
												</li>
												<li>
													<div class="input" style="width:90px"><input type="text" name="" id=""/></div>
												</li>
												<li><a href="#" style="width:90px">주소찾기</a></li>
												<li class="long">
													<div class="input"><input type="text" name="" id=""/></div>
												</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>구분</label></th>
									<td colspan="3">
										<select name="" id="" style="max-width:300px;">
											<option value="">신청하실 서비스를 선택해 주세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>내용</label></th>
									<td colspan="3">
										<div class="textarea">
											<textarea></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for=""><span class="star">*</span>자동입력방지</label></th>
									<td colspan="3">
										<div class="capcha">
											<div class="img"><img src="/resources/front/img/img_capcha.png" alt="캡챠이미지"/></div>
											<div class="txt">
												<div class="form">
													<ul>
														<li><a href="#">숫자음성듣기</a></li>
														<li><a href="#">새로고침</a></li>
													</ul>
													<div><input type="text" name="" id=""/></div>
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
							<a href="#" class="btn_style03">서비스 신청하기</a>
						</div>
					</div>

				</div>

			</div>
			<!-- //contents-->


<?php include "../../inc/footer.html" ?>