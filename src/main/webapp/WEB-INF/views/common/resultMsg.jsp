<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<!doctype html>
<html>
<head>


</head>
<body>
	<form name="baseForm" id="baseForm" method="get" action="${callBackUrl }" >
		<input type="hidden" name="pageIndex" value="${paramMap.pageIndex }"/>
		<input type="hidden" name="searchCondition" id="searchCondition" value="${paramMap.searchCondition }" />
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="${paramMap.searchKeyword }" />
	</form>
</body>
	<c:if test="${!empty resultMsg }">
		<script type="text/javascript">
			alert('${resultMsg}');
		</script>
	</c:if>
	<c:if test="${!empty callBackUrl }">
		<script type="text/javascript">
			document.baseForm.action = '${callBackUrl }';
			document.baseForm.submit();
		</script>
	</c:if>
</html>