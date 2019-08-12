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
            <h1><a href="/adm/popup/list.do"><img src="/resources/admin/img/sub/sub_logo.png" alt="로고" /></a></h1>
          <ul>
                <li class="sub001"> <a href="/adm/now/list.do">Now</a></li>
                <li class="sub002"> <a href="/adm/history/list.do">연혁</a></li>
                <li class="sub003"> <a href="#">레퍼런스</a>
                    <ul class="gnb_sub">
                        <li><a href="/adm/reference/futurefit/list.do">The Future Fit</a></li>
                        <li><a href="/adm/reference/arvrev/list.do">AR·VR·EV</a></li>
                    </ul>
                </li> <li class="sub004"><a href="/adm/inquiry/list.do">고객문의</a></li>
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
