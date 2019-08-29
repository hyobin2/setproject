
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">
function fn_mrite(mIdx) {
	$('#mIdx').val(mIdx);
	$('#memberForm').attr('action', '/adm/member/write.do');
	$('#memberForm').submit();
}
function fn_swrite(iIdx) {
	$('#sIdx').val(iIdx);
	$('#serviceForm').attr('action', '/adm/service/write.do');
	$('#serviceForm').submit();
}
function fn_qwrite(iIdx) {
	$('#qIdx').val(iIdx);
	$('#qnaForm').attr('action', '/adm/qna/write.do');
	$('#qnaForm').submit();

}
</script>
<!-- 신규 가입 회원 -->
<form id="memberForm" name="memberForm" method="post" action="/adm/member/index.do" >
	<input type="hidden" name="mIdx" id="mIdx" value="" />
	<input type="hidden" name="pageIndex" id="pageIndex" value="${paramMap.pageIndex }" />
	<div class="s_con_area">
		<div class="table_area">
			<div class="">
				<div class="board">
				<h1>◆  신규 가입 회원</h1><a href="/adm/member/list.do">+더보기</a>
				</div>
				<table summary="게시판" class="style5">
					<caption class="hide">게시판</caption>
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="10%">
						<col width="">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tbody>
						<tr>
							<th class="first">번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>주소</th>
							<th>가입일</th>
							<th>휴대폰</th>
							<th>이메일</th>
						</tr>
						<c:forEach var="result" items="${mList}" varStatus="status">
							<tr>
								<td>${result.rnum}</td>
								<td>${result.name }</td>
								<td>${result.id }</td>
								<td><a href="#" onclick="fn_mrite('${util:zeroConvert(result.mIdx)}'); return false;">${result.address }</a></td>
								<td>${fn:substring(result.regDate, 0, 10) }</td>
								<td>${result.phone }</td>
								<td>${result.email }</td>
							</tr>
						</c:forEach>
						<c:if test="${fn:length(mList) <= 0 }">
							<tr>
								<td colspan="5">게시물이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<!-- page -->
				<div class="paging">
					<ui:pagination paginationInfo="${mPaginationInfo}" type="image" jsFunction="fn_link_page" />
				</div>
				<!-- //page -->
			</div>
		</div>
	</div>
</form>

		<!-- 신규 고객 문의 -->
<form id="qnaForm" name="qnaForm" method="post" action="/adm/member/index.do" >
	<input type="hidden" name="iIdx" id="qIdx" value=""/>
	<input type="hidden" name="pageIndex" id="pageIndex" value="${paramMap.pageIndex }"/>
	<div class="s_con_area">
		<div class="table_area">
			<div class="">
				<div class="board">
				<h1>◆  신규 고객 문의(Q/A)</h1><a href="/adm/qna/list.do">+더보기</a>
				</div>
				<table summary="게시판" class="style5">
					<caption class="hide">게시판</caption>
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="">
						<col width="5%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tbody>
						<tr>
							<th class="first">번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>이름</th>
							<th>등록일</th>
							<th>비고</th>
						</tr>
						<c:forEach var="result" items="${qList}" varStatus="status">
							<tr>
								<td>${result.rnum}</td>
								<td>${result.division }</td>
								<td><a href="#" onclick="fn_qwrite('${util:zeroConvert(result.iIdx)}'); return false;">${result.title }</a></td>
								<td>${result.name }</td>
								<td>${fn:substring(result.regDate,0,10) }</td>
								<c:choose>
                        			<c:when test="${result.replyYn == 'Y'}"><td>완료</td></c:when>
	                        		<c:otherwise><td>대기</td></c:otherwise>
	                        	</c:choose>

							</tr>
						</c:forEach>
						<c:if test="${fn:length(qList) <= 0 }">
							<tr>
								<td colspan="5">게시물이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<!-- page -->
				<div class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page" />
				</div>
				<!-- //page -->
			</div>

		</div>
	</div>
</form>
		<!-- 서비스접수 -->
<form id="serviceForm" name="serviceForm" method="post" action="/adm/member/index.do" >
	<input type="hidden" name="iIdx" id="sIdx" value=""/>
	<input type="hidden" name="pageIndex" id="pageIndex" value="${paramMap.pageIndex }"/>
	<div class="s_con_area">
		<div class="table_area">
			<div class="">
				<div class="board">
				<h1>◆서비스 접수</h1><a href="/adm/service/list.do">+더보기</a>
				</div>
				<table summary="게시판" class="style5">
					<caption class="hide">게시판</caption>
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="">
						<col width="5%">
						<col width="10%">
						<col width="5%">
					</colgroup>
					<tbody>
						<tr>
							<th class="first">번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>이름</th>
							<th>등록일</th>
							<th>비고</th>
						</tr>
						<c:forEach var="result" items="${sList}" varStatus="status">
							<tr>
								<td>${result.rnum}</td>
								<td>${result.division}</td>
								<td><a href="#" onclick="fn_swrite('${util:zeroConvert(result.iIdx)}'); return false;">${result.title }</a></td>
								<td>${result.regName }</td>
								<td>${fn:substring(result.regDate,0,10) }</td>
								<c:choose>
	                        		<c:when test="${result.replyYn == 'Y'}"><td>완료</td></c:when>
	                        		<c:otherwise><td>대기</td></c:otherwise>
		                        </c:choose>

							</tr>
						</c:forEach>
						<c:if test="${fn:length(sList) <= 0 }">
							<tr>
								<td colspan="5">게시물이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<!-- page -->
				<div class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page" />
				</div>
				<!-- //page -->
			</div>
		</div>
	</div>
</form>

