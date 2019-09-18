<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">
	function fn_view(bIdx){
		$('#bIdx').val(bIdx);
		$('#baseForm').attr('action', '/front/sub/cummunity/customercase/view.do');
		$('#baseForm').submit();
		}

</script>
			<!-- sub_top -->
			<div class="sub_top sub_top03">
				<div class="inner">
					<h2>커뮤니티</h2>
					<p>케이잡스의 다양한 소식과 활동을 확인해 보세요.</p>
					<div class="path">
						<ul>
							<li>Home</li>
							<li>커뮤니티</li>
							<li>고객사례</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //sub_top -->

			<div class="mobile_path">
				<ul>
					<li><a href="/">HOME</a></li>
					<li>
						<a href="#">커뮤니티</a>
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
						<a href="#">고객사례</a>
						<div class="path_list">
							<ul>
								<li><a href="/front/sub/cummunity/activity/list.do">케이잡스 활동</a></li>
								<li><a href="/front/sub/cummunity/notice/list.do">공지 및 안내사항</a></li>
								<li><a href="/front/sub/cummunity/customercase/list.do">고객사례</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<!-- contents-->
			<div id="contents">
					<div class="sub_tab_area three">
						<ul>
							<li><a href="/front/sub/cummunity/activity/list.do">케이잡스 활동</a></li>
							<li><a href="/front/sub/cummunity/notice/list.do">공지 및 안내사항</a></li>
							<li><a href="/front/sub/cummunity/customercase/list.do" class="on">고객사례</a></li>
						</ul>
					</div>

					<div class="board_wrap">
						<form name="baseForm" id="baseForm" method="get" action="/front/sub/cummunity/customercase/view.do">
						<input type="hidden" name="bIdx" id="bIdx" value="${util:zeroConvert(info.bIdx) }" />
						<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>

							<div class="customerCase_list">
							<ul>
								<c:forEach var="result" items="${list}" varStatus="status">
									<li>
										<a href="#" onclick="fn_view('${util:zeroConvert(result.bIdx)}');">
											<div class="txt">
												<strong>${result.title }</strong>
												<span class="date">${fn:substring(result.regDate,0,10) }</span>
											</div>
											<div class="hover">
												<p>
													${util:cutString(util:removeTag(result.content), '...', 60) }
												</p>
												<span class="date">${fn:substring(result.regDate,0,10) }</span>
												<span class="arrow"></span>
											</div>
										</a>
									</li>
								</c:forEach>
							</ul>
							<div class="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page" />
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- //contents-->


