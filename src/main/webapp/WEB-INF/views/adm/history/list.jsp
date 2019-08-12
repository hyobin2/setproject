<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script type="text/javascript">


function fn_write(hIdx) {
	$('#hIdx').val(hIdx);
	$('#baseForm').attr('action', '/adm/history/write.do');
	$('#baseForm').submit();
}

function fn_link_page(pageNo){
	$('#pageIndex').val(pageNo);
	$('#baseForm').attr('action', '/adm/history/list.do');
	$('#baseForm').submit();
}

function fn_search_page(){
	$('#pageIndex').val(1);
	$('#baseForm').attr('action', '/adm/history/list.do');
	$('#baseForm').submit();
}

</script>

    <div class="s_con_area">
       	<h1>연혁</h1>
       	<div class="location">
       		<span>Home  &gt; <strong>연혁</strong></span>
       	</div>
       	<form name="baseForm" id="baseForm" method="get" action="/adm/history/list.do" >
		<input type="hidden" name="hIdx" id="hIdx" value=""/>
		<input type="hidden" name="pageIndex" id="pageIndex" value="${paramMap.pageIndex }"/>

       	<div class="table_area">
            <div class="">
                <div class="board">
				<!-- 검색박스 -->
               	<div class="search_area">
		        	<select id="searchCondition" name="searchCondition">
						<option value="0" ${paramMap.searchCondition == 0 ? 'selected="selected"':'' } >전체</option>
						<option value="1" ${paramMap.searchCondition == 1 ? 'selected="selected"':'' }>년도</option>
						<option value="2" ${paramMap.searchCondition == 2 ? 'selected="selected"':'' }>내용</option>
					</select>
					<input type="text" id="searchKeyword" name="searchKeyword" value="${paramMap.searchKeyword }" title="검색어를 입력하세요." />
					<input type="button" class="btn_search" title="검색" onclick="fn_search_page(); return false;" />
		        </div>
				<table summary="게시판" class="style5">
				<caption class="hide">게시판</caption>
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="5%">
						<col width="">
						<col width="10%">
					</colgroup>
					<tbody>
						<tr>
							<th class="first">번호</th>
							<th>년도/월</th>
							<th>정렬순서</th>
							<th>내용</th>
							<th>등록일</th>
						</tr>
							<c:forEach var="result" items="${list}" varStatus="status">
								<tr>
									<td>${result.rnum}</td>
									<td>${result.year}/${result.month }</td>
									<td>${result.hOrder}</td>
			                        <td class="t_left"><a href="#" onclick="fn_write('${util:zeroConvert(result.hIdx)}'); return false;">${result.content }</a></td>
			                        <td>${fn:substring(result.regDate, 0, 10) }</td>
			                    </tr>
							</c:forEach>
							<c:if test="${fn:length(list) <= 0 }">
								<tr>
									<td colspan="5">게시물이 없습니다.</td>
								</tr>
							</c:if>
					</tbody>
                </table>

                <!-- 버튼 -->
            	<div class="btn_area">
            	  	<input type="button" value="등록" class="r_btn_green" style="width:70px;" onclick="fn_write(''); return false;"/>
                </div>
                <!-- //버튼 -->

				<!-- page -->
				<div class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_link_page"  />
				</div>
				<!-- //page -->
			</div>

            </div>
        </div>
        </form>
    </div>


