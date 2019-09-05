<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<div id="header">
    <!--좌측메뉴 시작-->
    <!-- <div class="btn"></div>
    <div onclick="history.back();" class="page_cover"></div>
    <div id="menu">
        <div onclick="history.back();" class="close"></div>
        <div class="s_title"><span>담당자 관리</span></div>
        <div class="sub_menu">
        	<ul>
            	<li><a href="../member/list.do" class="active">담당자 관리</a></li>
            </ul>
        </div>
    </div> -->
    <!--좌측메뉴 끝-->
    <div class="gnb">
        <div class="in">
            <h1><a href="/adm/member/list.do"><img src="/resources/admin/img/sub/sub_logo.png" alt="로고" /></a></h1>
          <ul>
          		<li class="sub001"> <a href="/adm/member/list.do">회원관리</a>
          		<ul class="gnb_sub"></ul>
                <li class="sub002"> <a href="/adm/activity/list.do">게시판</a>
               		<ul class="gnb_sub">
               			<li ><a href="/adm/activity/list.do">케이잡스 활동</a></li>
               			<li ><a href="/adm/notice/list.do">공지 및 안내</a></li>
               			<li ><a href="/adm/customer/list.do">고객사례</a></li>
               		</ul>
               	</li>
               	<li class="sub003"> <a href="/adm/hire/list.do">채용관리</a>
               	<ul class="gnb_sub"></ul>
                </li>
                <li class="sub004"> <a href="/adm/qna/list.do">문의관리</a>
                	<ul class="gnb_sub">
                		<li><a href="/adm/qna/list.do">고객문의(Q/A)</a>
                		<li><a href="/adm/service/list.do">서비스 접수</a>
                	</ul>
                </li>
                <li class="sub005"> <a href="/adm/popup/list.do?pCode=POP01">홈페이지관리</a>
                	<ul class="gnb_sub">
                		<li><a href="/adm/popup/list.do?pCode=POP01">팝업관리</a>
                		<li><a href="/adm/banner/list.do?pCode=POP02">배너관리</a>

                	</ul>
                </li>
            </ul>
            <div class="admin_info">
                <ul>
                    <li><img src="/resources/admin/img/sub/admin_icon.png" alt="icon" />&nbsp;${util:session().id }&nbsp;( ${util:session().name } )</li>
                    <li><a href="/adm/member/logout.do"><img src="/resources/admin/img/sub/logout_icon.png" alt="로그아웃" /></a></li>
                </ul>
            </div>
        </div>
        <div class="bg"></div>
    </div>
</div>
