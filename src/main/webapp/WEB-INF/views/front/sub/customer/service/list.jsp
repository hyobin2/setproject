<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">
	function fn_view(iIdx){
		$('#iIdx').val(iIdx);
		$('#baseForm').attr('action', '/front/sub/customer/service/view.do');
		$('#baseForm').submit();
		}
	function fn_search(){
		$('#baseForm').attr('action', '/front/sub/customer/service/list.do');
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
								<li><a href="/front/sub/hyobin/greetings.do">K·Jobs</a></li>
								<li><a href="/front/sub/business/business01_01.do">사업분야</a></li>
								<li><a href="/front/sub/cummunity/activity/list.do">커뮤니티</a></li>
								<li><a href="/front/sub/incruit/list.do">채용정보</a></li>
								<li><a href="/front/sub/customer/inquiry/list.do">고객지원</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#">서비스 신청 및 접수</a>
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
				<form name="baseForm" id="baseForm" method="get" action="/front/sub/cummunity/service/view.do" >
				<input type="hidden" name="iIdx" id="iIdx" value="${util:zeroConvert(info.iIdx) }" />
				<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
					<div class="sub_tab_area three">
						<ul>
							<li><a href="/front/sub/customer/inquiry/list.do" >고객문의</a></li>
							<li><a href="/front/sub/customer/service/list.do" class="on"> 서비스 신청 및 접수</a></li>
							<li><a href="/front/sub/customer/location/location.do">오시는 길</a></li>
						</ul>
					</div>

					<div class="board_wrap">

						<div class="survice_list_top">
							<p>
								케이잡스가 제공하는 다양한 서비스들을 신청해 보세요. <br />
								최고의 서비스로 고객만족을 이끌어 내겠습니다.
							</p>
							<a href="/front/sub/customer/service/write.do" class="btn_service">서비스 신청하기</a>
						</div>

						<div class="board_search">
							<div class="total">
								총게시물 : <strong>${count }</strong>
							</div>
							<div class="search_form">
									<label for="searchTxt" class="hide">검색어 입력</label>
									<div><input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색어를 입력해주세요." value="${paramMap.searchKeyword }"/></div>
									<button onclick="fn_search();">검색</button>
							</div>
						</div>

						<div class="table_list">
							<table>
								<caption class="hide"></caption>
								<colgroup>
									<col style="width:7%" />
									<col style="width:15%" />
									<col/>
									<col style="width:10%" />
									<col style="width:10%" />
									<col style="width:7%" />
								</colgroup>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">구분</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">작성자</th>
									<th scope="col">상태</th>
								</tr>
								<c:forEach var="result" items="${list}" varStatus="status">
									<tr>
										<td>${result.rnum}</td>
										<td>${result.division }</td>
										<td class="left">
										<c:choose>
											<c:when test="${loginMap.id == result.regId}">
												<a href="#" onclick="fn_view('${util:zeroConvert(result.iIdx)}');">
													${result.title }
												</a>		
											</c:when>
											<c:otherwise>
												<a href="#" onclick="alert('자신의글만 열람 할 수 있습니다.'); return false;">
													${result.title }
													<img src="/resources/front/img/ico_lock.png" alt="비밀글">
												</a>
											</c:otherwise>
										</c:choose> 
										</td>
										<td>${fn:substring(result.regDate, 0, 10) }</td>
										<td>${fn:substring(result.regName,0,1) }**</td>
										<c:if test="${result.replyYn=='Y' }">
											<td><span class="end">완료</span></td>
										</c:if>
										<c:if test="${result.replyYn=='N' }">
											<td><span class="ing">진행중</span>
										</c:if>
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


