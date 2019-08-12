<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>mobinus 관리자</title>
<script type="text/javascript" src="/resources/admin/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/resources/admin/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/admin/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/resources/admin/css/sub.css" />
<script type="text/javascript" src="/resources/admin/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/resources/admin/js/script.js"></script>
<script type="text/javascript" src="/resources/admin/js/mCmmFunction.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js" charset="utf-8"></script>
</head>
<body>
<div id="wrap">
	<tiles:insertAttribute name="HEADER" />
	<div id="s_con">
		<tiles:insertAttribute name="CONTENT" />
	</div>
	<div id="s_footer">
		<tiles:insertAttribute name="FOOTER" />
	</div>
</div>
</body>
</html>