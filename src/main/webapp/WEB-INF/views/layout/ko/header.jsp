<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<header id="header">
    <nav class="pc">
        <div class="header_wrap clear">
            <h1 class="logo"><a href="/ko/index.do">
                <img src="/resources/ko/images/logo.png" alt="모바인어스" class="default">
                <img src="/resources/ko/images/logo_w.png" alt="모바인어스" class="on">
            </a></h1>
            <ul class="gnb clear">
                <li class="depth01">
                    <a href="/ko/company/about.do"><span>회사소개</span></a>
                    <ul class="depth02">
                        <li><a href="/ko/company/about.do">㈜모바인어스</a></li>
                        <li><a href="/ko/company/ci.do">CI 소개</a></li>
                        <li><a href="/ko/company/contactus.do">오시는 길</a></li>
                    </ul>
                </li>
                <li class="depth01">
                    <a href="/ko/business/future.do"><span>사업분야</span></a>
                    <ul class="depth02">
                        <li><a href="/ko/business/future.do">The Future Fit</a></li>
                        <li><a href="/ko/business/arvrev.do">전시영상</a></li>
                    </ul>
                </li>
                <li class="depth01">
                    <a href="/ko/vrsports/vrsports.do"><span>가상현실스포츠실</span></a>
                    <ul class="depth02">
                    	<li><a href="/ko/vrsports/vrsports.do">가상현실스포츠실</a>
                    </ul>
                </li>
                <li class="depth01">
                    <a href="/ko/reference/futurefit/list.do"><span>레퍼런스</span></a>
                    <ul class="depth02">
                        <li><a href="/ko/reference/futurefit/list.do">The Future Fit</a></li>
                        <li><a href="/ko/reference/arvrev/list.do">전시영상</a></li>
                    </ul>
                </li>
                <li class="depth01">
                    <a href="/ko/inquiry/write.do"><span>고객문의</span></a>
                    <ul class="depth02">
                    	<li><a href="/ko/inquiry/write.do">비지니스상담</a>
                    </ul>
                </li>
            </ul>
            <div class="header_right">
                <ul class="language clear">
                    <li class="on"><a href="" target="_blank">KR</a></li>
                    <li><a href="" target="_blank">EN</a></li>
                </ul>
                <ul class="gnb_btn clear">
                    <li class="gnb_open"><button type="button"><img src="/resources/ko/images/gnb_open.png" alt="메뉴열기"></button></li>
                    <li class="gnb_close"><button type="button"><img src="/resources/ko/images/gnb_close.png" alt="메뉴닫기"></button></li>
                </ul>
            </div>
        </div>
        <div class="menu_bg"></div>
    </nav>
    <nav class="mobile">
        <div class="gnb">
            <div class="menu">
                <h3>회사소개</h3>
                <ul>
                    <li><a href="/ko/company/about.do">㈜모바인어스</a></li>
                    <li><a href="/ko/company/ci.do">CI 소개</a></li>
                    <li><a href="/ko/company/contactus.do">오시는 길</a></li>
                </ul>
            </div>
            <div class="menu">
                <h3>사업분야</h3>
                <ul>
                    <li><a href="/ko/business/future.do">The Future Fit</a></li>
                    <li><a href="/ko/business/arvrev.do">전시영상</a></li>

                </ul>
            </div>
            <div class="menu">
                <h3>가상현실스포츠실</h3>
                <ul>
                    <li><a href="/ko/vrsports/vrsports.do">가상현실스포츠실</a></li>
                </ul>
            </div>
            <div class="menu">
                <h3>레퍼런스</h3>
                <ul>
                    <li><a href="/ko/reference/futurefit/list.do">The Future Fit</a></li>
                    <li><a href="/ko/reference/arvrev/list.do">전시영상</a></li>
                </ul>
            </div>
            <div class="menu">
                <h3>고객문의</h3>
                <ul>
                    <li><a href="/ko/inquiry/write.do">고객문의</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="gnb_mask"></div>
</header>