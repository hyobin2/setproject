<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function fn_list(){
		$('#baseForm').attr('action', '/front/sub/incruit/list.do');
		$('#baseForm').submit();
	}
</script>
			<!-- sub_top -->
			<div class="sub_top sub_top04">
				<div class="inner">
					<h2>채용정보</h2>
					<p>케이잡스는 꿈을 키우는 마음으로 함께 하겠습니다.</p>
					<div class="path">
						<ul>
							<li>Home</li>
							<li>채용정보</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //sub_top -->

			<div class="mobile_path">
				<ul>
					<li><a href="/">HOME</a></li>
					<li>
						<a href="#">채용정보</a>
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
						<a href="#">채용정보</a>
						<div class="path_list">
							<ul>
								<li><a href="/front/sub/incruit/list.do">채용정보</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<!-- contents-->
			<div id="contents">
				<form name="baseForm" id="baseForm" method="get" action="/front/sub/incruit/list.do" >
				<input type="hidden" name="hIdx" id="hIdx" value="${util:zeroConvert(info.hIdx) }" />
				<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
				<input type="hidden" name="workplace" id="workplace">
					<div class="sub_tab_area one">
						<ul>
							<li><a href="#" onclick="fn_list()" class="on">채용정보</a></li>
						</ul>
					</div>

					<div class="incruit_view_wrap">

						<div class="section01">
							<div class="inner">
								<div class="job_txt">
									<span class="job">목포 해양 대학교</span>
									<strong>생산직 오퍼레이터 구인
										<span class="stat01">진행중</span>
										<!-- <span class="stat02">마감</span> -->
									</strong>
									<div class="pariod">
										<strong>모집기간</strong>
										<span>2019.01.01 ~ 2019.02.03</span>
									</div>
								</div>
								<div class="job_img">
									<div class="img"><img src="/resources/front/img/img_incruit02.jpg" alt="목포해양대학교"/></div>
									<div class="txt">
										<strong>홈페이지</strong>
										<span>${info.url }</span>
									</div>
								</div>
							</div>
						</div>

						<div class="section02">
							<div class="inner">
								<div class="list">
									<ul>
										<li>
											<span class="tit">설립일</span>
											<span class="txt">${info.however }</span>
										</li>
										<li>
											<span class="tit">구분</span>
											<span class="txt">${info.division }</span>
										</li>
										<li>
											<span class="tit">매출액</span>
											<span class="txt">${info.sales }</span>
										</li>
										<li>
											<span class="tit">주요사업</span>
											<span class="txt">${info.business }</span>
										</li>
										<li>
											<span class="tit">주소</span>
											<span class="txt">${info.address }</span>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="section03">
							<div class="inner">
								<h3 class="tit">모집요강</h3>
								<div class="list">
									<ul>
										<li>
											<span class="tit">채용직무</span>
											<span class="txt">${info.duty }</span>
										</li>
										<li>
											<span class="tit">모집인원</span>
											<span class="txt">${info.personnel }</span>
										</li>
										<li>
											<span class="tit">담당업무</span>
											<span class="txt">${info.task }</span>
										</li>
										<li>
											<span class="tit">지원방법</span>
											<span class="txt">워크넷/사람인 지원</span>
										</li>
										<li>
											<span class="tit">학력</span>
											<span class="txt">${info.education }</span>
										</li>
										<li>
											<span class="tit">경력</span>
											<span class="txt">${info.career }</span>
										</li>
										<li>
											<span class="tit">고용형태</span>
											<span class="txt">${info.employ }</span>
										</li>
										<li>
											<span class="tit">근무형태</span>
											<span class="txt">
															${info.work == '계약직' ? "계약직":'' }
															${info.work == '정규직' ? "정규직":'' }
															${info.work == '파견직' ? "파견직":'' }
											</span>
										</li>
										<li>
											<span class="tit">자격면허</span>
											<span class="txt">${info.certificate }</span>
										</li>
										<li>
											<span class="tit">연봉</span>
											<span class="txt">
															${info.salary == '2000' ? "2000이하":'' }
															${info.salary == '2499' ? "2000~2500미만":'' }
															${info.salary == '2999' ? "2500~3000미만":'' }
															${info.salary == '3499' ? "3000~3500미만":'' }
															${info.salary == '4999' ? "3500~5000미만":'' }
															${info.salary == '5000' ? "5000이상":'' }
											</span>
										</li>
										<li class="long">
											<span class="tit">근무지</span>
											<span class="txt">${info.workplace }</span>
										</li>
										<li class="long">
											<span class="tit">우대사항</span>
											<span class="txt">${info.preferential }</span>
										</li>
										<li class="long">
											<span class="tit">마감일</span>
											<span class="txt">${info.eDate }</span>
										</li>
									</ul>
								</div>
								<div class="btn_incruit">
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />
									<fmt:parseDate value="${info.eDate}" pattern="yyyy-MM-dd" var="endDate" />
									<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="eDate"/>
									<c:choose>
										<c:when test="${nowDate < eDate }">
											<a href="${info.wurl }"><img src="/resources/front/img/btn_incruit01.png" alt="워크넷 지원하기"/></a>
											<a href="${info.surl }"><img src="/resources/front/img/btn_incruit02.png" alt="사람인 지원하기"/></a>
										</c:when>
										<c:when test="${nowDate > eDate }">

										</c:when>
									 </c:choose>

								</div>
							</div>
						</div>

						<div class="section04">
							<div class="inner">
								<h3 class="tit">추가내용</h3>
								<div class="list">
									${info.content}
								</div>
							</div>
						</div>

					</div>
				</form>
			</div>
			<!-- //contents-->


