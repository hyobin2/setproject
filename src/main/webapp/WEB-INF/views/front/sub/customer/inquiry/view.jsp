<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">
	function fn_list(){
		$('#baseForm').attr('action', '/front/sub/customer/inquiry/list.do');
		$('#baseForm').submit();
	}
	function fn_view(iIdx){
		$('#baseForm').attr('action','/front/sub/customer/inquiry/view.do');
		$('#iIdx').val(iIdx)
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

			<!-- contents-->
			<div id="contents">
				<form name="baseForm" id="baseForm" method="post" action="/front/sub/customer/inquiry/view.do" enctype="multipart/form-data" >
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

						<div class="board_view">
							<div class="title">
								<h3>${info.title }</h3>
								<ul>
									<li><strong>작성일</strong> ${fn:substring(info.regDate, 0, 10) }</li>
									<li><strong>조회수</strong> ${info.hit}</li>
								</ul>
							</div>
							<div class="attach_file">
								<dl>
									<dt>첨부파일</dt>
									<dd><a href="${info.fileList[0].filepath }/${info.fileList[0].filename }" target="_blank">${info.fileList[0].filename }</a></dd>
									<dd><a href="${info.fileList[0].filepath }/${info.fileList[0].filename }" target="_blank">${info.fileList[1].filename }</a></dd>
								</dl>
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
									<c:if test="${info.iIdx > 0 }">
										<th scope="row"><span>▲</span> 이전글</th>
										<td><a href="#" onclick="fn_view('${info.iIdx - 1 }')">온디자인의 게시판 예시입니다 이전글 제목을 입력해주세요</a></td>
									</c:if>
									</tr>
									<tr>
										<th scope="row"><span>▼</span> 다음글</th>
										<td><a href="#" onclick="fn_view('${info.iIdx + 1 }')">온디자인의 게시판 예시입니다 다음글의 제목을 입력해주시길 바랍니다.</a></td>
									</tr>
								</table>
							</div>
						</div>

						<div class="btn_group">
							<div class="right">
								<a href="#" class="btn_style01">수정</a>
								<a href="#" class="btn_style01">삭제</a>
								<a href="#" onclick="fn_list()" class="btn_style02">목록보기</a>
							</div>
						</div>

					</div>
				</form>
			</div>
			<!-- //contents-->


<?php include "../../inc/footer.html" ?>