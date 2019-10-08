<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function setCookieMobile ( id, value, expiredays ) {
	    var todayDate = new Date();
	    todayDate.setDate( todayDate.getDate() + expiredays );
	    document.cookie = id + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	    $("#"+id).fadeOut('300');
	}
	function getCookieMobile (id) {
	    var cookiedata = document.cookie;
	    if ( cookiedata.indexOf(id+"=done") < 0 ){
	    	$("#"+id).show();
	    }else {
	    	$("#"+id).hide();
	    }
	}
	function closePopup(pIdx){
		$('#main_popup'+pIdx).hide();
	}
	function closeBanner(bIdx){

		$('#topbanner'+bIdx).hide();
	}
</script>
<c:if test="${paramMap.menuId == 'index' }">

		<c:forEach var="result" items="${popupList}" varStatus="status">
			<jsp:useBean id="now" class="java.util.Date"/>
        	<fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />
			<fmt:parseDate value="${result.eDate}" pattern="yyyy-MM-dd" var="endDate" />
			<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="eDate"/>
			<c:choose>
				<c:when test="${nowDate<eDate }">
					<div class="main_popup" id="main_popup${result.pIdx }" style="width:${result.pWidth}px;height:${result.pHeight}px; top:${result.pTop}px; left:${result.pLeft}px;">
						<div class="pop_con">
							${result.content }
						</div>
						<ul class="pop_btn">
							<li><button type="button" onclick="setCookieMobile('main_popup${result.pIdx}', 'done', 1);" ><b>24</b>시간 동안 열람하지 않음.</button></li>
							<li class="pop_close"><button type="button" onclick="closePopup(${result.pIdx})">닫기</button></li>
						</ul>
					</div>
				</c:when>
			</c:choose>
		    <script type="text/javascript">
		    	getCookieMobile('main_popup${result.pIdx}');
		    </script>
		</c:forEach>

        <c:forEach var="result" items="${bannerList}" varStatus="status">
        <fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />
		<fmt:parseDate value="${result.eDate}" pattern="yyyy-MM-dd" var="endDate" />
		<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="eDate"/>
		<c:choose>
			<c:when test="${nowDate<eDate }">
		        <c:if test="${result.showYn=='Y' }">
		        	<div class="topbanner" id="topbanner${result.bIdx }" >
				        <div class="wrapper">
			            		<p class="top_con">
									<a href='${result.url}' target="_blank">
									<img src="/file/viewImg.do?fIdx=${result.fileList[0].fIdx}" alt="${result.fileList[0].orgFilename}" width=1511px" height="100px"></a>
	           					</p>
	            				<div class="m_topbanner_event">
		           					<span class="close_banner_icon"><i class="xi-close-min .closeTopBanner" onclick="closeBanner('${result.bIdx}')">X</i></span>
		            			</div>
			        	</div>
			      	</div>
		    	</c:if>
	    	</c:when>
		</c:choose>
	        <script type="text/javascript">
	    	getCookieMobile('topbanner${result.pIdx }');
	    	</script>
        </c:forEach>

	</c:if>




		<div id="header">
			<div class="inner">
				<h1><a href="/front/"><img src="/resources/front/img/img_logo.png" alt="케이잡스"/></a></h1>
				<div class="lnb">
					<ul>
						<c:choose>
							<c:when test="${empty loginMap}">
								<li><a href="/front/sub/member/join.do">회원가입</a></li>
								<li><a href="/front/sub/member/login.do">로그인</a></li>		
							</c:when>
							<c:otherwise>
								<li><a href="/front/sub/member/logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose> 
						<li><a href="#"><strong>ENG</strong></a></li>
					</ul>
				</div>
				<div class="gnb">
					<div class="inner">
						<ul>
							<li>
								<a href="/front/sub/hyobin/greetings.do">K·Jobs</a>
								<div class="gnb_sub">
									<ul>
										<li><a href="/front/sub/hyobin/greetings.do">인사말</a></li>
										<li><a href="/front/sub/hyobin/ideology.do">경영이념</a></li>
										<li><a href="/front/sub/hyobin/history.do">회사연혁</a></li>
										<li><a href="/front/sub/hyobin/organization.do">회사조직</a></li>
										<li><a href="/front/sub/hyobin/cooperate.do">협력기관</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/business/business01_01.do">사업분야</a>
								<div class="gnb_sub">
									<ul>
										<li>
											<a href="/front/sub/business/business01_01.do">고용서비스</a>
											<ul>
												<li><a href="/front/sub/business/business01_01.do">취업성공 패키지</a></li>
												<li><a href="/front/sub/business/business01_02.do">청년내일 채움공제</a></li>
												<li><a href="/front/sub/business/business01_03.do">집단 상담 프로그램</a></li>
												<li><a href="/front/sub/business/business01_04.do">뉴딜 일자리</a></li>
												<li><a href="/front/sub/business/business01_05.do">채용지원서비스</a></li>
											</ul>
										</li>
										<li>
											<a href="/front/sub/business/business02_01.do">전직지원 서비스</a>
											<ul>
												<li><a href="/front/sub/business/business02_01.do">IDOL</a></li>
												<li><a href="/front/sub/business/business02_02.do">민간 전직 서비스</a></li>
												<li><a href="/front/sub/business/business02_03.do">공공 전직 서비스</a></li>
												<li><a href="/front/sub/business/business02_04.do">인생 이모작</a></li>
											</ul>
										</li>
										<li>
											<a href="/front/sub/business/business03_01.do">MICE</a>
											<ul>
												<li><a href="/front/sub/business/business03_01.do">회의/포럼 세미나</a></li>
												<li><a href="/front/sub/business/business03_02.do">박람회/워크샵/컨벤션</a></li>
											</ul>
										</li>
										<li>
											<a href="/front/sub/business/business04_01.do">교육 컨설팅 서비스</a>
											<ul>
												<li><a href="/front/sub/business/business04_01.do">학교교육 컨설팅</a></li>
												<li><a href="/front/sub/business/business04_02.do">기업교육 컨설팅</a></li>
											</ul>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/cummunity/activity/list.do">커뮤니티</a>
								<div class="gnb_sub">
									<ul>
										<li><a href="/front/sub/cummunity/activity/list.do">케이잡스 활동</a></li>
										<li><a href="/front/sub/cummunity/notice/list.do">공지 및 안내사항</a></li>
										<li><a href="/front/sub/cummunity/customercase/list.do">고객사례</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/incruit/list.do">채용정보</a>
								<div class="gnb_sub">
									<ul>
										<li><a href="/front/sub/incruit/list.do">채용정보</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/customer/inquiry/list.do">고객지원</a>
								<div class="gnb_sub">
									<ul>
										<li><a href="/front/sub/customer/inquiry/list.do">고객문의(Q&amp;A)</a></li>
										<li><a href="/front/sub/customer/service/list.do">서비스 신청 및 접수</a></li>
										<li><a href="/front/sub/customer/location/location.do">오시는 길</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<a href="#" class="open_fullmenu"><img src="/resources/front/img/btn_fullmenu.png" alt="전체메뉴"/></a>
			</div>
			<div class="bg_gnb_sub"></div>
		</div>
		<!-- //header -->

		<!-- fullmenu -->
		<div class="fullmenu">
			<div class="inner">
				<a href="#" class="close_fullmenu"><img src="/resources/front/img/btn_close02.png" alt="close"/></a>
				<div class="fullmenu_list">
					<ul>
						<li>
							<a href="/front/sub/hyobin/greetings.do">K·Jobs</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li><a href="/front/sub/hyobin/greetings.do">인사말</a></li>
									<li><a href="/front/sub/hyobin/ideology.do">경영이념</a></li>
									<li><a href="/front/sub/hyobin/history.do">회사연혁</a></li>
									<li><a href="/front/sub/hyobin/organization.do">회사조직</a></li>
									<li><a href="/front/sub/hyobin/cooperate.do">협력기관</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="/front/sub/business/business01_01.do">사업분야</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li>
										<a href="/front/sub/business/business01_01.do">고용서비스</a>
										<ul>
											<li><a href="/front/sub/business/business01_01.do">취업성공 패키지</a></li>
											<li><a href="/front/sub/business/business01_02.do">청년내일 채움공제</a></li>
											<li><a href="/front/sub/business/business01_03.do">집단 상담 프로그램</a></li>
											<li><a href="/front/sub/business/business01_04.do">뉴딜 일자리</a></li>
											<li><a href="/front/sub/business/business01_05.do">채용지원서비스</a></li>
										</ul>
									</li>
									<li>
										<a href="/front/sub/business/business02_01.do">전직지원 서비스</a>
										<ul>
											<li><a href="/front/sub/business/business02_01.do">IDOL</a></li>
											<li><a href="/front/sub/business/business02_02.do">민간 전직 서비스</a></li>
											<li><a href="/front/sub/business/business02_03.do">공공 전직 서비스</a></li>
											<li><a href="/front/sub/business/business02_04.do">인생 이모작</a></li>
										</ul>
									</li>
									<li>
										<a href="/front/sub/business/business03_01.do">MICE</a>
										<ul>
											<li><a href="/front/sub/business/business03_01.do">회의/포럼 세미나</a></li>
											<li><a href="/front/sub/business/business03_02.do">박람회/워크샵/컨벤션</a></li>
										</ul>
									</li>
									<li>
										<a href="/front/sub/business/business04_01.do">교육 컨설팅 서비스</a>
										<ul>
											<li><a href="/front/sub/business/business04_01.do">학교교육 컨설팅</a></li>
											<li><a href="/front/sub/business/business04_02.do">기업교육 컨설팅</a></li>
										</ul>
									</li>
								</ul>
							</div>
						</li>
						<li>
							<a href="/front/sub/cummunity/activity/list.do">커뮤니티</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li><a href="/front/sub/cummunity/activity/list.do">케이잡스 활동</a></li>
									<li><a href="/front/sub/cummunity/notice/list.do">공지 및 안내사항</a></li>
									<li><a href="/front/sub/cummunity/customercase/list.do">고객사례</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="/front/sub/incruit/list.do">채용정보</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li><a href="/front/sub/incruit/list.do">채용정보</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="/front/sub/customer/inquiry/list.do">고객지원</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li><a href="/front/sub/customer/inquiry/list.do">고객문의(Q&amp;A)</a></li>
									<li><a href="/front/sub/customer/service/list.do">서비스 신청 및 접수</a></li>
									<li><a href="/front/sub/customer/location/location.do">오시는 길</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //fullmenu -->

		<!-- mobile_header -->
		<div id="mobile_header">
			<h1><a href="/front/"><img src="/resources/front/img/img_logo.png" alt="케이잡스"/></a></h1>
			<a href="#" class="open_mobile_fullmenu"><img src="/resources/front/img/btn_mobile_fullmenu.png" alt="모바일 전체메뉴"/></a>
			<div class="mobile_fullmenu">
				<div class="inner">
					<a href="#" class="close_mobile_fullmenu"><img src="/resources/front/img/btn_close02.png" alt="close"/></a>
					<div class="mobile_login" id="mobile_logout">
						<ul>
							<li><a href="/front/sub/member/join.do">회원가입</a></li>
							<li><a href="/front/sub/member/login.do">로그인</a></li>
						</ul>
					</div>
					<div class="mobile_login" id="mobile_login" style="display: none;">
						<ul>
							<li><a href="/front/sub/member/logout.do" >로그아웃</a></li>
						</ul>
					</div>
					<div class="mobile_fullmenu_list">
						<ul>
							<li>
								<a href="/front/sub/hyobin/greetings.do">K·Jobs</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li><a href="/front/sub/hyobin/greetings.do">인사말</a></li>
										<li><a href="/front/sub/hyobin/ideology.do">경영이념</a></li>
										<li><a href="/front/sub/hyobin/history.do">회사연혁</a></li>
										<li><a href="/front/sub/hyobin/organization.do">회사조직</a></li>
										<li><a href="/front/sub/hyobin/cooperate.do">협력기관</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/business/business01_01.do" class="child">사업분야</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li>
											<a href="/front/sub/business/business01_01.do" class="child">고용서비스</a>
											<ul>
												<li><a href="/front/sub/business/business01_01.do">취업성공 패키지</a></li>
												<li><a href="/front/sub/business/business01_02.do">청년내일 채움공제</a></li>
												<li><a href="/front/sub/business/business01_03.do">집단 상담 프로그램</a></li>
												<li><a href="/front/sub/business/business01_04.do">뉴딜 일자리</a></li>
												<li><a href="/front/sub/business/business01_05.do">채용지원서비스</a></li>
											</ul>
										</li>
										<li>
											<a href="/front/sub/business/business02_01.do" class="child">전직지원 서비스</a>
											<ul>
												<li><a href="/front/sub/business/business02_01.do">IDOL</a></li>
												<li><a href="/front/sub/business/business02_02.do">민간 전직 서비스</a></li>
												<li><a href="/front/sub/business/business02_03.do">공공 전직 서비스</a></li>
												<li><a href="/front/sub/business/business02_04.do">인생 이모작</a></li>
											</ul>
										</li>
										<li>
											<a href="/front/sub/business/business03_01.do" class="child">MICE</a>
											<ul>
												<li><a href="/front/sub/business/business03_01.do">회의/포럼 세미나</a></li>
												<li><a href="/front/sub/business/business03_02.do">박람회/워크샵/컨벤션</a></li>
											</ul>
										</li>
										<li>
											<a href="/front/sub/business/business04_01.do" class="child">교육 컨설팅 서비스</a>
											<ul>
												<li><a href="/front/sub/business/business04_01.do">학교교육 컨설팅</a></li>
												<li><a href="/front/sub/business/business04_02.do">기업교육 컨설팅</a></li>
											</ul>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/cummunity/activity_/ist.do">커뮤니티</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li><a href="/front/sub/cummunity/activity/list.do">케이잡스 활동</a></li>
										<li><a href="/front/sub/cummunity/notice/list.do">공지 및 안내사항</a></li>
										<li><a href="/front/sub/cummunity/customercase/list.do">고객사례</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/incruit/list.do">채용정보</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li><a href="/front/sub/incruit/list.do">채용정보</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/front/sub/customer/inquiry/list.do">고객지원</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li><a href="/front/sub/customer/inquiry/list.do">고객문의(Q&amp;A)</a></li>
										<li><a href="/front/sub/customer/service/list.do">서비스 신청 및 접수</a></li>
										<li><a href="/front/sub/customer/location/location.do">오시는 길</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="lang">
						<a href="#">ENG</a>
					</div>
				</div>
			</div>
		</div>