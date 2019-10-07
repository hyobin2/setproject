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
				<h1><a href="/en/"><img src="/resources/en/img/img_logo.png" alt="K·Jobs"/></a></h1>
				<div class="lnb">
					<ul>
						<li><a href="/front/"><strong>KOR</strong></a></li>
					</ul>
				</div>
				<div class="gnb">
					<div class="inner">
						<ul>
							<li>
								<a href="/en/sub/kjobs/greetings.do">K·Jobs</a>
								<div class="gnb_sub">
									<ul>
										<li><a href="/en/sub/kjobs/greetings.do">Greeting</a></li>
										<li><a href="/en/sub/kjobs/ideology.do">Corporate Philosophy</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/en/sub/business/business01_01.do">Business Area</a>
								<div class="gnb_sub">
									<ul>
										<li>
											<a href="/en/sub/business/business01_01.do">Employee Service</a>
											<ul>
												<li><a href="/en/sub/business/business01_01.do">Employment Success Package</a></li>
												<li><a href="/en/sub/business/business01_02.do">Youth to Tomorrow Savings</a></li>
												<li><a href="/en/sub/business/business01_03.do">Group Counseling</a></li>
												<li><a href="/en/sub/business/business01_04.do">New Deal Employment</a></li>
												<li><a href="/en/sub/business/business01_05.do">Recruiting Agent Service</a></li>
											</ul>
										</li>
										<li>
											<a href="/en/sub/business/business02_01.do">Outplacement Support service</a>
											<ul>
												<li><a href="/en/sub/business/business02_01.do">IDOL</a></li>
												<li><a href="/en/sub/business/business02_02.do">Private Outplacement</a></li>
												<li><a href="/en/sub/business/business02_03.do">Public Putplacement</a></li>
												<li><a href="/en/sub/business/business02_04.do">Second Life Plan</a></li>
											</ul>
										</li>
										<li>
											<a href="/en/sub/business/business03_01.do">MICE</a>
											<ul>
												<li><a href="/en/sub/business/business03_01.do">Conference/Forum/Seminar</a></li>
												<li><a href="/en/sub/business/business03_02.do">Fair / Workshop / Convention</a></li>
											</ul>
										</li>
										<li>
											<a href="/en/sub/business/business04_01.do">Education Consulting Service</a>
											<ul>
												<li><a href="/en/sub/business/business04_01.do">School Education Consulting</a></li>
												<li><a href="/en/sub/business/business04_02.do">Corporate Education Consulting</a></li>
											</ul>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/en/sub/customer/location/location.do">Customer Support</a>
								<div class="gnb_sub">
									<ul>
										<li><a href="/en/sub/customer/location/location.do">Directions</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<a href="#" class="open_fullmenu"><img src="/resources/en/img/btn_fullmenu.png" alt="full menu"/></a>
			</div>
			<div class="bg_gnb_sub"></div>
		</div>
		<!-- //header -->

		<!-- fullmenu -->
		<div class="fullmenu">
			<div class="inner">
				<a href="#" class="close_fullmenu"><img src="/resources/en/img/btn_close02.png" alt="close"/></a>
				<div class="fullmenu_list">
					<ul>
						<li>
							<a href="/en/sub/kjobs/greetings.do">K·Jobs</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li><a href="/en/sub/kjobs/greetings.do">Greeting</a></li>
									<li><a href="/en/sub/kjobs/ideology.do">Corporate Philosophy</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="/en/sub/business/business01_01.do">Business Area</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li>
										<a href="/en/sub/business/business01_01.do">Employee Service</a>
										<ul>
											<li><a href="/en/sub/business/business01_01.do">Employment Success Package</a></li>
											<li><a href="/en/sub/business/business01_02.do">Youth to Tomorrow Savings</a></li>
											<li><a href="/en/sub/business/business01_03.do">Group Counseling</a></li>
											<li><a href="/en/sub/business/business01_04.do">New Deal Employment</a></li>
											<li><a href="/en/sub/business/business01_05.do">Recruiting Agent Service</a></li>
										</ul>
									</li>
									<li>
										<a href="/en/sub/business/business02_01.do">Outplacement Support service</a>
										<ul>
											<li><a href="/en/sub/business/business02_01.do">IDOL</a></li>
											<li><a href="/en/sub/business/business02_02.do">Private Outplacement</a></li>
											<li><a href="/en/sub/business/business02_03.do">Public Putplacement</a></li>
											<li><a href="/en/sub/business/business02_04.do">Second Life Plan</a></li>
										</ul>
									</li>
									<li>
										<a href="/en/sub/business/business03_01.do">MICE</a>
										<ul>
											<li><a href="/en/sub/business/business03_01.do">Conference/Forum/Seminar</a></li>
											<li><a href="/en/sub/business/business03_02.do">Fair / Workshop / Convention</a></li>
										</ul>
									</li>
									<li>
										<a href="/en/sub/business/business04_01.do">Education Consulting Service</a>
										<ul>
											<li><a href="/en/sub/business/business04_01.do">School Education Consulting</a></li>
											<li><a href="/en/sub/business/business04_02.do">Corporate Education Consulting</a></li>
										</ul>
									</li>
								</ul>
							</div>
						</li>
						<li>
							<a href="/en/sub/customer/location/location.do">Customer Support</a>
							<div class="fullmenu_list_sub">
								<ul>
									<li><a href="/en/sub/customer/location/location.do">Directions</a></li>
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
			<h1><a href="/en/"><img src="/resources/en/img/img_logo.png" alt="K·Jobs"/></a></h1>
			<a href="#" class="open_mobile_fullmenu"><img src="/resources/en/img/btn_mobile_fullmenu.png" alt="mobile fullmenu"/></a>
			<div class="mobile_fullmenu">
				<div class="inner">
					<a href="#" class="close_mobile_fullmenu"><img src="/resources/en/img/btn_close02.png" alt="close"/></a>
					<div class="mobile_login" id="mobile_logout">
						
					</div>
					<div class="mobile_login" id="mobile_login" style="display: none;">
						
					</div>
					<div class="mobile_fullmenu_list">
						<ul>
							<li>
								<a href="/en/sub/kjobs/greetings.do">K·Jobs</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li><a href="/en/sub/kjobs/greetings.do">Greeting</a></li>
										<li><a href="/en/sub/kjobs/ideology.do">Corporate Philosophy</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/en/sub/business/business01_01.do" class="child">Business Area</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li>
											<a href="/en/sub/business/business01_01.do" class="child">Employee Service</a>
											<ul>
												<li><a href="/en/sub/business/business01_01.do">Employment Success Package</a></li>
												<li><a href="/en/sub/business/business01_02.do">Youth to Tomorrow Savings</a></li>
												<li><a href="/en/sub/business/business01_03.do">Group Counseling</a></li>
												<li><a href="/en/sub/business/business01_04.do">New Deal Employment</a></li>
												<li><a href="/en/sub/business/business01_05.do">Recruiting Agent Service</a></li>
											</ul>
										</li>
										<li>
											<a href="/en/sub/business/business02_01.do" class="child">Outplacement Support service</a>
											<ul>
												<li><a href="/en/sub/business/business02_01.do">IDOL</a></li>
												<li><a href="/en/sub/business/business02_02.do">Private Outplacement</a></li>
												<li><a href="/en/sub/business/business02_03.do">Public Putplacement</a></li>
												<li><a href="/en/sub/business/business02_04.do">Second Life Plan</a></li>
											</ul>
										</li>
										<li>
											<a href="/en/sub/business/business03_01.do" class="child">MICE</a>
											<ul>
												<li><a href="/en/sub/business/business03_01.do">Conference/Forum/Seminar</a></li>
												<li><a href="/en/sub/business/business03_02.do">Fair / Workshop / Convention</a></li>
											</ul>
										</li>
										<li>
											<a href="/en/sub/business/business04_01.do" class="child">Education Consulting Service</a>
											<ul>
												<li><a href="/en/sub/business/business04_01.do">School Education Consulting</a></li>
												<li><a href="/en/sub/business/business04_02.do">Corporate Education Consulting</a></li>
											</ul>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<a href="/en/sub/customer/location/location.do">Customer Support</a>
								<div class="mobile_fullmenu_list_sub">
									<ul>
										<li><a href="/en/sub/customer/location/location.do">Directions</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="lang">
						<a href="/front/">KOR</a>
					</div>
				</div>
			</div>
		</div>