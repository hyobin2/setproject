<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">
	function fn_view(iIdx){
		$('#iIdx').val(iIdx);
		$('#baseForm').attr('action', '/front/sub/customer/inquiry/view.do');
		$('#baseForm').submit();
		}
	function fn_search(){
		$('#searchKeyword').val($('#searchTxt').val());
		$('#baseForm').attr('action', '/front/sub/customer/inquiry/list.do');
		$('#baseForm').submit();
	}
</script>
			<!-- sub_top -->
			<div class="sub_top sub_top05">
				<div class="inner">
					<h2>고객지원</h2>
					<p>케이잡스는 고객 만족을 위해 최선을 다합니다.</p>
					<div class="path">
						<ul>
							<li>Home</li>
							<li>고객지원</li>
							<li>고객문의</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //sub_top -->

			<div class="mobile_path">
				<ul>
					<li><a href="/">HOME</a></li>
					<li>
						<a href="#">고객지원</a>
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
						<a href="#">고객문의</a>
						<div class="path_list">
							<ul>
								<li><a href="/front/sub/customer/inquiry/list.do">고객문의</a></li>
								<li><a href="/front/sub/customer/service/list.do">서비스 신청 및 접수</a></li>
								<li><a href="/front/sub/customer/location/location.do">오시는길</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<!-- contents-->
			<div id="contents">
				<form name="baseForm" id="baseForm" method="get" action="/front/sub/cummunity/inquiry/view.do">
				<input type="hidden" name="iIdx" id="iIdx" value="${util:zeroConvert(info.iIdx) }" />
				<input type="hidden" name="fileclass" id="fileclass" value="${info.fileclass }" />
				<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
				<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
				<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />

					<div class="sub_tab_area three">
						<ul>
							<li><a href="../inquiry/list.do" class="on">고객문의</a></li>
							<li><a href="../service/list.do">서비스 신청 및 접수</a></li>
							<li><a href="../location/location.do">오시는 길</a></li>
						</ul>
					</div>

					<div class="board_wrap">

						<div class="board_search">
							<div class="total">
								총게시물 : <strong>${count }</strong>
							</div>
							<div class="search_form">
									<label for="searchTxt" class="hide">검색어 입력</label>
									<div><input type="text" name="" id="searchTxt" placeholder="검색어를 입력해주세요." /></div>
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
									<tr>
										<td>${result.rnum}</td>
										<td class="left"><a href="#" onclick="fn_view('${util:zeroConvert(result.iIdx)}');">${result.title }</a></td>
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

						<div class="btn_group">
							<div class="right">
								<a href="/front/sub/customer/inquiry/write.do" class="btn_style02">글쓰기</a>
							</div>
						</div>

						<div class="paging">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page" />
						</div>

					</div>
				</form>
			</div>
			<!-- //contents-->


