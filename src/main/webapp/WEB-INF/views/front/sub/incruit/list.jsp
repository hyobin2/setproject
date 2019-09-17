<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function fn_view(hIdx){
		$('#hIdx').val(hIdx);
		$('#baseForm').attr('action', '/front/sub/incruit/view.do');
		$('#baseForm').submit();
		}
	function fn_search(){
		
		$('#baseForm').attr('action','/front/sub/incruit/list.do');
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
				<input type="hidden" name="hIdx" id="hIdx">
					<div class="sub_tab_area one">
						<ul>
							<li><a href="../incruit/list.do" class="on">채용정보</a></li>
						</ul>
					</div>

					<div class="incruit_wrap">

						<div class="section01">
							<div class="inner">
								<p>
									K·Jobs의 <br />
									맞춤형 인재정보를 <br />
									확인해 보세요.
								</p>
								<div class="incruit_search">
									<label for="incruit_search1" class="hide">지역선택</label>
									<select name="area" id="area" style="width:14%">
										<option value="">지역</option>
										<option value="서울" ${paramMap.area == '서울'? 'selected="selected"':'' }>서울</option>
		                        		<option value="경기" ${paramMap.area == '경기'? 'selected="selected"':'' }>경기</option>
		                        		<option value="인천" ${paramMap.area == '인천'? 'selected="selected"':'' }>인천</option>
		                        		<option value="대전" ${paramMap.area == '대전'? 'selected="selected"':'' }>대전</option>
		                        		<option value="세종" ${paramMap.area == '세종'? 'selected="selected"':'' }>세종</option>
		                        		<option value="충남" ${paramMap.area == '충남'? 'selected="selected"':'' }>충남</option>
		                        		<option value="충북" ${paramMap.area == '충북'? 'selected="selected"':'' }>충북</option>
		                        		<option value="광주" ${paramMap.area == '광주'? 'selected="selected"':'' }>광주</option>
		                        		<option value="전남" ${paramMap.area == '전남'? 'selected="selected"':'' }>전남</option>
		                        		<option value="전북" ${paramMap.area == '전북'? 'selected="selected"':'' }>전북</option>
		                        		<option value="대구" ${paramMap.area == '대구'? 'selected="selected"':'' }>대구</option>
		                        		<option value="경북" ${paramMap.area == '경북'? 'selected="selected"':'' }>경북</option>
		                        		<option value="부신" ${paramMap.area == '부산'? 'selected="selected"':'' }>부산</option>
		                        		<option value="경남" ${paramMap.area == '경남'? 'selected="selected"':'' }>경남</option>
		                        		<option value="강원" ${paramMap.area == '강원'? 'selected="selected"':'' }>강원</option>
		                        		<option value="제주" ${paramMap.area == '제주'? 'selected="selected"':'' }>제주</option>
									</select>
									<label for="incruit_search2" class="hide">구분 선택</label>
									<select name="division" id="division" style="width:24%">
										<option value="">구분</option>
										<option value="서비스" ${paramMap.division == '서비스'? 'selected="selected"':'' }>서비스업</option>
		                        		<option value="교육" ${paramMap.division == '교육'? 'selected="selected"':'' }>교육업</option>
		                        		<option value="금융" ${paramMap.division == '금융'? 'selected="selected"':'' }>금융/은행업</option>
		                        		<option value="기관" ${paramMap.division == '기관'? 'selected="selected"':'' }>기관/협회</option>
		                        		<option value="건설" ${paramMap.division == '건설'? 'selected="selected"':'' }>건설업</option>
		                        		<option value="판매" ${paramMap.division == '판매'? 'selected="selected"':'' }>판매/유통업</option>
		                        		<option value="문화" ${paramMap.division == '문화'? 'selected="selected"':'' }>문화/예술/디자인업</option>
		                        		<option value="의료" ${paramMap.division == '의료'? 'selected="selected"':'' }>의료/제약업</option>
		                        		<option value="IT" ${paramMap.division == 'IT'? 'selected="selected"':'' }>IT/정보통신업</option>
		                        		<option value="미디어" ${paramMap.division == '미디어'? 'selected="selected"':'' }>미디어/광고업</option>
		                        		<option value="제조" ${paramMap.division == '제조'? 'selected="selected"':'' }>제조/생산/화학업</option>
									</select>
									<label for="incruit_search3" class="hide">연봉 선택</label>
									<select name="salary" id="salary" style="width:24%">
										<option value="">연봉 </option>
										<option value="2000" ${paramMap.salary == '2000'? 'selected="selected"':'' }>2000이하</option>
	      								<option value="2499" ${paramMap.salary == '2499'? 'selected="selected"':'' }>2000~2500미만</option>
	         							<option value="2999" ${paramMap.salary == '2999'? 'selected="selected"':'' } >2500~3000미만</option>
	         							<option value="3499" ${paramMap.salary == '2349'? 'selected="selected"':'' }>3000~3500미만</option>
	         							<option value="4999" ${paramMap.salary == '4999'? 'selected="selected"':'' }>3500~5000미만</option>
	         							<option value="5000" ${paramMap.salary == '5000'? 'selected="selected"':'' }>5000이상</option>
									</select>
									<label for="incruit_search4" class="hide">형태 선택</label>
									<select name="work" id="work" style="width:14%">
										<option value="">고용형태</option>
										<option value="정규직" ${paramMap.work == '정규직'? 'selected="selected"':'' }>정규직</option>
		            					<option value="계약직" ${paramMap.work == '계약직'? 'selected="selected"':'' }>계약직</option>
		            					<option value="파견직" ${paramMap.work == '파견직'? 'selected="selected"':'' }>파견직</option>
									</select>
									<button style="width:14%" onclick="fn_search();">검색</button>
								</div>
							</div>
						</div>

						<div class="section02">
							<div class="inner">
								<div class="list">
									<ul>
										<c:forEach var="result" items="${list}" varStatus="status">
											<li>
											<tr>
												<a href="#" onclick="fn_view('${util:zeroConvert(result.hIdx)}');">
												<div class="img"><img src="/file/viewImg.do?fIdx=${result.fileList[0].fIdx}" alt="${result.fileList[0].orgFilename }"/></div>
												<div class="txt">
													<span class="job">${result.company }</span>
													<strong>${result.title }</strong>
													<p class="job_info">
														${result.salary == '2000' ? "2000이하":'' }
														${result.salary == '2499' ? "2000~2500미만":'' }
														${result.salary == '2999' ? "2500~3000미만":'' }
														${result.salary == '3499' ? "3000~3500미만":'' }
														${result.salary == '4999' ? "3500~5000미만":'' }
														${result.salary == '5000' ? "5000이상":'' }
														<br/>
														 ${result.work}
													</p>
												</div>
												<div class="date">
												<p>${result.sDate }~${result.eDate }</p>
												<jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />
												<fmt:parseDate value="${result.eDate}" pattern="yyyy-MM-dd" var="endDate" />
												<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="eDate"/>
												<c:choose>
													<c:when test="${nowDate < eDate }">
													<span class="stat01">진행중</span>
													</c:when>
													<c:when test="${nowDate > eDate }">
													<span class="stat02">마감</span>
													</c:when>
												</c:choose>

													</div>
													</a>
												</tr>

											<c:if test="${fn:length(list) <= 0 }">
											<tr>
												<td colspan="5">게시물이 없습니다.</td>
											</tr>
											</c:if>
											</li>
										</c:forEach>
									</ul>
									<a href="#" class="more_view">더보기 +</a>
									<div class="paging">
									<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page" />
									</div>
								</div>
							</div>
						</div>

					</div>
				</form>
			</div>
			<!-- //contents-->


