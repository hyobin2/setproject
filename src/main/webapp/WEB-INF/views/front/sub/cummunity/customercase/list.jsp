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
	function fn_search(){
		$('#searchKeyword').val($('#searchTxt').val());
		$('#baseForm').attr('action', '/front/sub/cummunity/customercase/list.do');
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

			<!-- contents-->
			<div id="contents">
				<form name="baseForm" id="baseForm" method="post" action="/front/sub/cummunity/customercase/view.do" enctype="multipart/form-data" >
				<input type="hidden" name="bIdx" id="bIdx" value="${util:zeroConvert(info.bIdx) }" />
				<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
				<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
				<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
				<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />
					<div class="sub_tab_area three">
						<ul>
							<li><a href="../activity/list.do">케이잡스 활동</a></li>
							<li><a href="../notice/list.do">공지 및 안내사항</a></li>
							<li><a href="../customercase/list.do" class="on">고객사례</a></li>
						</ul>
					</div>

					<div class="board_wrap">

						<div class="customercase_list">
							<c:forEach var="result" items="${list}" varStatus="status">
								<ul>
									<li>
										<a href="#" onclick="fn_view('${util:zeroConvert(result.bIdx)}');">
											<div class="txt">
												<strong>${result.title }</strong>
												<span class="date">${fn:substring(result.regdate,0,10) }</span>
											</div>
											<div class="hover">
												<p>
													${fn:substring(result.content,0,20) }
												</p>
												<span class="date">2018-00-00</span>
												<span class="arrow"></span>
											</div>
										</a>
									</li>
								</ul>
							</c:forEach>
							<a href="#" class="more_view">더보기 +</a>
						</div>
					</div>
				</form>
			</div>
			<!-- //contents-->


<?php include "../../inc/footer.html" ?>