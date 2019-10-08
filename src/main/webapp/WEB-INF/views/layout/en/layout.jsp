<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html lang="KO">
<head>
	<meta charset="utf-8">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link rel="stylesheet" href="/resources/en/css/reset.css">
	<link rel="stylesheet" href="/resources/en/css/style.css">
	<script src="/resources/en/js/jquery-1.9.1.min.js"></script>
	<script src="/resources/en/js/jquery.easing.1.3.js"></script>
	<script src="/resources/en/js/jquery.bxslider.js"></script>
	<script src="/resources/en/js/script.js"></script>
	<script src="/resources/en/js/respond.src.js"></script>
	<script type="text/javascript" src="/resources/en/js/mCmmFunction.js"></script>
	<title>hyobin</title>
</head>
<body>
	<div id="wrap">
		<tiles:insertAttribute name="HEADER" />
		<div id="container">
			<tiles:insertAttribute name="CONTENT" />
		</div>
		<tiles:insertAttribute name="FOOTER" />
	</div>
</body>
</html>