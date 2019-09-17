<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">
	function fn_view(bIdx){
		$('#bIdx').val(bIdx);
		$('#baseForm').attr('action', '/front/sub/cummunity/activity/view.do');
		$('#baseForm').submit();
		}
	function fn_search(){
		$('#baseForm').attr('action', '/front/sub/cummunity/activity/list.do');
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
							<li>케이잡스 활동</li>
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
						<a href="#">케이잡스 활동</a>
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
						<li><a href="/front/sub/cummunity/activity/list.do" class="on">케이잡스 활동</a></li>
						<li><a href="/front/sub/cummunity/notice/list.do">공지 및 안내사항</a></li>
						<li><a href="/front/sub/cummunity/customercase/list.do">고객사례</a></li>
					</ul>
				</div>
					<form name="baseForm" id="baseForm" method="post" action="/front/sub/cummunity/activity/view.do" enctype="multipart/form-data" >
					<input type="hidden" name="bIdx" id="bIdx" value="${util:zeroConvert(info.bIdx) }" />
					<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
					<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
						<div class="board_wrap">

						<div class="board_search">
							<div class="total">
								총게시물 : <strong>${count }</strong>
							</div>
							<div class="search_form">

									<label for="searchTxt" class="hide">검색어 입력</label>
									<div><input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색어를 입력해주세요." /></div>
									<button onclick="fn_search()">검색</button>

							</div>
						</div>

						<div class="table_list">
							<table>
								<caption class="hide"></caption>
								<colgroup>
									<col style="width:7%" />
									<col/>
									<col style="width:10%" />
									<col style="width:10%" />
								</colgroup>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
								<c:forEach var="result" items="${list}" varStatus="status">
									<c:if test="${result.noticeYn=='Y'}">
										<tr class="notice_line">
											<td><span class="notice">공지</span></td>
											<td class="left"><a href="#" onclick="fn_view('${util:zeroConvert(result.bIdx)}');">${result.title }</a></td>
											<td>${fn:substring(result.regDate, 0, 10) }</td>
											<td>${result.hit }</td>
										</tr>
									</c:if>
								</c:forEach>
								<c:forEach var="result" items="${list}" varStatus="status">
									<tr>
										<td>${result.rnum}</td>
										<td class="left"><a href="#" onclick="fn_view('${util:zeroConvert(result.bIdx)}');">${result.title }</a></td>
										<td>${fn:substring(result.regDate, 0, 10) }</td>
										<td>${result.hit }</td>
									</tr>
								</c:forEach>
								<c:if test="${fn:length(list) <= 0 }">
									<tr>
										<td colspan="5">게시물이 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</div>

						<div class="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page" />
						</div>

					</div>
				</form>
			</div>
			<!-- //contents-->


