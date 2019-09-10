<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html lang="KO">
<head>
	<meta charset="utf-8">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link rel="stylesheet" href="/resources/front/css/reset.css">
	<link rel="stylesheet" href="/resources/front/css/style.css">
	<script src="/resources/front/js/jquery-1.9.1.min.js"></script>
	<script src="/resources/front/js/jquery.easing.1.3.js"></script>
	<script src="/resources/front/js/jquery.bxslider.js"></script>
	<script src="/resources/front/js/script.js"></script>
	<script src="/resources/front/js/respond.src.js"></script>
	<title>kjobs</title>
</head>
<body>
	<div id="wrap">
		<tiles:insertAttribute name="HEADER" />
		<tiles:insertAttribute name="CONTENT" />
		<tiles:insertAttribute name="FOOTER" />
	</div>