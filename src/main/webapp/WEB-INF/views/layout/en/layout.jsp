<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<tiles:insertAttribute name="HEADER" />
	<tiles:insertAttribute name="CONTENT" />
	<tiles:insertAttribute name="FOOTER" />
</body>
</html>