<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">
	function fn_list(){
		$('#baseForm').attr('action', '/front/sub/cummunity/customercase/list.do');
		$('#baseForm').submit();
	}
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
				<form name="baseForm" id="baseForm" method="get" action="/front/sub/cummunity/activity/view.do" enctype="multipart/form-data" >
				<input type="hidden" name="bIdx" id="bIdx" value="${util:zeroConvert(info.bIdx) }" />
				<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
				<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
					<div class="sub_tab_area three">
						<ul>
							<li><a href="/front/sub/cummunity/activity/list.do">케이잡스 활동</a></li>
							<li><a href="/front/sub/cummunity/notice/list.do">공지 및 안내사항</a></li>
							<li><a href="/front/sub/cummunity/customercase/list.do" class="on">고객사례</a></li>
						</ul>
					</div>

					<div class="board_wrap">

						<div class="board_view">
							<div class="title">
								<h3>${info.title }</h3>
									<ul>
										<li><strong>작성일</strong> ${fn:substring(info.regDate,0,10) }</li>
										<li><strong>조회수</strong> ${info.hit }</li>
									</ul>
							</div>
							<div class="attach_file">
								<c:if test="${info.fileclass != '' }">
									<dl>
										<dt>첨부파일</dt>
										<dd><a href="${info.fileList[0].filepath }/${info.fileList[0].filename }" target="_blank">${info.fileList[0].orgFilename }</a></dd>
									</dl>
								</c:if>
								<c:if test="${info.fileclass == '' }">
									<dl>
										<dt>첨부파일이 존재하지않습니다.</dt>
										<dd></dd>
										<dd></dd>
									</dl>
								</c:if>
							</div>
							<div class="cont">
								${info.content }
							</div>
							<div class="table_nextprev">
								<table>
									<caption class="hide"></caption>
									<colgroup>
										<col style="width:100px" />
										<col/>
									</colgroup>
									<tr>
									<th scope="row"><span>▲</span> 이전글</th>
										<td>
											<c:choose>
												<c:when test="${!empty prev  }">
													<a href="#" onclick="fn_view('${prev.bIdx}');">${prev.title }</a>
												</c:when>
												<c:otherwise>
													<a href="#;">이전글이 없습니다.</a>
												</c:otherwise>
											</c:choose>

										</td>
									</tr>
									<tr>
										<th scope="row"><span>▼</span> 다음글</th>
										<td>
											<c:choose>
												<c:when test="${!empty next  }">
													<a href="#" onclick="fn_view('${next.bIdx}');">${next.title }</a>
												</c:when>
												<c:otherwise>
													<a href="#;">다음글이 없습니다.</a>
												</c:otherwise>
											</c:choose>
											</td>
									</tr>
								</table>
							</div>
						</div>

						<div class="btn_group">
							<div class="right">
								<!-- <a href="#" class="btn_style01">수정</a>
								<a href="#" class="btn_style01">삭제</a> -->
								<a href="#" onclick="fn_list()" class="btn_style02">목록보기</a>
							</div>
						</div>

					</div>
				</form>
			</div>
			<!-- //contents-->


