<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="/resources/ko/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/ko/css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ko/css/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/ko/css/style.css">
    <script type="text/javascript" src="/resources/ko/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="/resources/ko/js/swiper.js"></script>
    <script type="text/javascript" src="/resources/ko/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/ko/js/effect.js"></script>
    <script type="text/javascript" src="/resources/ko/js/main.js"></script>
    <script type="text/javascript" src="/resources/ko/js/TweenMax.min.js"></script>
    <script type="text/javascript" src="/resources/ko/js/mCmmFunction.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
    <title>Mobinus | 모바인어스</title>
</head>
<body ${paramMap.menuId == 'index'? 'class="main"':'' }>
    <div id="wrap">
		<tiles:insertAttribute name="HEADER" />
		<tiles:insertAttribute name="CONTENT" />
		<tiles:insertAttribute name="FOOTER" />
	</div>
</body>
</html>