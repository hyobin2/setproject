<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html lang="KO">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/kor/css/reset.css"/>
	<style type="text/css">
		#wrapper{}
		#wrapper .error_top{overflow:hidden;}
		#wrapper .error_top .top{overflow:hidden;width:980px;margin:0 auto;}
		#wrapper .error_top .top div{float:left;width:50%;text-align:center;margin:65px 0 75px;}
		#wrapper .error_top .top div:first-child{border-right:1px solid #dcdcdc;margin-left:-1px;}
		#wrapper .error_mid{background:#f4f4f4;text-align:center;padding:55px 0;}
		#wrapper .error_bottom{text-align:center;margin-top:90px;}
		#wrapper .error_bottom a{margin:0 15px;}
	</style>
</head>
<body>
	<div id="wrapper">
		<div class="error_top">
			<div class="top">
				<div><img src="/kor/img/logo_error_01.png" alt="" /></div>
				<div><img src="/kor/img/logo_error_02.png" alt="" /></div>
			</div>
		</div>
		<div class="error_mid">
			<img src="/kor/img/error_500.png" alt="웹 사이트에서 페이지를 표시할 수 없습니다. A misconfiguration on the server caused a hiccup" />
		</div>
		<div class="error_bottom">
			<a href="/front/kor/index.do"><img src="/kor/img/bt_error_01.png" alt="한국어 메인으로 가기 Go to the Korea Website" /></a>
			<a href="/front/eng/index.do"><img src="/kor/img/bt_error_02.png" alt="영어 메인으로 가기 Go to the Korea Website" /></a>
		</div>
	</div>
</body>
</html>